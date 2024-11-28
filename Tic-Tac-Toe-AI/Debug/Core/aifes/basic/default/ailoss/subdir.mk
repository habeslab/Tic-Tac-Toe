################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/aifes/basic/default/ailoss/ailoss_crossentropy_default.c \
../Core/aifes/basic/default/ailoss/ailoss_mse_default.c 

OBJS += \
./Core/aifes/basic/default/ailoss/ailoss_crossentropy_default.o \
./Core/aifes/basic/default/ailoss/ailoss_mse_default.o 

C_DEPS += \
./Core/aifes/basic/default/ailoss/ailoss_crossentropy_default.d \
./Core/aifes/basic/default/ailoss/ailoss_mse_default.d 


# Each subdirectory must supply rules for building sources it contributes
Core/aifes/basic/default/ailoss/%.o Core/aifes/basic/default/ailoss/%.su Core/aifes/basic/default/ailoss/%.cyclo: ../Core/aifes/basic/default/ailoss/%.c Core/aifes/basic/default/ailoss/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-aifes-2f-basic-2f-default-2f-ailoss

clean-Core-2f-aifes-2f-basic-2f-default-2f-ailoss:
	-$(RM) ./Core/aifes/basic/default/ailoss/ailoss_crossentropy_default.cyclo ./Core/aifes/basic/default/ailoss/ailoss_crossentropy_default.d ./Core/aifes/basic/default/ailoss/ailoss_crossentropy_default.o ./Core/aifes/basic/default/ailoss/ailoss_crossentropy_default.su ./Core/aifes/basic/default/ailoss/ailoss_mse_default.cyclo ./Core/aifes/basic/default/ailoss/ailoss_mse_default.d ./Core/aifes/basic/default/ailoss/ailoss_mse_default.o ./Core/aifes/basic/default/ailoss/ailoss_mse_default.su

.PHONY: clean-Core-2f-aifes-2f-basic-2f-default-2f-ailoss

