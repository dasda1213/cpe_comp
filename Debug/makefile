################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/spu/subdir.mk
-include src/mpu0/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(M.C_DEPS)),)
-include $(M.C_DEPS)
endif
ifneq ($(strip $(S.C_DEPS)),)
-include $(S.C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := cpe_comp_2
BUILD_ARTIFACT_EXTENSION := out
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
HEX += \
cpe_comp_2.hex \


# All Target
all: main-build

# Main-build Target
main-build: cpe_comp_2.out secondary-outputs

# Tool invocations
cpe_comp_2.out: $(OBJS) $(USER_OBJS) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: lld (linker)'
	ld.lld -L/home/rose/a/mcstudio/toolchain/lib/ucp2/debug -L$(PWD) -T ${TOOLCHAIN_HOME}/include/ucp2/ape0-Cache64-noMPUC.ld -o "cpe_comp_2.out" $(USER_OBJS) $(OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

cpe_comp_2.hex: $(BUILD_ARTIFACT) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: Create UCP2 Hex Image'
	/home/rose/a/mcstudio/toolchain/bin/ucp2/ucpm2_pretty_hexdump.sh $(BUILD_ARTIFACT) "cpe_comp_2.hex"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) cpe_comp_2.hex cpe_comp_2.out
	-@echo ' '

secondary-outputs: $(HEX)

.PHONY: all clean dependents main-build

-include ../makefile.targets

cpe_comp_2.out: 
