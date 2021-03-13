#include "main.h"
#include "wifi_pass.h"

static SemaphoreHandle_t writing = NULL;
static unsigned int ingested[513] = {0};

void app_main(void)
{
    setup_leds();
    writing = xSemaphoreCreateBinary();
    xSemaphoreGive(writing);

    static httpd_handle_t server = NULL;

    ESP_ERROR_CHECK(nvs_flash_init());
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());

    wifi_connect();

    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &connect_handler, &server));
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, WIFI_EVENT_STA_DISCONNECTED, &disconnect_handler, &server));

    // TaskHandle_t Core1TaskHnd;
    // xTaskCreatePinnedToCore(ledUpdate, "led_update", 1000, NULL, 1, &Core1TaskHnd, 1);
    ledUpdate();
}

void ledUpdate() {
    while (true) {
        // if (xSemaphoreTake(writing, portMAX_DELAY) == pdTRUE) {
            set_strip(ingested);
            // xSemaphoreGive(writing);
        // } else {
            // ESP_LOGI("main", "failed to get semaphore from main loop");
        // }
        vTaskDelay(100 / portTICK_PERIOD_MS);
    }
}

static unsigned int data[513] = {0};
static unsigned int frame = 0;
static esp_err_t led_handler(httpd_req_t *req)
{
    frame++;
    httpd_ws_frame_t ws_pkt;
    memset(&ws_pkt, 0, sizeof(httpd_ws_frame_t));
    ws_pkt.payload = (uint8_t *) data;
    ws_pkt.type = HTTPD_WS_TYPE_BINARY;
    vTaskDelay(10 / portTICK_PERIOD_MS); // https://www.esp32.com/viewtopic.php?f=2&t=17510&start=10

    esp_err_t ret = httpd_ws_recv_frame(req, &ws_pkt, 513 * 4);
    if (ret != ESP_OK) {
        ESP_LOGE("led_handler", "%d: httpd_ws_recv_frame failed with %d", frame, ret);
        return ret;
    }
    ESP_LOGI("led_handler", "%d: Got packet with message: %s (len: %d)", frame, ws_pkt.payload, ws_pkt.len);    

    if (ret != ESP_OK) {
        ESP_LOGE("led_handler", "%d: httpd_ws_send_frame failed with %d", frame, ret);
    } else {
        if (!ws_pkt.final) {
            ESP_LOGE("led_handler", "%d: frame was not marked as final", frame);
            return ESP_OK;
        }
        if (ws_pkt.len != 513 * 4) {
            ESP_LOGE("led_handler", "%d: expected length %d but was %d", frame, 513*4, ws_pkt.len);
            return ESP_OK;
        }
        // if (xSemaphoreTake(writing, 1000) == pdTRUE) {
            memcpy(ingested, data, 513 * 4);
        //     xSemaphoreGive(writing);
        // } else {
        //     ESP_LOGI("main", "failed to get semaphore");
        // }
    }
    return ESP_OK;
}

#define WIFI_CONNECTED_BIT BIT0
#define WIFI_FAIL_BIT      BIT1
static EventGroupHandle_t s_wifi_event_group;
static int s_retry_num = 0;
static void wifi_event_handler(void* arg, esp_event_base_t event_base,
                                int32_t event_id, void* event_data)
{
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
    } else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        if (s_retry_num < 3) {
            esp_wifi_connect();
            s_retry_num++;
            ESP_LOGI("wifi_event_handler", "retry to connect to the AP");
        } else {
            // xEventGroupSetBits(s_wifi_event_group, WIFI_FAIL_BIT);
        }
        ESP_LOGI("wifi_event_handler","connect to the AP fail");
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t* event = (ip_event_got_ip_t*) event_data;
        ESP_LOGI("wifi_event_handler", "got ip:" IPSTR, IP2STR(&event->ip_info.ip));
        s_retry_num = 0;
        // xEventGroupSetBits(s_wifi_event_group, WIFI_CONNECTED_BIT);
    }
}

