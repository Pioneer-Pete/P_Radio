#ifndef __HD44780_H__
#define __HD44780_H__

#include <stm8s.h>
#include "tim4_systick_config.h"


//port definitions
#define HD44780_GPIO_CONTROL              GPIOD						// LCD control lines (must be on the same port)
#define HD44780_GPIO_DATA                 GPIOC						// LCD data lines (must be on the same port)

// Pin definition
#define HD44780_PIN_RS                    GPIO_PIN_4
#define HD44780_PIN_RW                    GPIO_PIN_5
#define HD44780_PIN_EN                    GPIO_PIN_6

#define HD44780_PIN_D4                    GPIO_PIN_3
#define HD44780_PIN_D5                    GPIO_PIN_4
#define HD44780_PIN_D6                    GPIO_PIN_6
#define HD44780_PIN_D7                    GPIO_PIN_7

/** Display size ------------------------------------------------------------ */
#define HD44780_LINES                     2							// Number of visible lines of the display (1 or 2)
#define HD44780_DISP_LENGTH               16						// Visible characters per line of the display

/** Instructions bit location ----------------------------------------------- */
#define HD44780_CLEAR_DISPLAY             0x01
#define HD44780_CURSOR_HOME               0x02
#define HD44780_CHARACTER_ENTRY_MODE      0x04
#define HD44780_DISPLAY_CURSOR_ON_OFF     0x08
#define HD44780_DISPLAY_CURSOR_SHIFT      0x10
#define HD44780_FUNCTION_SET              0x20
#define HD44780_SET_CGRAM_ADDRESS         0x40
#define HD44780_SET_DDRAM_ADDRESS         0x80

/* Character entry mode instructions */
#define HD44780_INCREMENT                 0x02
#define HD44780_DECREMENT                 0x00
#define HD44780_DISPLAY_SHIFT_ON          0x01
#define HD44780_DISPLAY_SHIFT_OFF         0x00

/* Display cursor on off instructions */
#define HD44780_DISPLAY_ON                0x04
#define HD44780_DISPLAY_OFF               0x00
#define HD44780_CURSOR_UNDERLINE_ON       0x02
#define HD44780_CURSOR_UNDERLINE_OFF      0x00
#define HD44780_CURSOR_BLINK_ON           0x01
#define HD44780_CURSOR_BLINK_OFF          0x00

/* Display cursor shift instructions */
#define HD44780_DISPLAY_SHIFT             0x08
#define HD44780_CURSOR_MOVE               0x00
#define HD44780_RIGHT_SHIFT               0x04
#define HD44780_LEFT_SHIFT                0x00

/* Function set instructions */
#define HD44780_8BIT_INTERFACE            0x10
#define HD44780_4BIT_INTERFACE            0x00
#define HD44780_2LINE_MODE                0x08
#define HD44780_1LINE_MODE                0x00
#define HD44780_5X10DOT_FORMAT            0x04
#define HD44780_5X7DOT_FORMAT             0x00
/* Busy flag bit location */
#define HD44780_BUSY_FLAG                 0x80

/** LCD display and cursor attributes --------------------------------------- */
#define HD44780_DISPLAY_OFF_CURSOR_OFF_BLINK_OFF    (HD44780_DISPLAY_OFF | HD44780_CURSOR_UNDERLINE_OFF | HD44780_CURSOR_BLINK_OFF)
#define HD44780_DISPLAY_ON_CURSOR_OFF_BLINK_OFF     (HD44780_DISPLAY_ON  | HD44780_CURSOR_UNDERLINE_OFF | HD44780_CURSOR_BLINK_OFF)
#define HD44780_DISPLAY_ON_CURSOR_OFF_BLINK_ON      (HD44780_DISPLAY_ON  | HD44780_CURSOR_UNDERLINE_OFF | HD44780_CURSOR_BLINK_ON)
#define HD44780_DISPLAY_ON_CURSOR_ON_BLINK_OFF      (HD44780_DISPLAY_ON  | HD44780_CURSOR_UNDERLINE_ON  | HD44780_CURSOR_BLINK_OFF)
#define HD44780_DISPLAY_ON_CURSOR_ON_BLINK_ON       (HD44780_DISPLAY_ON  | HD44780_CURSOR_UNDERLINE_ON  | HD44780_CURSOR_BLINK_ON)


/** Public function prototypes ---------------------------------------------- */
void HD44780_config(uint8_t disp_attr);
void HD44780_clrscr(void);
void HD44780_gotoxy(uint8_t x, uint8_t y);
void HD44780_putc(const char c);
void HD44780_puts(const char* s);
void HD44780_create_custom_char(uint8_t location, uint8_t* data_bytes);
void HD44780_put_custom_char(uint8_t x, uint8_t y, uint8_t location);

void HD44780_display_on(void);
void HD44780_display_off(void);
void HD44780_cursor_on(void);
void HD44780_cursor_off(void);
void HD44780_blink_on(void);
void HD44780_blink_off(void);

void HD44780_home(void);
void HD44780_entry_inc(void);
void HD44780_entry_dec(void);
void HD44780_entry_inc_shift(void);
void HD44780_entry_dec_shift(void);

void HD44780_display_shift_left(void);
void HD44780_display_shift_right(void);
void HD44780_cursor_shift_left(void);
void HD44780_cursor_shift_right(void);

#endif
