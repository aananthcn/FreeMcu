#ifndef _BOARD_RP2040
#define _BOARD_RP2040

#include <base_types.h>
#include <platform.h>

#define BOARD_RP2040	1

int bsp_setup_sytimer(void);
int bsp_get_usec_syscount(u32 *ucount);
int bsp_init(void);

#endif