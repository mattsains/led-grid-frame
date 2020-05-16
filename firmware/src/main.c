#include "main.h"

void app_main(void)
{
    setup_leds();

    unsigned int data[6] = {
        0xff0000,
        0xff0000,
        0xff0000,
        0xff0000,
        0xff0000,
        0xff0000};

    vTaskDelay(500/portTICK_PERIOD_MS);
    set_strip(data, 2);
    while (1)
    {
        vTaskDelay(10000/portTICK_PERIOD_MS);
    }
}