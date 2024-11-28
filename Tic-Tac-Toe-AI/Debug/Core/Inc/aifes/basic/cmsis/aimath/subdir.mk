################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/basic/cmsis/aimath/aimath_f32_cmsis.c \
../Core/Inc/aifes/basic/cmsis/aimath/aimath_q31_cmsis.c \
../Core/Inc/aifes/basic/cmsis/aimath/aimath_q7_cmsis.c 

OBJS += \
./Core/Inc/aifes/basic/cmsis/aimath/aimath_f32_cmsis.o \
./Core/Inc/aifes/basic/cmsis/aimath/aimath_q31_cmsis.o \
./Core/Inc/aifes/basic/cmsis/aimath/aimath_q7_cmsis.o 

C_DEPS += \
./Core/Inc/aifes/basic/cmsis/aimath/aimath_f32_cmsis.d \
./Core/Inc/aifes/basic/cmsis/aimath/aimath_q31_cmsis.d \
./Core/Inc/aifes/basic/cmsis/aimath/aimath_q7_cmsis.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/basic/cmsis/aimath/%.o Core/Inc/aifes/basic/cmsis/aimath/%.su Core/Inc/aifes/basic/cmsis/aimath/%.cyclo: ../Core/Inc/aifes/basic/cmsis/aimath/%.c Core/Inc/aifes/basic/cmsis/aimath/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-cmsis-2f-aimath

clean-Core-2f-Inc-2f-aifes-2f-basic-2f-cmsis-2f-aimath:
	-$(RM) ./Core/Inc/aifes/basic/cmsis/aimath/aimath_f32_cmsis.cyclo ./Core/Inc/aifes/basic/cmsis/aimath/aimath_f32_cmsis.d ./Core/Inc/aifes/basic/cmsis/aimath/aimath_f32_cmsis.o ./Core/Inc/aifes/basic/cmsis/aimath/aimath_f32_cmsis.su ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q31_cmsis.cyclo ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q31_cmsis.d ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q31_cmsis.o ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q31_cmsis.su ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q7_cmsis.cyclo ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q7_cmsis.d ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q7_cmsis.o ./Core/Inc/aifes/basic/cmsis/aimath/aimath_q7_cmsis.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-cmsis-2f-aimath

