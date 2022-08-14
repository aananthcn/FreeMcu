COMPILER=arm-none-eabi-
CC=${COMPILER}gcc
LD=${COMPILER}ld
AS=${COMPILER}as
OBJCOPY=${COMPILER}objcopy
ARCH = arm32
BOARD_NAME=qemu-versatilepb

CC_VERS := $(shell ${CC} -dumpfullversion)
ifeq ($(OS),Windows_NT)
LIB_GCC_A_PATH=${MINGW_ROOT}/lib/gcc/arm-none-eabi/${CC_VERS}
else
LIB_GCC_A_PATH=/usr/lib/gcc/arm-none-eabi/${CC_VERS}
endif

INCDIRS  := -I ${MCU_PATH}/start-up/include \
            -I ${MCU_PATH}/start-up/include/arch/aarch32/ \
	    -I ${MCU_PATH}/start-up/board/${BOARD_NAME} \
	    -I ${MCU_PATH}/start-up/include/arch/aarch32/cortex_m/ \
	    -I ${MCU_PATH}/start-up/include/arch/aarch32/cortex_m/cmsis/ \
	    -I ${MCU_PATH}/start-up/lib/include

LDFLAGS  += -nostdlib -g -L${LIB_GCC_A_PATH} -lgcc
CFLAGS   += -Werror ${INCDIRS} -g
ASFLAGS  += ${INCDIRS} -g

$(info compiling qemu-versatilepb board specific files)
CFLAGS  += -mcpu=arm926ej-s 
ASFLAGS += -mcpu=arm926ej-s 
LDFILE	:= ${MCU_PATH}/start-up/board/${BOARD_NAME}/${BOARD_NAME}.lds
LDFLAGS += -m armelf -T ${LDFILE}

	

BRD_OBJS	:= \
	${MCU_PATH}/start-up/board/qemu-versatilepb/board.o \
	${MCU_PATH}/start-up/board/qemu-versatilepb/vector_handlers.o \
	${MCU_PATH}/start-up/board/qemu-versatilepb/vectors.o \
	${MCU_PATH}/start-up/board/qemu-versatilepb/startup.o

