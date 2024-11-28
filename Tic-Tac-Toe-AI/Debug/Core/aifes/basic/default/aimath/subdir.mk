################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/aifes/basic/default/aimath/aimath_f32_default.c \
../Core/aifes/basic/default/aimath/aimath_q31_default.c \
../Core/aifes/basic/default/aimath/aimath_q7_default.c 

OBJS += \
./Core/aifes/basic/default/aimath/aimath_f32_default.o \
./Core/aifes/basic/default/aimath/aimath_q31_default.o \
./Core/aifes/basic/default/aimath/aimath_q7_default.o 

C_DEPS += \
./Core/aifes/basic/default/aimath/aimath_f32_default.d \
./Core/aifes/basic/default/aimath/aimath_q31_default.d \
./Core/aifes/basic/default/aimath/aimath_q7_default.d 


# Each subdirectory must supply rules for building sources it contributes
Core/aifes/basic/default/aimath/%.o Core/aifes/basic/default/aimath/%.su Core/aifes/basic/default/aimath/%.cyclo: ../Core/aifes/basic/default/aimath/%.c Core/aifes/basic/default/aimath/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-aifes-2f-basic-2f-default-2f-aimath

clean-Core-2f-aifes-2f-basic-2f-default-2f-aimath:
	-$(RM) ./Core/aifes/basic/default/aimath/aimath_f32_default.cyclo ./Core/aifes/basic/default/aimath/aimath_f32_default.d ./Core/aifes/basic/default/aimath/aimath_f32_default.o ./Core/aifes/basic/default/aimath/aimath_f32_default.su ./Core/aifes/basic/default/aimath/aimath_q31_default.cyclo ./Core/aifes/basic/default/aimath/aimath_q31_default.d ./Core/aifes/basic/default/aimath/aimath_q31_default.o ./Core/aifes/basic/default/aimath/aimath_q31_default.su ./Core/aifes/basic/default/aimath/aimath_q7_default.cyclo ./Core/aifes/basic/default/aimath/aimath_q7_default.d ./Core/aifes/basic/default/aimath/aimath_q7_default.o ./Core/aifes/basic/default/aimath/aimath_q7_default.su

.PHONY: clean-Core-2f-aifes-2f-basic-2f-default-2f-aimath

