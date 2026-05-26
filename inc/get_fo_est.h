#ifndef GET_FO_EST_H_
#define GET_FO_EST_H_
#include "ucps2.h"
#include "ucpm2.h"

MPU_ENTRY void get_fo_estAsm(v16u32 src);

//void FreqOffsetEst(int* ConfigBaseAddr,int NPort,int NRE,int NAnt,int FactorRecip,int FactorF,int FactorID,int InputAddr0,int InputAddr1,int LUTAddr,int OutputAddr0,int OutputAddr1);
void get_fo_est(int* ConfigBaseAddr,int LGA,int LPART,int LBlock,int NBlock,int GaAddr,int LUTAddr,int OutputAddr0);
#endif /* GET_FO_EST_H_ */
