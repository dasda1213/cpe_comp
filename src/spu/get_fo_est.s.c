#include "ucps2.h"
#include "ucpm2.h"
#include "get_fo_est.h"


void get_fo_est(int* ConfigBaseAddr,int LGA,int LPART,int LBlock,int NBlock,int GaAddr,int LUTAddr,int OutputAddr0,int fo_initAddr){

	int *Para = ConfigBaseAddr;

	//int cyc = ((NRE + 15) >> 4);
	int AddrOffset = LBlock << 2;
	int AddrOffset1 = 0x504 << 2;

	Para[0] = NBlock >> 2;
	Para[1] = LPART>> 4;
	Para[2] = 2*LGA>>4;
	Para[3] = 4*LBlock >>7;//1024*4/128

	//Ga64
	Para[16*1+0] = GaAddr;
	Para[16*1+1] = GaAddr;
	Para[16*1+2] = GaAddr;
	Para[16*1+4] = 0x200;
	Para[16*1+5] = 0x40;
	Para[16*1+6] = (LBlock*4) << 2;
	Para[16*1+10] = (NBlock << 14) + (NBlock>>2) ;

	//LUTAddr
	Para[16*5+0] = LUTAddr;

	//OutputAddr(fo_est)
	Para[16*9+0] = OutputAddr0;
	Para[16*9+1] = OutputAddr0;
	Para[16*9+2] = OutputAddr0;
	Para[16*9+4] = 0x40;
	Para[16*9+5] = 0x40;
	Para[16*9+6] = (LBlock*4) << 2;
	Para[16*9+10] = (NBlock << 14) + (NBlock>>2) ;

	//Para[16*16+0] =fo_initAddr;
	//Para[16*16+0] = OutputAddr1;
	//Para[16*16+0] = OutputAddr1;
	//Para[16*16+1] = OutputAddr1;
	//Para[16*16+2] = OutputAddr1;
	//Para[16*16+4] = LBlock << 2;
	//Para[16*16+5] = 0x40;
	//Para[16*16+6] = (LBlock*2) << 2;
	//Para[16*16+10] = (NBlock << 14) + (NBlock>>2) ;

	//Ga64_Load
	Para[16*10+0] = GaAddr+0x400;
	Para[16*10+1] = GaAddr+0x400;
	Para[16*10+2] = GaAddr+0x400;
	Para[16*10+4] = 0x200;
	Para[16*10+5] = 0x40;
	Para[16*10+6] = (LBlock*4) << 2;
	Para[16*10+10] = (NBlock << 14) + (NBlock>>2) ;




	return;


}
