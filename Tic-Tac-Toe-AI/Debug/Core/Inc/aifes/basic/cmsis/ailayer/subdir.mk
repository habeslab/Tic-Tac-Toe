################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/basic/cmsis/ailayer/ailayer_dense_cmsis.c 

OBJS += \
./Core/Inc/aifes/basic/cmsis/ailayer/ailayer_dense_cmsis.o 

C_DEPS += \
./Core/Inc/aifes/basic/cmsis/ailayer/ailayer_dense_cmsis.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/basic/cmsis/ailayer/%.o Core/Inc/aifes/basic/cmsis/ailayer/%.su Core/Inc/aifes/basic/cmsis/ailayer/%.cyclo: ../Core/Inc/aifes/basic/cmsis/ailayer/%.c Core/Inc/aifes/basic/cmsis/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-cmsis-2f-ailayer

clean-Core-2f-Inc-2f-aifes-2f-basic-2f-cmsis-2f-ailayer:
	-$(RM) ./Core/Inc/aifes/basic/cmsis/ailayer/ailayer_dense_cmsis.cyclo ./Core/Inc/aifes/basic/cmsis/ailayer/ailayer_dense_cmsis.d ./Core/Inc/aifes/basic/cmsis/ailayer/ailayer_dense_cmsis.o ./Core/Inc/aifes/basic/cmsis/ailayer/ailayer_dense_cmsis.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-cmsis-2f-ailayer

