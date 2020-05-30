#include "main.h"

void app_main(void)
{
#define size 162
    setup_leds(size / 9);

    unsigned int data[size] = {0};

    set_strip(data);
    vTaskDelay(500 / portTICK_PERIOD_MS);
    while (1)
    {

        for (unsigned char row = 0; row < 9; row++)
        {
            if (esp_random() * 1.0 / UINT_MAX < 0.1)
            {
                data[8 + row * 9] = esp_random() & 0xffffff;
            }
            else
            {
                data[8 + row * 9] = 0;
            }
        }

        set_strip(data);
        vTaskDelay(200 / portTICK_PERIOD_MS);

        for (unsigned col = 0; col < 8; col++)
        {
            for (unsigned char row = 0; row < 9; row++)
            {
                data[81 + row * 9 + col] = data[81 + row * 9 + col + 1];
            }
        }
        for (unsigned char row = 0; row < 9; row++)
        {
            data[81 + row * 9 + 8] = data[row * 9];
        }
        for (unsigned col = 0; col < 8; col++)
        {
            for (unsigned char row = 0; row < 9; row++)
            {
                data[row * 9 + col] = data[row * 9 + col + 1];
            }
        }
    }
}