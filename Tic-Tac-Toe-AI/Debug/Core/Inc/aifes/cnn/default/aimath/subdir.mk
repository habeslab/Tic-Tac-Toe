################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/cnn/default/aimath/aimath_cnn_f32_default.c 

OBJS += \
./Core/Inc/aifes/cnn/default/aimath/aimath_cnn_f32_default.o 

C_DEPS += \
./Core/Inc/aifes/cnn/default/aimath/aimath_cnn_f32_default.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/cnn/default/aimath/%.o Core/Inc/aifes/cnn/default/aimath/%.su Core/Inc/aifes/cnn/default/aimath/%.cyclo: ../Core/Inc/aifes/cnn/default/aimath/%.c Core/Inc/aifes/cnn/default/aimath/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-cnn-2f-default-2f-aimath

clean-Core-2f-Inc-2f-aifes-2f-cnn-2f-default-2f-aimath:
	-$(RM) ./Core/Inc/aifes/cnn/default/aimath/aimath_cnn_f32_default.cyclo ./Core/Inc/aifes/cnn/default/aimath/aimath_cnn_f32_default.d ./Core/Inc/aifes/cnn/default/aimath/aimath_cnn_f32_default.o ./Core/Inc/aifes/cnn/default/aimath/aimath_cnn_f32_default.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-cnn-2f-default-2f-aimath

