#include "led.h"

static const unsigned char pins[3] = {LED_1_DAT, LED_2_DAT, LED_3_DAT};

#define LED_WRITE_0_COMPLETE BIT0
#define LED_WRITE_1_COMPLETE BIT1
#define LED_WRITE_2_COMPLETE BIT2
#define LED_WRITE_ALL_COMPLETE (BIT0 | BIT1 | BIT2)

static unsigned char write_wait_flags = LED_WRITE_ALL_COMPLETE;

void signal_tx_done(rmt_channel_t channel, void *b)
{
    write_wait_flags |= channel;
}

const static size_t _num_rows = 18;
const static size_t num_buffer_entries = _num_rows * 6 + _num_rows/3;
static rmt_item32_t *activeBuffers[3];
static rmt_item32_t *standbyBuffers[3];

void setup_leds()
{
    
    for (unsigned char i = 0; i < 3; i++)
    {
        
        activeBuffers[i] = malloc((24 * num_buffer_entries + 1) * sizeof(rmt_item32_t));
        for(size_t j = 0; j<(24 * num_buffer_entries + 1); j++) {
            (activeBuffers[i])[j] = (rmt_item32_t) {{{32, 1, 69, 0}}};
        }
        standbyBuffers[i] = malloc((24 * num_buffer_entries + 1) * sizeof(rmt_item32_t));
        for(size_t j = 0; j<(24 * num_buffer_entries + 1); j++) {
            (standbyBuffers[i])[j] = (rmt_item32_t) {{{32, 1, 69, 0}}};
        }
    }

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
    rmt_register_tx_end_callback(&signal_tx_done, NULL);
}

rmt_item32_t convertToRmt(unsigned int b)
{
    const rmt_item32_t on = {{{65, 1, 36, 0}}};  // .8us high, .45us low
    const rmt_item32_t off = {{{32, 1, 69, 0}}}; // .4us high, .85us low
    return b ? on : off;
}

void set_strip(unsigned int *data)
{
    for (size_t row = 0; row < _num_rows; row++)
    {
        for (unsigned char column = 0; column < 19; column++)
        {
            unsigned int pixel = data[column + row * 19];

            size_t bufferNo;
            size_t bufferPos;

            if (row < 9) {
                bufferNo = 
                    column == 18 ?
                    ((row / 3) % 3)
                    : (((17 - column) / 3) % 3);
                
                bufferPos = 
                    column == 18 ?
                    (54 + (row / 9) * 57 + row % 3)
                    : ((8 - row) % 9 + ((17 - column) % 3) * 9 + (column / 9) * 27 + 57 * (row / 9));
            } else {
                bufferNo = 
                    column == 18 ?
                    ((row / 3) % 3)
                    : ((column / 3) % 3);
                
                bufferPos = 
                    column == 18 ?
                    ((row - 9) % 3 + 57)
                    : ((1 - (column / 9)) * 27 + 60 + 9 * ((column % 9) % 3) + row % 9);
            }

            // if (pixel != 0) {
            //     ESP_LOGI("led", "(%d,%d): %d %d", column, row, bufferNo, bufferPos);
            // }

            // we have: [0]bB[8]gG[16]rR
            // need to convert to [0]Gg[8]Rr[16]Bb            
            rmt_item32_t *buffer = standbyBuffers[bufferNo];

            for (unsigned char green_bit = 0; green_bit < 8; green_bit++)
            {
                buffer[bufferPos * 24 + green_bit] = convertToRmt(pixel & (1 << (15 - green_bit)));
            }
            for (unsigned char red_bit = 0; red_bit < 8; red_bit++)
            {
                buffer[bufferPos * 24 + 8 + red_bit] = convertToRmt(pixel & (1 << (23 - red_bit)));
            }

            for (unsigned char blue_bit = 0; blue_bit < 8; blue_bit++)
            {
                buffer[bufferPos * 24 + 16 + blue_bit] = convertToRmt(pixel & (1 << (7 - blue_bit)));
            }
        }
    }

    //before we start, make sure previous writes aren't in progress
    while (write_wait_flags != LED_WRITE_ALL_COMPLETE)
        ;

    for (unsigned char i = 0; i < 3; i++)
    {
        (standbyBuffers[i])[24 * num_buffer_entries] = (rmt_item32_t){{{2419, 0, 2419, 0}}}; //60us pause before next write
        rmt_item32_t *tmp = activeBuffers[i];
        activeBuffers[i] = standbyBuffers[i];
        standbyBuffers[i] = tmp;

        rmt_write_items(i, activeBuffers[i], 24 * num_buffer_entries + 1, false);
    }
}