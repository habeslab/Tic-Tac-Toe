################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/aifes/cnn/default/ailayer/ailayer_batch_normalization_default.c \
../Core/aifes/cnn/default/ailayer/ailayer_conv2d_default.c \
../Core/aifes/cnn/default/ailayer/ailayer_maxpool2d_default.c \
../Core/aifes/cnn/default/ailayer/ailayer_reshape_default.c 

OBJS += \
./Core/aifes/cnn/default/ailayer/ailayer_batch_normalization_default.o \
./Core/aifes/cnn/default/ailayer/ailayer_conv2d_default.o \
./Core/aifes/cnn/default/ailayer/ailayer_maxpool2d_default.o \
./Core/aifes/cnn/default/ailayer/ailayer_reshape_default.o 

C_DEPS += \
./Core/aifes/cnn/default/ailayer/ailayer_batch_normalization_default.d \
./Core/aifes/cnn/default/ailayer/ailayer_conv2d_default.d \
./Core/aifes/cnn/default/ailayer/ailayer_maxpool2d_default.d \
./Core/aifes/cnn/default/ailayer/ailayer_reshape_default.d 


# Each subdirectory must supply rules for building sources it contributes
Core/aifes/cnn/default/ailayer/%.o Core/aifes/cnn/default/ailayer/%.su Core/aifes/cnn/default/ailayer/%.cyclo: ../Core/aifes/cnn/default/ailayer/%.c Core/aifes/cnn/default/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-aifes-2f-cnn-2f-default-2f-ailayer

clean-Core-2f-aifes-2f-cnn-2f-default-2f-ailayer:
	-$(RM) ./Core/aifes/cnn/default/ailayer/ailayer_batch_normalization_default.cyclo ./Core/aifes/cnn/default/ailayer/ailayer_batch_normalization_default.d ./Core/aifes/cnn/default/ailayer/ailayer_batch_normalization_default.o ./Core/aifes/cnn/default/ailayer/ailayer_batch_normalization_default.su ./Core/aifes/cnn/default/ailayer/ailayer_conv2d_default.cyclo ./Core/aifes/cnn/default/ailayer/ailayer_conv2d_default.d ./Core/aifes/cnn/default/ailayer/ailayer_conv2d_default.o ./Core/aifes/cnn/default/ailayer/ailayer_conv2d_default.su ./Core/aifes/cnn/default/ailayer/ailayer_maxpool2d_default.cyclo ./Core/aifes/cnn/default/ailayer/ailayer_maxpool2d_default.d ./Core/aifes/cnn/default/ailayer/ailayer_maxpool2d_default.o ./Core/aifes/cnn/default/ailayer/ailayer_maxpool2d_default.su ./Core/aifes/cnn/default/ailayer/ailayer_reshape_default.cyclo ./Core/aifes/cnn/default/ailayer/ailayer_reshape_default.d ./Core/aifes/cnn/default/ailayer/ailayer_reshape_default.o ./Core/aifes/cnn/default/ailayer/ailayer_reshape_default.su

.PHONY: clean-Core-2f-aifes-2f-cnn-2f-default-2f-ailayer

