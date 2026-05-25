################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
M0.ASM_SRCS += \
../src/mpu0/FreqOffsetEstAsm.m0.asm \
../src/mpu0/get_fo_estAsm.m0.asm 

OBJS += \
./src/mpu0/FreqOffsetEstAsm.m0.o \
./src/mpu0/get_fo_estAsm.m0.o 


# Each subdirectory must supply rules for building sources it contributes
src/mpu0/%.m0.o: ../src/mpu0/%.m0.asm src/mpu0/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: llvm-mc (assembler)'
	llvm-mc -arch=ucpm2 -filetype=obj -g -I"/home/rose/cpe_comp_2/inc" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-mpu0

clean-src-2f-mpu0:
	-$(RM) ./src/mpu0/FreqOffsetEstAsm.m0.o ./src/mpu0/get_fo_estAsm.m0.o

.PHONY: clean-src-2f-mpu0

