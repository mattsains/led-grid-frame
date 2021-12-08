#include "main.h"
#include "wifi_pass.h"

EventGroupHandle_t mustRedraw;
EventGroupHandle_t readyForNewMessage;
static unsigned int ingested[513] = {0};

void app_main(void)
{
    mustRedraw = xEventGroupCreate();
    readyForNewMessage = xEventGroupCreate();
    xEventGroupSetBits(mustRedraw, 1);
    xEventGroupSetBits(readyForNewMessage, 1);

    static httpd_handle_t server = NULL;

    ESP_ERROR_CHECK(nvs_flash_init());
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());

    wifi_connect();

    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &connect_handler, &server));
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, WIFI_EVENT_STA_DISCONNECTED, &disconnect_handler, &server));

    TaskHandle_t Core1TaskHnd2;
    xTaskCreatePinnedToCore(ledUpdate, "led_update", 2000, NULL, 1, &Core1TaskHnd2, 1);
}

void ledUpdate() {
    setup_leds();
    while (true) {
        EventBits_t result = xEventGroupWaitBits(mustRedraw, 1, true, false, 100000);
        if (result > 0)
            set_strip(ingested);
    }
}

static unsigned int position = 0;
static esp_err_t led_handler(httpd_req_t *req)
{
    static unsigned char data[513 * 4] = {0};
    while (xEventGroupWaitBits(readyForNewMessage, 1, true, false, 10000) == 0) ;

    httpd_ws_frame_t ws_pkt;
    memset(&ws_pkt, 0, sizeof(httpd_ws_frame_t));
    ws_pkt.payload = data;
    ws_pkt.type = HTTPD_WS_TYPE_BINARY;
    
    esp_err_t ret = httpd_ws_recv_frame(req, &ws_pkt, 513 * 4);
    
    if (ret != ESP_OK) {
        ESP_LOGE("led_handler", "httpd_ws_recv_frame failed with %d", ret);
    } else {
        for (unsigned int i = 0; i< ws_pkt.len;) {
            unsigned int spaceLeftInData = 513 * 4 - position;
            unsigned int bytesToFetch;
            if (ws_pkt.len - i < spaceLeftInData)
                bytesToFetch = ws_pkt.len;
            else bytesToFetch = spaceLeftInData;
            memcpy(ingested + position, data + i, bytesToFetch);
            i += bytesToFetch;
            position += bytesToFetch;
            spaceLeftInData -= bytesToFetch;
            if (spaceLeftInData == 0) {
                position = 0;
                xEventGroupSetBits(mustRedraw, 1);
            }
        }
        
    }
    xEventGroupSetBits(readyForNewMessage, 1);
    return ESP_OK;
}

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

