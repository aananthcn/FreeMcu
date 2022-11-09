
INCDIRS  += -I ${MCU_PATH}/src \
	    -I ${MCU_PATH}/api	\
	    -I ${MCU_PATH}/src/common/toolchain

LDFLAGS  += -g
CFLAGS   += -Werror ${INCDIRS} -g
ASFLAGS  += ${INCDIRS} -g

$(info compiling Mcu source files)


MCU_OBJS := \
	${MCU_PATH}/cfg/Mcu_cfg.o \
	${MCU_PATH}/src/Mcu.o
