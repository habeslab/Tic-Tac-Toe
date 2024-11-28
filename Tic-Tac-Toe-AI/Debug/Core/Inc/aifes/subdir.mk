################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/aifes_config.c 

OBJS += \
./Core/Inc/aifes/aifes_config.o 

C_DEPS += \
./Core/Inc/aifes/aifes_config.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/%.o Core/Inc/aifes/%.su Core/Inc/aifes/%.cyclo: ../Core/Inc/aifes/%.c Core/Inc/aifes/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes

clean-Core-2f-Inc-2f-aifes:
	-$(RM) ./Core/Inc/aifes/aifes_config.cyclo ./Core/Inc/aifes/aifes_config.d ./Core/Inc/aifes/aifes_config.o ./Core/Inc/aifes/aifes_config.su

.PHONY: clean-Core-2f-Inc-2f-aifes

