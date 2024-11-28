################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/basic/base/ailoss/ailoss_crossentropy.c \
../Core/Inc/aifes/basic/base/ailoss/ailoss_mse.c 

OBJS += \
./Core/Inc/aifes/basic/base/ailoss/ailoss_crossentropy.o \
./Core/Inc/aifes/basic/base/ailoss/ailoss_mse.o 

C_DEPS += \
./Core/Inc/aifes/basic/base/ailoss/ailoss_crossentropy.d \
./Core/Inc/aifes/basic/base/ailoss/ailoss_mse.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/basic/base/ailoss/%.o Core/Inc/aifes/basic/base/ailoss/%.su Core/Inc/aifes/basic/base/ailoss/%.cyclo: ../Core/Inc/aifes/basic/base/ailoss/%.c Core/Inc/aifes/basic/base/ailoss/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-ailoss

clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-ailoss:
	-$(RM) ./Core/Inc/aifes/basic/base/ailoss/ailoss_crossentropy.cyclo ./Core/Inc/aifes/basic/base/ailoss/ailoss_crossentropy.d ./Core/Inc/aifes/basic/base/ailoss/ailoss_crossentropy.o ./Core/Inc/aifes/basic/base/ailoss/ailoss_crossentropy.su ./Core/Inc/aifes/basic/base/ailoss/ailoss_mse.cyclo ./Core/Inc/aifes/basic/base/ailoss/ailoss_mse.d ./Core/Inc/aifes/basic/base/ailoss/ailoss_mse.o ./Core/Inc/aifes/basic/base/ailoss/ailoss_mse.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-ailoss