static void wifi_connect() {
    esp_netif_create_default_wifi_sta();
    
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    esp_event_handler_instance_t instance_any_id;
    esp_event_handler_instance_t instance_got_ip;
    ESP_ERROR_CHECK(esp_event_handler_instance_register(WIFI_EVENT,
                                                        ESP_EVENT_ANY_ID,
                                                        &wifi_event_handler,
                                                        NULL,
                                                        &instance_any_id));
    ESP_ERROR_CHECK(esp_event_handler_instance_register(IP_EVENT,
                                                        IP_EVENT_STA_GOT_IP,
                                                        &wifi_event_handler,
                                                        NULL,
                                                        &instance_got_ip));

    wifi_config_t wifi_config = {
        .sta = {
            .ssid = WIFI_SSID,
            .password = WIFI_PASS,
            /* Setting a password implies station will connect to all security modes including WEP/WPA.
             * However these modes are deprecated and not advisable to be used. Incase your Access point
             * doesn't support WPA2, these mode can be enabled by commenting below line */
	        .threshold.authmode = WIFI_AUTH_WPA2_PSK,

            .pmf_cfg = {
                .capable = true,
                .required = false
            },
        },
    };
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA) );
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_config) );
    ESP_ERROR_CHECK(esp_wifi_start() );

     ESP_LOGI("wifi_connect", "wifi_init_sta finished.");

    /* Waiting until either the connection is established (WIFI_CONNECTED_BIT) or connection failed for the maximum
     * number of re-tries (WIFI_FAIL_BIT). The bits are set by event_handler() (see above) */
    // EventBits_t bits = xEventGroupWaitBits(s_wifi_event_group,
    //         WIFI_CONNECTED_BIT | WIFI_FAIL_BIT,
    //         pdFALSE,
    //         pdFALSE,
    //         portMAX_DELAY);

    // /* xEventGroupWaitBits() returns the bits before the call returned, hence we can test which event actually
    //  * happened. */
    // if (bits & WIFI_CONNECTED_BIT) {
    //     ESP_LOGI("wifi_connect", "connected to ap SSID:%s",
    //              WIFI_SSID);
    // } else if (bits & WIFI_FAIL_BIT) {
    //     ESP_LOGI("wifi_connect", "Failed to connect to SSID:%s",
    //              WIFI_SSID);
    // } else {
    //     ESP_LOGE("wifi_connect", "UNEXPECTED EVENT");
    // }

    // /* The event will not be processed after unregister */
    // ESP_ERROR_CHECK(esp_event_handler_instance_unregister(IP_EVENT, IP_EVENT_STA_GOT_IP, instance_got_ip));
    // ESP_ERROR_CHECK(esp_event_handler_instance_unregister(WIFI_EVENT, ESP_EVENT_ANY_ID, instance_any_id));
    // vEventGroupDelete(s_wifi_event_group);
}


static void connect_handler(void* arg, esp_event_base_t event_base,
                            int32_t event_id, void* event_data)
{
    httpd_handle_t* server = (httpd_handle_t*) arg;
    if (*server == NULL) {
        ESP_LOGI("connect_handler", "Starting webserver");
        *server = start_webserver();
    }
}

static void disconnect_handler(void* arg, esp_event_base_t event_base,
                               int32_t event_id, void* event_data)
{
    httpd_handle_t* server = (httpd_handle_t*) arg;
    if (*server) {
        ESP_LOGI("disconnect_handler", "Stopping webserver");
        stop_webserver(*server);
        *server = NULL;
    }
}

static const httpd_uri_t ws = {
        .uri        = "/",
        .method     = HTTP_GET,
        .handler    = led_handler,
        .user_ctx   = NULL,
        .is_websocket = true
};

static httpd_handle_t start_webserver(void)
{
    httpd_handle_t server = NULL;
    httpd_config_t config = HTTPD_DEFAULT_CONFIG();

    // Start the httpd server
    ESP_LOGI("start_webserver", "Starting server on port: '%d'", config.server_port);
    if (httpd_start(&server, &config) == ESP_OK) {
        // Registering the ws handler
        ESP_LOGI("start_webserver", "Registering URI handlers");
        httpd_register_uri_handler(server, &ws);
        return server;
    }

    ESP_LOGI("start_webserver", "Error starting server!");
    return NULL;
}

static void stop_webserver(httpd_handle_t server)
{
    // Stop the httpd server
    httpd_stop(server);
}

