#include "hd44780_config.h"



#define HD44780_START_LINE_1              0x00
#define HD44780_START_LINE_2              0x40

#if HD44780_DISP_LENGTH == 16
#define HD44780_START_LINE_3              0x10
#define HD44780_START_LINE_4              0x50

#elif HD44780_DISP_LENGTH == 20
#define HD44780_START_LINE_3              0x14
#define HD44780_START_LINE_4              0x54
#endif

/** Delay value ------------------------------------------------------------- */
#define HD44780_DELAY_POWER_ON            50						// mS
#define HD44780_DELAY_INIT                10						// mS
#define HD44780_DELAY_INIT_REP            128						// uS
#define HD44780_DELAY_INIT_4BIT           128						// uS
#define HD44780_DELAY_BUSY_FLAG           4							// uS
#define HD44780_DELAY_ENABLE_PULSE        2							// uS


static void HD44780_toggle_e(void);
static void HD44780_write(uint8_t data, uint8_t rs);
static uint8_t display_cursor_on_off_control;
void HD44780_write_command(uint8_t cmd);
void HD44780_write_data(uint8_t data);




void HD44780_config(uint8_t disp_attr)
{
	DELAY_ms(HD44780_DELAY_POWER_ON);
	
	GPIO_Init(HD44780_GPIO_CONTROL, HD44780_PIN_RS, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(HD44780_GPIO_CONTROL, HD44780_PIN_RW, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(HD44780_GPIO_CONTROL, HD44780_PIN_EN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D4, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D5, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D6, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(HD44780_GPIO_DATA, HD44780_PIN_D7, GPIO_MODE_OUT_PP_LOW_FAST);
	
	
	DELAY_ms(HD44780_DELAY_POWER_ON);										 // Delay power on

	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);
	HD44780_toggle_e();

	DELAY_ms(HD44780_DELAY_INIT);											 // Delay, busy flag can't be checked here
	HD44780_toggle_e();														 // Repeat last command
	DELAY_us(HD44780_DELAY_INIT_REP);									 	// Delay, busy flag can't be checked here
	HD44780_toggle_e();														 // Repeat last command for third time
	DELAY_us(HD44780_DELAY_INIT_REP);									 	// Delay, busy flag can't be checked here

	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D4);
	HD44780_toggle_e();
	DELAY_us(HD44780_DELAY_INIT_4BIT);



	HD44780_write_command(HD44780_FUNCTION_SET | HD44780_4BIT_INTERFACE | HD44780_2LINE_MODE | HD44780_5X7DOT_FORMAT);
	HD44780_write_command(HD44780_DISPLAY_CURSOR_ON_OFF | HD44780_DISPLAY_OFF);		 // Display off
	HD44780_clrscr();														 // Clear screen
	HD44780_entry_inc();													 // Entry mode

	display_cursor_on_off_control = disp_attr;							 // Display cursor on off
	HD44780_write_command( (uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
}


void HD44780_write_command(uint8_t cmd)
{
	//DELAY_us(1500);
	DELAY_us(1000);
	HD44780_write(cmd, 0);
}


void HD44780_write_data(uint8_t data)
{
	//DELAY_us(100);
	DELAY_us(2);
	HD44780_write(data, 1);
}


static void HD44780_toggle_e()
{
	//DELAY_us(1);
	GPIO_WriteHigh(HD44780_GPIO_CONTROL, HD44780_PIN_EN);
	DELAY_us(HD44780_DELAY_ENABLE_PULSE);								// Pulse length in us (50)
	GPIO_WriteLow(HD44780_GPIO_CONTROL, HD44780_PIN_EN);
	DELAY_us(1);
}


static void HD44780_write(uint8_t data, uint8_t rs)
{
	GPIO_WriteLow(HD44780_GPIO_CONTROL, HD44780_PIN_RW);

	if (rs)
		GPIO_WriteHigh(HD44780_GPIO_CONTROL, HD44780_PIN_RS);
	else
		GPIO_WriteLow(HD44780_GPIO_CONTROL, HD44780_PIN_RS);

	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D7);
	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D6);
	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D5);
	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D4);

	if (data & 0x80) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D7);
	if (data & 0x40) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D6);
	if (data & 0x20) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
	if (data & 0x10) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);

	HD44780_toggle_e();

	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D7);
	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D6);
	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D5);
	GPIO_WriteLow(HD44780_GPIO_DATA, HD44780_PIN_D4);

	if (data & 0x08) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D7);
	if (data & 0x04) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D6);
	if (data & 0x02) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
	if (data & 0x01) GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);

	HD44780_toggle_e();

	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D7);
	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D6);
	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D5);
	GPIO_WriteHigh(HD44780_GPIO_DATA, HD44780_PIN_D4);
}


