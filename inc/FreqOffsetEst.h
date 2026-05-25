#ifndef FREQOFFSETEST_H_
#define FREQOFFSETEST_H_
#include "ucps2.h"
#include "ucpm2.h"

MPU_ENTRY void FreqOffsetEstAsm(v16u32 src);

//void FreqOffsetEst(int* ConfigBaseAddr,int NPort,int NRE,int NAnt,int FactorRecip,int FactorF,int FactorID,int InputAddr0,int InputAddr1,int LUTAddr,int OutputAddr0,int OutputAddr1);
void FreqOffsetEst(int* ConfigBaseAddr,int round,int init_4block_gap,int LGA,int LPART,int LBlock,int NBlock,int thetaAddr,int InputAddr0,int GaAddr,int LUTAddr,int OutputAddr0,int fo_initAddr);
#endif /* FREQOFFSETEST_H_ */
