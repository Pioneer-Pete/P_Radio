#include "itoa.h"


void swap(char *x, char *y);							//function to swap two numbers
char* reverse(char *buffer, int16_t i, int16_t j);		//function to reverse buffer[i..j]


void swap(char *x, char *y) 
{
	char t = *x; *x = *y; *y = t;
}


char* reverse(char *buffer, int16_t i, int16_t j)
{
	while (i < j)
		swap(&buffer[i++], &buffer[j--]);

	return buffer;
}


char* itoa(int16_t value, char* buffer, int16_t base)	//Iterative function to implement itoa() function in C
{
	int16_t n, i, r;
	
	if (base < 2 || base > 32)	return buffer;			// invalid input
	n = abs(value);										// consider absolute value of number

	i = 0;
	while (n)
	{
		r = n % base;
		if (r >= 10) buffer[i++] = (char) (65 + (r - 10));
		else buffer[i++] = (char) (48 + r);
		n = n / base;
	}
	if (i == 0) buffer[i++] = '0';
	
	//If base is 10 and value is negative, the resulting string
	//is preceded with a minus sign (-)
	//With any other base, value is always considered unsigned
	if (value < 0 && base == 10) buffer[i++] = '-';
	buffer[i] = '\0'; 									// null terminate string

	return reverse(buffer, 0, i - 1);					// reverse the string and return it
}


