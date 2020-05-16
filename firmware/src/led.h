#include "driver/ledc.h"
#include "driver/rmt.h"

#include "esp_log.h"


#define LED_1_DAT 16
#define LED_2_DAT 17
#define LED_3_DAT 18

void setup_leds();
void set_strip(unsigned int *data, size_t num_rows);