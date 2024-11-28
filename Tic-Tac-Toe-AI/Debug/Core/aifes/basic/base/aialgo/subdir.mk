################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/aifes/basic/base/aialgo/aialgo_sequential_inference.c \
../Core/aifes/basic/base/aialgo/aialgo_sequential_training.c 

OBJS += \
./Core/aifes/basic/base/aialgo/aialgo_sequential_inference.o \
./Core/aifes/basic/base/aialgo/aialgo_sequential_training.o 

C_DEPS += \
./Core/aifes/basic/base/aialgo/aialgo_sequential_inference.d \
./Core/aifes/basic/base/aialgo/aialgo_sequential_training.d 


# Each subdirectory must supply rules for building sources it contributes
Core/aifes/basic/base/aialgo/%.o Core/aifes/basic/base/aialgo/%.su Core/aifes/basic/base/aialgo/%.cyclo: ../Core/aifes/basic/base/aialgo/%.c Core/aifes/basic/base/aialgo/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-aifes-2f-basic-2f-base-2f-aialgo

clean-Core-2f-aifes-2f-basic-2f-base-2f-aialgo:
	-$(RM) ./Core/aifes/basic/base/aialgo/aialgo_sequential_inference.cyclo ./Core/aifes/basic/base/aialgo/aialgo_sequential_inference.d ./Core/aifes/basic/base/aialgo/aialgo_sequential_inference.o ./Core/aifes/basic/base/aialgo/aialgo_sequential_inference.su ./Core/aifes/basic/base/aialgo/aialgo_sequential_training.cyclo ./Core/aifes/basic/base/aialgo/aialgo_sequential_training.d ./Core/aifes/basic/base/aialgo/aialgo_sequential_training.o ./Core/aifes/basic/base/aialgo/aialgo_sequential_training.su

.PHONY: clean-Core-2f-aifes-2f-basic-2f-base-2f-aialgo

