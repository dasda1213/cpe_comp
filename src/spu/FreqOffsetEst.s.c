#include "ucps2.h"
#include "ucpm2.h"
#include "FreqOffsetEst.h"


void FreqOffsetEst(int* ConfigBaseAddr,int round,long fo_init,int LGA,int LPART,int LBlock,int NBlock,int thetaAddr,int InputAddr0,int GaAddr,int LUTAddr,int OutputAddr0,int fo_initAddr){

	int *Para = ConfigBaseAddr;

	//int cyc = ((NRE + 15) >> 4);
	int AddrOffset = LBlock << 2;
	int AddrOffset1 = 0x504 << 2;
	int AddrOffset2 = 0x400 << 4;//1024*4 point
	//int AddrOffset3 = (4*LBlock*init_4block_gap) << 2;

	Para[0] = NBlock >> 2;
	Para[1] = LPART>> 4;
	Para[2] = 2*LGA>>4;
	Para[3] = 4*LBlock >>7;//1024*4/128
	//Para[4] = (LBlock >>7)*init_4block_gap;//1024*gap/128
	//Para[4] = init_4block_gap;

	//input Symbol0
	Para[16*1+0] = InputAddr0 + AddrOffset;
	Para[16*1+1] = InputAddr0 + AddrOffset;
	Para[16*1+2] = InputAddr0 + AddrOffset;
	Para[16*1+4] = LBlock << 2;
	Para[16*1+5] = 0x40;
	Para[16*1+6] = (LBlock*4) << 2;
	Para[16*1+10] = (NBlock << 14) + (NBlock>>2) ;

	//Ga64
	Para[16*2+0] = GaAddr;
	Para[16*2+1] = GaAddr;
	Para[16*2+2] = GaAddr;
	Para[16*2+4] = 0x200;
	Para[16*2+5] = 0x40;
	Para[16*2+6] = (LBlock*4) << 2;
	Para[16*2+10] = (NBlock << 14) + (NBlock>>2) ;

	//theta
	Para[16*4+0] = thetaAddr;

	//fo_est
	Para[16*5+0] = OutputAddr0;

	//input 旋转
	Para[16*8+0] = InputAddr0;
	Para[16*8+1] = InputAddr0;
	Para[16*8+2] = InputAddr0;
	//Para[16*8+0] = InputAddr0+AddrOffset1+AddrOffset2*round;
	//Para[16*8+1] = InputAddr0+AddrOffset1+AddrOffset2*round;
	//Para[16*8+2] = InputAddr0+AddrOffset1+AddrOffset2*round;
	Para[16*8+4] = 0x40;
	Para[16*8+5] = 0x40;
	Para[16*8+6] = (LBlock*4) << 2;
	Para[16*8+10] = (NBlock << 14) + (NBlock>>2) ;

	//LUTAddr
	Para[16*11+0] = LUTAddr;


	Para[16*15+0] = OutputAddr0+AddrOffset1;
	Para[16*15+1] = OutputAddr0+AddrOffset1;
	Para[16*15+2] = OutputAddr0+AddrOffset1;
	//Para[16*15+0] = OutputAddr0+AddrOffset1+AddrOffset2*round;
	//Para[16*15+1] = OutputAddr0+AddrOffset1+AddrOffset2*round;
	//Para[16*15+2] = OutputAddr0+AddrOffset1+AddrOffset2*round;
	Para[16*15+4] = 0x40;
	Para[16*15+5] = 0x40;
	Para[16*15+6] = (LBlock*4) << 2;
	Para[16*15+10] = (NBlock << 14) + (NBlock>>2) ;

	Para[16*16+0] =fo_initAddr;
	Para[16*16+1] =fo_initAddr;
	Para[16*16+2] =fo_initAddr;
	//Para[16*16+0] = OutputAddr1;
	//Para[16*16+0] = OutputAddr1;
	//Para[16*16+1] = OutputAddr1;
	//Para[16*16+2] = OutputAddr1;
	//Para[16*16+4] = LBlock << 2;
	//Para[16*16+5] = 0x40;
	//Para[16*16+6] = (LBlock*2) << 2;
	//Para[16*16+10] = (NBlock << 14) + (NBlock>>2) ;

	//Ga64_Load
	Para[16*17+0] = GaAddr+0x400;
	Para[16*17+1] = GaAddr+0x400;
	Para[16*17+2] = GaAddr+0x400;
	Para[16*17+4] = 0x200;
	Para[16*17+5] = 0x40;
	Para[16*17+6] = (LBlock*4) << 2;
	Para[16*17+10] = (NBlock << 14) + (NBlock>>2) ;

	//fo_init_new
	Para[16*18+0] = fo_init;




	return;


}
