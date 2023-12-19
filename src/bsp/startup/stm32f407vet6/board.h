#ifndef _BOARD_STM32F407VET6
#define _BOARD_STM32F407VET6

#include <base_types.h>
#include <cgen/platform.h>

#define BOARD_STM32F407VET6	1

int bsp_setup_sytimer(void);
int bsp_get_usec_syscount(u32 *ucount);

#endif