################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S.C_SRCS += \
../src/spu/FreqOffsetEst.s.c \
../src/spu/get_fo_est.s.c \
../src/spu/main.s.c 

OBJS += \
./src/spu/FreqOffsetEst.s.o \
./src/spu/get_fo_est.s.o \
./src/spu/main.s.o 

S.C_DEPS += \
./src/spu/FreqOffsetEst.s.d \
./src/spu/get_fo_est.s.d \
./src/spu/main.s.d 


# Each subdirectory must supply rules for building sources it contributes
src/spu/%.s.o: ../src/spu/%.s.c src/spu/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: clang (compiler)'
	clang $(REF_INCS) -I/home/rose/a/mcstudio/toolchain/include/ucp2/llvm -I/home/rose/a/mcstudio/toolchain/include/ucp2/newlib -I"/home/rose/cpe_comp_2/inc" -O0 -g -Wno-constant-conversion -c -nostdlibinc --target=ucps2 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-spu

clean-src-2f-spu:
	-$(RM) ./src/spu/FreqOffsetEst.s.d ./src/spu/FreqOffsetEst.s.o ./src/spu/get_fo_est.s.d ./src/spu/get_fo_est.s.o ./src/spu/main.s.d ./src/spu/main.s.o

.PHONY: clean-src-2f-spu