void HD44780_gotoxy(uint8_t x, uint8_t y)
{
#if HD44780_LINES == 1
	lcd16X2_write_command(HD44780_SET_DDRAM_ADDRESS |(HD44780_START_LINE_1 + x));
#endif
#if HD44780_LINES == 2
	if (y == 0)
		HD44780_write_command((uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_1 + x)));
	else
		HD44780_write_command(( uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_2 + x)));
#endif

#if HD44780_LINES == 4
	if (y == 0)
		HD44780_write_command((uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_1 + x)));
	if (y == 1)
		HD44780_write_command((uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_2 + x)));
	if (y == 2)
		HD44780_write_command((uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_3 + x)));
	if (y == 3)
		HD44780_write_command((uint8_t) (HD44780_SET_DDRAM_ADDRESS | (HD44780_START_LINE_4 + x)));
#endif
}



void HD44780_putc(const char c)
{
	HD44780_write_data(c);
}


void HD44780_puts(const char* s)
{
	while (*s) HD44780_putc(*s++);
}


void HD44780_clrscr()
{
	HD44780_write_command(HD44780_CLEAR_DISPLAY);
	DELAY_us(1000);
}


void HD44780_home()
{
	HD44780_write_command(HD44780_CURSOR_HOME);
}


void HD44780_create_custom_char(uint8_t location, uint8_t* data_bytes)
{
	int i;

	location &= 0x07;													 // We only have 8 locations 0-7 for custom chars
	HD44780_write_command((uint8_t) (HD44780_SET_CGRAM_ADDRESS | (location << 3)));			 // Set CGRAM address
	for (i = 0; i < 8; i++)												 // Write 8 bytes custom char pattern
	{
		HD44780_write_data(data_bytes[i]);
	}
}


void HD44780_put_custom_char(uint8_t x, uint8_t y, uint8_t location)
{
	HD44780_gotoxy(x, y);
	HD44780_write_data(location);
}





void HD44780_entry_inc()
{
	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_INCREMENT | HD44780_DISPLAY_SHIFT_OFF);
}


void HD44780_entry_dec()
{
	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_DECREMENT | HD44780_DISPLAY_SHIFT_OFF);
}


void HD44780_entry_inc_shift()
{
	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_INCREMENT | HD44780_DISPLAY_SHIFT_ON);
}


void HD44780_entry_dec_shift()
{
	HD44780_write_command(HD44780_CHARACTER_ENTRY_MODE | HD44780_DECREMENT | HD44780_DISPLAY_SHIFT_ON);
}


void HD44780_display_on()
{
	display_cursor_on_off_control |= HD44780_DISPLAY_ON;
	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
}


void HD44780_display_off()
{
	display_cursor_on_off_control &= (uint8_t) ~HD44780_DISPLAY_ON;
	HD44780_write_command( (uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
}


void HD44780_cursor_on()
{
	display_cursor_on_off_control |= HD44780_CURSOR_UNDERLINE_ON;
	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
}


void HD44780_cursor_off()
{
	display_cursor_on_off_control &= (uint8_t) ~HD44780_CURSOR_UNDERLINE_ON;
	HD44780_write_command(( uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
}


void HD44780_blink_on()
{
	display_cursor_on_off_control |= HD44780_CURSOR_BLINK_ON;
	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
}


void HD44780_blink_off()
{
	display_cursor_on_off_control &= (uint8_t) ~HD44780_CURSOR_BLINK_ON;
	HD44780_write_command((uint8_t) (HD44780_DISPLAY_CURSOR_ON_OFF | display_cursor_on_off_control));
}


void HD44780_display_shift_left()
{
	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_SHIFT | HD44780_LEFT_SHIFT);
}


void HD44780_display_shift_right()
{
	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_SHIFT | HD44780_RIGHT_SHIFT);
}


void HD44780_cursor_shift_left()
{
	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_CURSOR_SHIFT | HD44780_LEFT_SHIFT);
}


void HD44780_cursor_shift_right()
{
	HD44780_write_command(HD44780_DISPLAY_CURSOR_SHIFT | HD44780_DISPLAY_CURSOR_SHIFT | HD44780_RIGHT_SHIFT);
}

