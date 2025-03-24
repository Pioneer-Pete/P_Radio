#ifndef __ITOA_H__
#define __ITOA_H__

#include <stm8s.h>

#include <stdio.h>
#include <stdlib.h>

//Iterative function to implement itoa() function
char* itoa(int16_t value, char* buffer, int16_t base);



#endif