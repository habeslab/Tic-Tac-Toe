################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/aifes/basic/base/aimath/aimath_basic.c \
../Core/aifes/basic/base/aimath/aimath_f32.c \
../Core/aifes/basic/base/aimath/aimath_q31.c \
../Core/aifes/basic/base/aimath/aimath_q7.c \
../Core/aifes/basic/base/aimath/aimath_u8.c 

OBJS += \
./Core/aifes/basic/base/aimath/aimath_basic.o \
./Core/aifes/basic/base/aimath/aimath_f32.o \
./Core/aifes/basic/base/aimath/aimath_q31.o \
./Core/aifes/basic/base/aimath/aimath_q7.o \
./Core/aifes/basic/base/aimath/aimath_u8.o 

C_DEPS += \
./Core/aifes/basic/base/aimath/aimath_basic.d \
./Core/aifes/basic/base/aimath/aimath_f32.d \
./Core/aifes/basic/base/aimath/aimath_q31.d \
./Core/aifes/basic/base/aimath/aimath_q7.d \
./Core/aifes/basic/base/aimath/aimath_u8.d 


# Each subdirectory must supply rules for building sources it contributes
Core/aifes/basic/base/aimath/%.o Core/aifes/basic/base/aimath/%.su Core/aifes/basic/base/aimath/%.cyclo: ../Core/aifes/basic/base/aimath/%.c Core/aifes/basic/base/aimath/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-aifes-2f-basic-2f-base-2f-aimath

clean-Core-2f-aifes-2f-basic-2f-base-2f-aimath:
	-$(RM) ./Core/aifes/basic/base/aimath/aimath_basic.cyclo ./Core/aifes/basic/base/aimath/aimath_basic.d ./Core/aifes/basic/base/aimath/aimath_basic.o ./Core/aifes/basic/base/aimath/aimath_basic.su ./Core/aifes/basic/base/aimath/aimath_f32.cyclo ./Core/aifes/basic/base/aimath/aimath_f32.d ./Core/aifes/basic/base/aimath/aimath_f32.o ./Core/aifes/basic/base/aimath/aimath_f32.su ./Core/aifes/basic/base/aimath/aimath_q31.cyclo ./Core/aifes/basic/base/aimath/aimath_q31.d ./Core/aifes/basic/base/aimath/aimath_q31.o ./Core/aifes/basic/base/aimath/aimath_q31.su ./Core/aifes/basic/base/aimath/aimath_q7.cyclo ./Core/aifes/basic/base/aimath/aimath_q7.d ./Core/aifes/basic/base/aimath/aimath_q7.o ./Core/aifes/basic/base/aimath/aimath_q7.su ./Core/aifes/basic/base/aimath/aimath_u8.cyclo ./Core/aifes/basic/base/aimath/aimath_u8.d ./Core/aifes/basic/base/aimath/aimath_u8.o ./Core/aifes/basic/base/aimath/aimath_u8.su

.PHONY: clean-Core-2f-aifes-2f-basic-2f-base-2f-aimath

