################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/BACKUP_C/TARGETC_RegisterMap.c \
../src/BACKUP_C/helloworld.c 

OBJS += \
./src/BACKUP_C/TARGETC_RegisterMap.o \
./src/BACKUP_C/helloworld.o 

C_DEPS += \
./src/BACKUP_C/TARGETC_RegisterMap.d \
./src/BACKUP_C/helloworld.d 


# Each subdirectory must supply rules for building sources it contributes
src/BACKUP_C/%.o: ../src/BACKUP_C/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../SerialRegCtrl_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


