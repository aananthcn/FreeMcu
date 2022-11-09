#ifndef _QEMU_VERSATILEPB
#define _QEMU_VERSATILEPB

#include <ostypes.h>
#include <platform.h>

#define QEMU_VERSATILEPB	1

int bsp_setup_sytimer(void);
int bsp_get_usec_syscount(u32 *ucount);

#endif