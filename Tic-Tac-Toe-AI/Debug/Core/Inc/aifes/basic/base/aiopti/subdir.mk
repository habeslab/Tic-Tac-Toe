################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/basic/base/aiopti/aiopti_adam.c \
../Core/Inc/aifes/basic/base/aiopti/aiopti_sgd.c 

OBJS += \
./Core/Inc/aifes/basic/base/aiopti/aiopti_adam.o \
./Core/Inc/aifes/basic/base/aiopti/aiopti_sgd.o 

C_DEPS += \
./Core/Inc/aifes/basic/base/aiopti/aiopti_adam.d \
./Core/Inc/aifes/basic/base/aiopti/aiopti_sgd.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/basic/base/aiopti/%.o Core/Inc/aifes/basic/base/aiopti/%.su Core/Inc/aifes/basic/base/aiopti/%.cyclo: ../Core/Inc/aifes/basic/base/aiopti/%.c Core/Inc/aifes/basic/base/aiopti/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-aiopti

clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-aiopti:
	-$(RM) ./Core/Inc/aifes/basic/base/aiopti/aiopti_adam.cyclo ./Core/Inc/aifes/basic/base/aiopti/aiopti_adam.d ./Core/Inc/aifes/basic/base/aiopti/aiopti_adam.o ./Core/Inc/aifes/basic/base/aiopti/aiopti_adam.su ./Core/Inc/aifes/basic/base/aiopti/aiopti_sgd.cyclo ./Core/Inc/aifes/basic/base/aiopti/aiopti_sgd.d ./Core/Inc/aifes/basic/base/aiopti/aiopti_sgd.o ./Core/Inc/aifes/basic/base/aiopti/aiopti_sgd.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-aiopti

