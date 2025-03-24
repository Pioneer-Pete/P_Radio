#include "itc_config.h"

//these are example settings

void ITC_config(void)
{
	ITC_DeInit();

    ITC_SetSoftwarePriority(ITC_IRQ_PORTD, ITC_PRIORITYLEVEL_3);
}