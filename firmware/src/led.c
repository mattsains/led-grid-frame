#include "led.h"

static const unsigned char pins[3] = {LED_1_DAT, LED_2_DAT, LED_3_DAT};

void setup_leds()
{
    for (unsigned char i = 0; i < 3; i++)
    {
        rmt_config_t config = {
            .rmt_mode = RMT_MODE_TX,
            .channel = i,
            .clk_div = 1,
            .gpio_num = pins[i],
            .mem_block_num = 1,
            .tx_config = {
                .carrier_freq_hz = 0,
                .carrier_level = RMT_CARRIER_LEVEL_HIGH,
                .idle_level = RMT_IDLE_LEVEL_LOW,
                .carrier_duty_percent = 33,
                .carrier_en = false,
                .loop_en = false,
                .idle_output_en = true,
            }};

        rmt_config(&config);
        rmt_driver_install(i, 0, 0);
    }
}

void deallocate_tx_buffer(rmt_channel_t channel, void *buffer)
{
    free(buffer);
}

void set_strip(unsigned int *data, size_t num_rows)
{
    rmt_item32_t *outBuffers[3];
    for (unsigned char i = 0; i < 3; i++)
    {
        outBuffers[i] = malloc((24 * num_rows + 1) * sizeof(rmt_item32_t));
    }
    ESP_LOGI("led", "done allocating");

    for (size_t row = 0; row < num_rows; row++)
    {
        for (unsigned char column = 0; column < 3; column++)
        {
            printf("pixel %d %d is #", column, row);
            unsigned int pixel = data[column + row * 3];
            printf("%x", pixel);

            for (unsigned char bit = 0; bit < 24; bit++)
            {
                if (pixel && (1 << bit) != 0)
                {
                    outBuffers[column][row * 24 + bit] = (rmt_item32_t){{{65, 1, 36, 0}}};
                }
                else
                {
                    outBuffers[column][row * 24 + bit] = (rmt_item32_t){{{32, 1, 69, 0}}};
                }
            }
            printf("\n");
        }
    }

    for (unsigned char i = 0; i < 3; i++)
    {
        outBuffers[i][num_rows * 24 / 3] = (rmt_item32_t){{{2419, 0, 2419, 0}}};

        rmt_register_tx_end_callback(&deallocate_tx_buffer, outBuffers[i]);
        rmt_write_items(i, outBuffers[i], num_rows * 24 / 3 + 1, false);
    }
}