COMPILER=arm-none-eabi-
CC=${COMPILER}gcc
LD=${COMPILER}ld
AS=${COMPILER}as
OBJCOPY=${COMPILER}objcopy
BOARD_NAME=rp2040

CC_VERS := $(shell ${CC} -dumpfullversion)
ifeq ($(OS),Windows_NT)
LIB_GCC_A_PATH=${MINGW_ROOT}/lib/gcc/arm-none-eabi/${CC_VERS}/thumb/v6-m/nofp/
else
LIB_GCC_A_PATH=/usr/lib/gcc/arm-none-eabi/${CC_VERS}/thumb/v6-m/nofp/
endif

INCDIRS  := -I ${MCU_PATH}/src/bsp/startup \
	    -I ${MCU_PATH}/src/bsp/startup/${BOARD_NAME} \
	    -I ${MCU_PATH}/api \
	    -I ${MCU_PATH}/src/common/api \
	    -I ${MCU_PATH}/src/bsp/startup/lib/include
	    

LDFLAGS  += -nostdlib -g -L${LIB_GCC_A_PATH} -lgcc
CFLAGS   += -Werror ${INCDIRS} -g
ASFLAGS  += ${INCDIRS} -g 

$(info compiling ${BOARD_NAME} board specific files)
CFLAGS  += -mthumb -mthumb-interwork -march=armv6-m -mcpu=cortex-m0plus
LDFILE	:= ${MCU_PATH}/src/bsp/startup/${BOARD_NAME}/${BOARD_NAME}.lds
LDFLAGS += -mthumb -mthumb-interwork -marmelf  -T ${LDFILE}



BRD_OBJS := \
	${MCU_PATH}/src/bsp/startup/rp2040/boot_stage2.o \
	${MCU_PATH}/src/bsp/startup/rp2040/board.o \
	${MCU_PATH}/src/bsp/startup/rp2040/vector_handlers.o \
	${MCU_PATH}/src/bsp/startup/rp2040/vectors.o \
	${MCU_PATH}/src/bsp/startup/rp2040/interrupt.o \
	${MCU_PATH}/src/bsp/startup/rp2040/startup.o \
	${MCU_PATH}/src/bsp/startup/rp2040/bootrom.o 


