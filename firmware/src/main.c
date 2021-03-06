#include "main.h"
#include "out.c"

void app_main(void)
{
    setup_leds();

    while (1)
    {
        for (int i = 0; i < 36; i++)
        {
            set_strip(data[i]);
            vTaskDelay(25 / portTICK_PERIOD_MS);
        }
    }
}