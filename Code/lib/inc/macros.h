ifndef __MACROS__
define __MACROS__


#include <stdint.h>


#define SET_BIT8(VAR8, BIT)      	 	((VAR8) |= ((uint8_t)(1 << (BIT))))
#define CLEAR_BIT8(VAR8, BIT)    	 	((VAR8) &= ((uint8_t)~(1 << (BIT))))
#define READ_BIT8(VAR8, BIT)     	 	((VAR8) & ((uint8_t)(1 << (BIT))))

#define SET_BIT16(VAR16, BIT)       	((VAR16) |= ((uint16_t)(1 << (BIT))))
#define CLEAR_BIT16(VAR16, BIT)     	((VAR16) &= ((uint16_t)~(1 << (BIT))))
#define READ_BIT16(VAR16, BIT)      	((VAR16) & ((uint16_t)(1 << (BIT))))

#define SET_BIT32(VAR32, BIT)       	((VAR32) |= ((uint32_t)(1 << (BIT))))
#define CLEAR_BIT32(VAR32, BIT)     	((VAR32) &= ((uint32_t)~(1 << (BIT))))
#define READ_BIT32(VAR32, BIT)      	((VAR32) & ((uint32_t)(1 << (BIT))))

#define CLEAR_VAR8(VAR8)        		((VAR8) = ((uint8_t)(0x00)))
#define WRITE_VAR8(VAR8, VAL8)  		((VAR8) = ((uint8_t)(VAL8)))
#define READ_VAR8(VAR8)         		((VAR8))

#define CLEAR_VAR16(VAR16)        		((VAR16) = ((uint16_t)(0x00)))
#define WRITE_VAR16(VAR16, VAL16) 		((VAR16) = ((uint16_t)(VAL16)))
#define READ_VAR16(VAR16)         		((VAR16))

#define CLEAR_VAR32(VAR32)        		((VAR32) = ((uint32_t)(0x00)))
#define WRITE_VAR32(VAR32, VAL32) 		((VAR32) = ((uint32_t)(VAL32)))
#define READ_VAR32(VAR32)         		((VAR32))

#define MODIFY_VAR8(VAR8,   CLEARMASK, SETMASK)   	WRITE_VAR8((VAR8),   (((READ_VAR8(VAR8))   & (~(CLEARMASK))) | (SETMASK)))
#define MODIFY_VAR16(VAR16, CLEARMASK, SETMASK)   	WRITE_VAR16((VAR16), (((READ_VAR16(VAR16)) & (~(CLEARMASK))) | (SETMASK)))
#define MODIFY_VAR32(VAR32, CLEARMASK, SETMASK)   	WRITE_VAR32((VAR32), (((READ_VAR32(VAR32)) & (~(CLEARMASK))) | (SETMASK)))


#endif