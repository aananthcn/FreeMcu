
INCDIRS  += -I ${MCU_PATH}/src/bsp

LDFLAGS  += -g
CFLAGS   += -Werror ${INCDIRS} -g
ASFLAGS  += ${INCDIRS} -g

$(info compiling arch/arm source files)


ARCH_OBJS	:= \
	${MCU_PATH}/src/bsp/arch/arm/cortex-m0/lowlevel.o \
	${MCU_PATH}/src/bsp/arch/arm/cortex-m0/interrupt.o

