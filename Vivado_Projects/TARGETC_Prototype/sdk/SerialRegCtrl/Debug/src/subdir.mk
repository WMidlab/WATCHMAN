################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/TARGETC_RegisterMap.c \
../src/iic_DAC_LTC2657.c \
../src/interrupt.c \
../src/main.c \
../src/platform.c 

OBJS += \
./src/TARGETC_RegisterMap.o \
./src/iic_DAC_LTC2657.o \
./src/interrupt.o \
./src/main.o \
./src/platform.o 

C_DEPS += \
./src/TARGETC_RegisterMap.d \
./src/iic_DAC_LTC2657.d \
./src/interrupt.d \
./src/main.d \
./src/platform.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../SerialRegCtrl_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


