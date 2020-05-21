#include "main.h"

void app_main(void)
{
#define size 81
    setup_leds(size / 9);

    unsigned int data[size] = {0};

    set_strip(data);
    vTaskDelay(500 / portTICK_PERIOD_MS);
    while (1)
    {

        for (unsigned char col = 0; col < 9; col++)
        {
            if (esp_random() * 1.0 / UINT_MAX < 0.1)
            {
                data[col] = esp_random() & 0xffffff;
            }
            else
            {
                data[col] = 0;
            }
        }

        set_strip(data);
        vTaskDelay(200 / portTICK_PERIOD_MS);

        for (unsigned char col = 0; col < 9; col++)
        {
            for (unsigned char row = 8; row > 0; row--)
            {
                data[row * 9 + col] = data[(row - 1) * 9 + col];
            }
        }
    }
}