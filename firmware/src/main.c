#include "main.h"


void app_main(void)
{
    unsigned int data[342] = {0};

    setup_leds();

    while (1)
    {
        for (int i = 0; i < 342; i++)
        {
            data[i] = 0x010000;
            if (i > 0) data[i-1] = 0;
            set_strip(data);
            vTaskDelay(90 / portTICK_PERIOD_MS);
        }
    }
}