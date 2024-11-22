################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/aifes/basic/avr_pgm/aimath/aimath_f32_avr_pgm.c \
../Core/aifes/basic/avr_pgm/aimath/aimath_q7_avr_pgm.c 

OBJS += \
./Core/aifes/basic/avr_pgm/aimath/aimath_f32_avr_pgm.o \
./Core/aifes/basic/avr_pgm/aimath/aimath_q7_avr_pgm.o 

C_DEPS += \
./Core/aifes/basic/avr_pgm/aimath/aimath_f32_avr_pgm.d \
./Core/aifes/basic/avr_pgm/aimath/aimath_q7_avr_pgm.d 


# Each subdirectory must supply rules for building sources it contributes
Core/aifes/basic/avr_pgm/aimath/%.o Core/aifes/basic/avr_pgm/aimath/%.su Core/aifes/basic/avr_pgm/aimath/%.cyclo: ../Core/aifes/basic/avr_pgm/aimath/%.c Core/aifes/basic/avr_pgm/aimath/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-aifes-2f-basic-2f-avr_pgm-2f-aimath

clean-Core-2f-aifes-2f-basic-2f-avr_pgm-2f-aimath:
	-$(RM) ./Core/aifes/basic/avr_pgm/aimath/aimath_f32_avr_pgm.cyclo ./Core/aifes/basic/avr_pgm/aimath/aimath_f32_avr_pgm.d ./Core/aifes/basic/avr_pgm/aimath/aimath_f32_avr_pgm.o ./Core/aifes/basic/avr_pgm/aimath/aimath_f32_avr_pgm.su ./Core/aifes/basic/avr_pgm/aimath/aimath_q7_avr_pgm.cyclo ./Core/aifes/basic/avr_pgm/aimath/aimath_q7_avr_pgm.d ./Core/aifes/basic/avr_pgm/aimath/aimath_q7_avr_pgm.o ./Core/aifes/basic/avr_pgm/aimath/aimath_q7_avr_pgm.su

.PHONY: clean-Core-2f-aifes-2f-basic-2f-avr_pgm-2f-aimath

