################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/aifes/basic/default/ailayer/ailayer_dense_default.c \
../Core/aifes/basic/default/ailayer/ailayer_elu_default.c \
../Core/aifes/basic/default/ailayer/ailayer_input_default.c \
../Core/aifes/basic/default/ailayer/ailayer_leaky_relu_default.c \
../Core/aifes/basic/default/ailayer/ailayer_relu_default.c \
../Core/aifes/basic/default/ailayer/ailayer_sigmoid_default.c \
../Core/aifes/basic/default/ailayer/ailayer_softmax_default.c \
../Core/aifes/basic/default/ailayer/ailayer_softsign_default.c \
../Core/aifes/basic/default/ailayer/ailayer_tanh_default.c 

OBJS += \
./Core/aifes/basic/default/ailayer/ailayer_dense_default.o \
./Core/aifes/basic/default/ailayer/ailayer_elu_default.o \
./Core/aifes/basic/default/ailayer/ailayer_input_default.o \
./Core/aifes/basic/default/ailayer/ailayer_leaky_relu_default.o \
./Core/aifes/basic/default/ailayer/ailayer_relu_default.o \
./Core/aifes/basic/default/ailayer/ailayer_sigmoid_default.o \
./Core/aifes/basic/default/ailayer/ailayer_softmax_default.o \
./Core/aifes/basic/default/ailayer/ailayer_softsign_default.o \
./Core/aifes/basic/default/ailayer/ailayer_tanh_default.o 

C_DEPS += \
./Core/aifes/basic/default/ailayer/ailayer_dense_default.d \
./Core/aifes/basic/default/ailayer/ailayer_elu_default.d \
./Core/aifes/basic/default/ailayer/ailayer_input_default.d \
./Core/aifes/basic/default/ailayer/ailayer_leaky_relu_default.d \
./Core/aifes/basic/default/ailayer/ailayer_relu_default.d \
./Core/aifes/basic/default/ailayer/ailayer_sigmoid_default.d \
./Core/aifes/basic/default/ailayer/ailayer_softmax_default.d \
./Core/aifes/basic/default/ailayer/ailayer_softsign_default.d \
./Core/aifes/basic/default/ailayer/ailayer_tanh_default.d 


# Each subdirectory must supply rules for building sources it contributes
Core/aifes/basic/default/ailayer/%.o Core/aifes/basic/default/ailayer/%.su Core/aifes/basic/default/ailayer/%.cyclo: ../Core/aifes/basic/default/ailayer/%.c Core/aifes/basic/default/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-aifes-2f-basic-2f-default-2f-ailayer

clean-Core-2f-aifes-2f-basic-2f-default-2f-ailayer:
	-$(RM) ./Core/aifes/basic/default/ailayer/ailayer_dense_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_dense_default.d ./Core/aifes/basic/default/ailayer/ailayer_dense_default.o ./Core/aifes/basic/default/ailayer/ailayer_dense_default.su ./Core/aifes/basic/default/ailayer/ailayer_elu_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_elu_default.d ./Core/aifes/basic/default/ailayer/ailayer_elu_default.o ./Core/aifes/basic/default/ailayer/ailayer_elu_default.su ./Core/aifes/basic/default/ailayer/ailayer_input_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_input_default.d ./Core/aifes/basic/default/ailayer/ailayer_input_default.o ./Core/aifes/basic/default/ailayer/ailayer_input_default.su ./Core/aifes/basic/default/ailayer/ailayer_leaky_relu_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_leaky_relu_default.d ./Core/aifes/basic/default/ailayer/ailayer_leaky_relu_default.o ./Core/aifes/basic/default/ailayer/ailayer_leaky_relu_default.su ./Core/aifes/basic/default/ailayer/ailayer_relu_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_relu_default.d ./Core/aifes/basic/default/ailayer/ailayer_relu_default.o ./Core/aifes/basic/default/ailayer/ailayer_relu_default.su ./Core/aifes/basic/default/ailayer/ailayer_sigmoid_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_sigmoid_default.d ./Core/aifes/basic/default/ailayer/ailayer_sigmoid_default.o ./Core/aifes/basic/default/ailayer/ailayer_sigmoid_default.su ./Core/aifes/basic/default/ailayer/ailayer_softmax_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_softmax_default.d ./Core/aifes/basic/default/ailayer/ailayer_softmax_default.o ./Core/aifes/basic/default/ailayer/ailayer_softmax_default.su ./Core/aifes/basic/default/ailayer/ailayer_softsign_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_softsign_default.d ./Core/aifes/basic/default/ailayer/ailayer_softsign_default.o ./Core/aifes/basic/default/ailayer/ailayer_softsign_default.su ./Core/aifes/basic/default/ailayer/ailayer_tanh_default.cyclo ./Core/aifes/basic/default/ailayer/ailayer_tanh_default.d ./Core/aifes/basic/default/ailayer/ailayer_tanh_default.o ./Core/aifes/basic/default/ailayer/ailayer_tanh_default.su

.PHONY: clean-Core-2f-aifes-2f-basic-2f-default-2f-ailayer

