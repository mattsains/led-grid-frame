#include "main.h"

void app_main(void)
{
#define size 6
    setup_leds(size);

    unsigned int data[size];
    unsigned int desired[size];

    for (int i = 0; i < size; i++)
    {
        desired[i] = esp_random() & 0xffffff;
    }

    while (1)
    {
        for (int i = 0; i < 6; i++)
        {
            if ((data[i] & 0xff) > (desired[i] & 0xff))
                data[i] -= 0x01;
            else if ((data[i] & 0xff) < (desired[i] & 0xff))
                data[i] += 0x01;
            if ((data[i] & 0xff00) > (desired[i] & 0xff00))
                data[i] -= 0x0100;
            else if ((data[i] & 0xff00) < (desired[i] & 0xff00))
                data[i] += 0x0100;
            if ((data[i] & 0xff0000) > (desired[i] & 0xff0000))
                data[i] -= 0x010000;
            else if ((data[i] & 0xff0000) < (desired[i] & 0xff0000))
                data[i] += 0x010000;

            if ((data[i] & 0xffffff) == desired[i])
            {
                if (desired[i] == 0)
                    desired[i] = esp_random() & 0xffffff;
                else
                    desired[i] = 0;
            }
        }

        vTaskDelay(10 / portTICK_PERIOD_MS);
        set_strip(data);
    }
}