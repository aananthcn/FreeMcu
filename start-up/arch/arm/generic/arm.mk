
INCDIRS  += -I ${MCU_PATH}/start-up/arch/arm

LDFLAGS  += -g
CFLAGS   += -Werror ${INCDIRS} -g
ASFLAGS  += ${INCDIRS} -g

$(info compiling arch/arm source files)


ARCH_OBJS	:= \
	${MCU_PATH}/start-up/arch/arm/generic/lowlevel.o \
	${MCU_PATH}/start-up/arch/arm/generic/interrupt.o

