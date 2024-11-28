################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/aifes/cnn/base/ailayer/ailayer_batch_normalization.c \
../Core/Inc/aifes/cnn/base/ailayer/ailayer_conv2d.c \
../Core/Inc/aifes/cnn/base/ailayer/ailayer_maxpool2d.c \
../Core/Inc/aifes/cnn/base/ailayer/ailayer_reshape.c 

OBJS += \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_batch_normalization.o \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_conv2d.o \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_maxpool2d.o \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_reshape.o 

C_DEPS += \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_batch_normalization.d \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_conv2d.d \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_maxpool2d.d \
./Core/Inc/aifes/cnn/base/ailayer/ailayer_reshape.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/aifes/cnn/base/ailayer/%.o Core/Inc/aifes/cnn/base/ailayer/%.su Core/Inc/aifes/cnn/base/ailayer/%.cyclo: ../Core/Inc/aifes/cnn/base/ailayer/%.c Core/Inc/aifes/cnn/base/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Core/aifes -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-aifes-2f-cnn-2f-base-2f-ailayer

clean-Core-2f-Inc-2f-aifes-2f-cnn-2f-base-2f-ailayer:
	-$(RM) ./Core/Inc/aifes/cnn/base/ailayer/ailayer_batch_normalization.cyclo ./Core/Inc/aifes/cnn/base/ailayer/ailayer_batch_normalization.d ./Core/Inc/aifes/cnn/base/ailayer/ailayer_batch_normalization.o ./Core/Inc/aifes/cnn/base/ailayer/ailayer_batch_normalization.su ./Core/Inc/aifes/cnn/base/ailayer/ailayer_conv2d.cyclo ./Core/Inc/aifes/cnn/base/ailayer/ailayer_conv2d.d ./Core/Inc/aifes/cnn/base/ailayer/ailayer_conv2d.o ./Core/Inc/aifes/cnn/base/ailayer/ailayer_conv2d.su ./Core/Inc/aifes/cnn/base/ailayer/ailayer_maxpool2d.cyclo ./Core/Inc/aifes/cnn/base/ailayer/ailayer_maxpool2d.d ./Core/Inc/aifes/cnn/base/ailayer/ailayer_maxpool2d.o ./Core/Inc/aifes/cnn/base/ailayer/ailayer_maxpool2d.su ./Core/Inc/aifes/cnn/base/ailayer/ailayer_reshape.cyclo ./Core/Inc/aifes/cnn/base/ailayer/ailayer_reshape.d ./Core/Inc/aifes/cnn/base/ailayer/ailayer_reshape.o ./Core/Inc/aifes/cnn/base/ailayer/ailayer_reshape.su

.PHONY: clean-Core-2f-Inc-2f-aifes-2f-cnn-2f-base-2f-ailayer

