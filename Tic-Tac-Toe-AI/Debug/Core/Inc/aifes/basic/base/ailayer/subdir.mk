################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/basic/base/ailayer/ailayer_dense.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_elu.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_input.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_leaky_relu.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_relu.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_sigmoid.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_softmax.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_softsign.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_tanh.c \
../Core/Inc/aifes/basic/base/ailayer/ailayer_template.c 

OBJS += \
./Core/Inc/aifes/basic/base/ailayer/ailayer_dense.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_elu.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_input.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_leaky_relu.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_relu.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_sigmoid.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_softmax.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_softsign.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_tanh.o \
./Core/Inc/aifes/basic/base/ailayer/ailayer_template.o 

C_DEPS += \
./Core/Inc/aifes/basic/base/ailayer/ailayer_dense.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_elu.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_input.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_leaky_relu.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_relu.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_sigmoid.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_softmax.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_softsign.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_tanh.d \
./Core/Inc/aifes/basic/base/ailayer/ailayer_template.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/basic/base/ailayer/%.o Core/Inc/aifes/basic/base/ailayer/%.su Core/Inc/aifes/basic/base/ailayer/%.cyclo: ../Core/Inc/aifes/basic/base/ailayer/%.c Core/Inc/aifes/basic/base/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-ailayer

clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-ailayer:
	-$(RM) ./Core/Inc/aifes/basic/base/ailayer/ailayer_dense.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_dense.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_dense.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_dense.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_elu.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_elu.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_elu.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_elu.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_input.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_input.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_input.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_input.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_leaky_relu.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_leaky_relu.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_leaky_relu.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_leaky_relu.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_relu.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_relu.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_relu.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_relu.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_sigmoid.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_sigmoid.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_sigmoid.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_sigmoid.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_softmax.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_softmax.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_softmax.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_softmax.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_softsign.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_softsign.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_softsign.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_softsign.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_tanh.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_tanh.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_tanh.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_tanh.su ./Core/Inc/aifes/basic/base/ailayer/ailayer_template.cyclo ./Core/Inc/aifes/basic/base/ailayer/ailayer_template.d ./Core/Inc/aifes/basic/base/ailayer/ailayer_template.o ./Core/Inc/aifes/basic/base/ailayer/ailayer_template.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-base-2f-ailayer

