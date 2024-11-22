################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/aifes/cnn/default/aimath/subdir.mk
-include Core/aifes/cnn/default/ailayer/subdir.mk
-include Core/aifes/cnn/base/ailayer/subdir.mk
-include Core/aifes/basic/express/subdir.mk
-include Core/aifes/basic/default/aiopti/subdir.mk
-include Core/aifes/basic/default/aimath/subdir.mk
-include Core/aifes/basic/default/ailoss/subdir.mk
-include Core/aifes/basic/default/ailayer/subdir.mk
-include Core/aifes/basic/cmsis/aimath/subdir.mk
-include Core/aifes/basic/cmsis/ailayer/subdir.mk
-include Core/aifes/basic/base/aiopti/subdir.mk
-include Core/aifes/basic/base/aimath/subdir.mk
-include Core/aifes/basic/base/ailoss/subdir.mk
-include Core/aifes/basic/base/ailayer/subdir.mk
-include Core/aifes/basic/base/aialgo/subdir.mk
-include Core/aifes/basic/avr_pgm/aimath/subdir.mk
-include Core/aifes/basic/avr_pgm/ailayer/subdir.mk
-include Core/aifes/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := Tic-Tac-Toe
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
Tic-Tac-Toe.elf \

MAP_FILES += \
Tic-Tac-Toe.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
Tic-Tac-Toe.list \


# All Target
all: main-build

# Main-build Target
main-build: Tic-Tac-Toe.elf secondary-outputs

# Tool invocations
Tic-Tac-Toe.elf Tic-Tac-Toe.map: $(OBJS) $(USER_OBJS) C:\Users\umber\Progetti\Tic-Tac-Toe-STM32\Tic-Tac-Toe\STM32F401RETX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "Tic-Tac-Toe.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\umber\Progetti\Tic-Tac-Toe-STM32\Tic-Tac-Toe\STM32F401RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="Tic-Tac-Toe.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -u _printf_float -u _scanf_float -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

Tic-Tac-Toe.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "Tic-Tac-Toe.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) Tic-Tac-Toe.elf Tic-Tac-Toe.list Tic-Tac-Toe.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
