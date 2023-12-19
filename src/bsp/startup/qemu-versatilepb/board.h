#ifndef _QEMU_VERSATILEPB
#define _QEMU_VERSATILEPB

#include <base_types.h>
#include <cgen/platform.h>

#define QEMU_VERSATILEPB	1

int bsp_setup_sytimer(void);
int bsp_get_usec_syscount(u32 *ucount);

#endif