
#ifndef REMOVE_MC_TEST
#include "ucps2.h"
#include "ucpm2.h"

#include <FreqOffsetEst.h>
#include <get_fo_est.h>


__DM0 int InputAddr0[] = {
//#include <deocc_agc_out0.dat>//RE=300
//#include <deltaf_Est_in_Ant4_Port1.dat>//RE=150*6
#include <test_data.dat>//RE=273*6
//#include <deltaf_Est_in_Ant2_Port1.dat>//RE=150*6
};
//__DM0 int InputAddr1[] = {
//#include <deocc_agc_out1.dat>//RE=300
//};
__DM0 int GaAddr[] = {
  #include <Ga64.dat>
};

__DM0 int LUTAddr[] = {
  #include <LUT_Atan.dat>
};
__DM0 int thetaAddr[] = {
  #include <sin_cos.dat>
};
__DM0 int fo_initAddr[] = {
  #include <fo_init.dat>
};
__DM4 int OutputAddr0[16] = {0};
__DM5 int OutputAddr1[16] = {0};

__DM3 int ConfigBaseAddr[] = {
  #include <ConfigFreqOffsetEst.dat>
};
__DM3 int Configfo_est_Addr[] = {
  #include <ConfigGet_fo_est>
};

v16u32 KI = {2,4,6};

__DM3 v16s32 SVRReg  = {
		0, 0, 0, 0,
		0x40, 0, 0, 0,
		0xff00ff, 0, 0, 0x0000,
		0xffff, 0x6, 0, 0
};

int main()
{
	volatile int a = 1;

	int LGA = 128;
	int LPART=128;
	int LBlock = 1024;
	int NBlock = 8;
	int round=16;
	int spu_start = 0;
	int spu_end = 0;
	long fo_init=0;
	int mpu_start = 0;
	int mpu_end = 0;

	spu_start = tick();
	//FreqOffsetEst(ConfigBaseAddr,NPort,NRE,NAnt,FactorRecip,FactorF,FactorID,MPU_ADDR(InputAddr0),InputAddr1,LUTAddr,OutputAddr0,OutputAddr1);
	get_fo_est(Configfo_est_Addr,LGA,LPART,LBlock,NBlock,MPU_ADDR(GaAddr),MPU_ADDR(LUTAddr),OutputAddr0);
	SVRReg[0] = MPU_ADDR(Configfo_est_Addr);
	spu_end = tick();
	printf("spu runs = %d\n", spu_end - spu_start);
	mpu_start = tick();
	get_fo_estAsm(SVRReg);
	a = __ucps2_getStatB();
	__ucps2_delay();
	//for(int i=0;i<round;i++){
		fo_init=angle_multiply_saturate((long)OutputAddr0[0], 8*75);
		FreqOffsetEst(ConfigBaseAddr,75,fo_init,LGA,LPART,LBlock,NBlock,MPU_ADDR(thetaAddr),MPU_ADDR(InputAddr0),MPU_ADDR(GaAddr),MPU_ADDR(LUTAddr),OutputAddr0,MPU_ADDR(fo_initAddr));
		SVRReg[0] = MPU_ADDR(ConfigBaseAddr);
		FreqOffsetEstAsm(SVRReg);
	//}
	mpu_end = tick();
	printf("mpu  runs=%d\n", mpu_end - mpu_start);


	return 0;
}

#endif //DEBUG_MC
