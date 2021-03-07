#include "main.h"
#include "out.c"

void app_main(void)
{
    setup_leds();

    while (1)
    {
        for (int i = 0; i < sizeof(data)/sizeof(data[0]); i++)
        {
            set_strip(data[i]);
            vTaskDelay(100 / portTICK_PERIOD_MS);
        }
    }
}