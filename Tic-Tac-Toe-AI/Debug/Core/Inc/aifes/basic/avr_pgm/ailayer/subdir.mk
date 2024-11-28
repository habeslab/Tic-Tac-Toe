################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_dense_avr_pgm.c \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_elu_avr_pgm.c \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_leaky_relu_avr_pgm.c \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_relu_avr_pgm.c \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_sigmoid_avr_pgm.c \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softmax_avr_pgm.c \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softsign_avr_pgm.c \
../Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_tanh_avr_pgm.c 

OBJS += \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_dense_avr_pgm.o \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_elu_avr_pgm.o \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_leaky_relu_avr_pgm.o \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_relu_avr_pgm.o \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_sigmoid_avr_pgm.o \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softmax_avr_pgm.o \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softsign_avr_pgm.o \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_tanh_avr_pgm.o 

C_DEPS += \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_dense_avr_pgm.d \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_elu_avr_pgm.d \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_leaky_relu_avr_pgm.d \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_relu_avr_pgm.d \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_sigmoid_avr_pgm.d \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softmax_avr_pgm.d \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softsign_avr_pgm.d \
./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_tanh_avr_pgm.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/basic/avr_pgm/ailayer/%.o Core/Inc/aifes/basic/avr_pgm/ailayer/%.su Core/Inc/aifes/basic/avr_pgm/ailayer/%.cyclo: ../Core/Inc/aifes/basic/avr_pgm/ailayer/%.c Core/Inc/aifes/basic/avr_pgm/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-avr_pgm-2f-ailayer

clean-Core-2f-Inc-2f-aifes-2f-basic-2f-avr_pgm-2f-ailayer:
	-$(RM) ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_dense_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_dense_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_dense_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_dense_avr_pgm.su ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_elu_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_elu_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_elu_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_elu_avr_pgm.su ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_leaky_relu_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_leaky_relu_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_leaky_relu_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_leaky_relu_avr_pgm.su ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_relu_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_relu_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_relu_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_relu_avr_pgm.su ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_sigmoid_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_sigmoid_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_sigmoid_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_sigmoid_avr_pgm.su ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softmax_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softmax_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softmax_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softmax_avr_pgm.su ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softsign_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softsign_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softsign_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_softsign_avr_pgm.su ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_tanh_avr_pgm.cyclo ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_tanh_avr_pgm.d ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_tanh_avr_pgm.o ./Core/Inc/aifes/basic/avr_pgm/ailayer/ailayer_tanh_avr_pgm.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-basic-2f-avr_pgm-2f-ailayer

