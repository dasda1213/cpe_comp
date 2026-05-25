	.section .text.m0, "ax"
	.ifdef enable_dynamic_mim
	.include "FreqOffsetEstAsm.inc"
	.endif
	.file	"FreqOffsetEstAsm.m0.asm"
	// DO NOT MODIFY THE CONTENT ABOVE
	.global FreqOffsetEstAsm
FreqOffsetEstAsm:
    R1:M[0]->BIU1.T0;
	NOP;
	NOP;
	NOP;
	BIU1:Load(T0)(A++) -> M[112](W1)(Mode0)||IMA0:V(0)->IMA0.T0(Mode0)||IMA1:V(0)->IMA1.T0(Mode0)||IMA2:V(0)->IMA2.T0(Mode0)||IMA3:V(0)->IMA3.T0(Mode0);//ki
	BIU1:Load(T0)(A++) -> M[1](W1)(Mode0);//input Symbol0
	BIU1:Load(T0)(A++) -> M[2](W1)(Mode0)||IMA0:VHigh(T0,0)->IMA0.T0(Mode0)||IMA1:VHigh(T0,0)->IMA1.T0(Mode0)||IMA2:VHigh(T0,0)->IMA2.T0(Mode0)||IMA3:VHigh(T0,0)->IMA3.T0(Mode0);//Ga64
	BIU1:Load(T0)(A++) -> M[3](Mode0);//SHU T6
	BIU1:Load(T0)(A++) -> M[4](Mode0)||IMA0:SetShiftMode(T0)->ShiftMode0(Mode0)||IMA1:SetShiftMode(T0)->ShiftMode0(Mode0)||IMA2:SetShiftMode(T0)->ShiftMode0(Mode0)||IMA3:SetShiftMode(T0)->ShiftMode0(Mode0);//theta
	BIU1:Load(T0)(A++) -> M[5](W1)(Mode0)||IMA1:V(1)->IMA1.T0(Mode0);//fo_est
	BIU1:Load(T0)(A++) -> M[6](W1)(Mode0);//SHU imag
	BIU1:Load(T0)(A++) -> M[14](W1)(Mode0)||IMA1:VHigh(T0,0)->M[13](Mode0);//latch
	BIU1:Load(T0)(A++) -> M[15](W1)(Mode0)||IMA0:V(512)->IMA0.T1(Mode0)||IMA1:V(512)->IMA1.T1(Mode0)||IMA2:V(512)->IMA2.T1(Mode0)||IMA3:V(512)->IMA3.T1(Mode0);//input——load
	BIU1:Load(T0)(A++) -> M[7](W1)(Mode0)||IMA0:VHigh(Ttmp,0)->IMA0.T1(Mode0)||IMA1:VHigh(Ttmp,0)->IMA1.T1(Mode0)||IMA2:VHigh(Ttmp,0)->IMA2.T1(Mode0)||IMA3:VHigh(Ttmp,0)->IMA3.T1(Mode0);//32767
	BIU1:Load(T0)(A++) -> M[8](W1)(Mode0);//-32768
	BIU1:Load(T0)(A++) -> M[9](W1)(Mode0)||R1:M[2]->BIU1.T1(Mode0)||IMA0:SetShiftMode(T1)->ShiftMode1(Mode0)||IMA1:SetShiftMode(T1)->ShiftMode1(Mode0)||IMA2:SetShiftMode(T1)->ShiftMode1(Mode0)||IMA3:SetShiftMode(T1)->ShiftMode1(Mode0);//LUTAddr
	BIU1:Load(T0)(A++) -> M[10](W1)(Mode0)||R0:M[3]->SHU0.T6(Mode0)||R1:M[3]->SHU1.T6(Mode0)||R5:PreConfig(M[112]);//12868
	BIU1:Load(T0)(A++) -> M[11](W1)(Mode0)||R2:M[3]->SHU2.T6(Mode0)||R3:M[3]->SHU3.T6(Mode0)||R5:WriteConf(Mfetch)->KI[0-15](Mode0);//-12868
	BIU1:Load(T0)(A++) -> M[12](W1)(Mode0);//25736
	BIU1:Load(T0)(A++) -> M[16](W1)(Mode0);//output0
	BIU1:Load(T0)(A++) -> M[17](W1)(Mode0);//fo_init
	BIU1:Load(T0)(A++) -> M[18](W1)(Mode0);//Ga_Load
	BIU1:Load(T0)(A++) -> M[19](W1)(Mode0);//51742
	//R0:M[1]->BIU0.T0(Mode0);
	R1:M[5] -> BIU1.T0;//fo_estAddr
	R0:PreConfig(M[14])(Mode0)||R2:PreConfig(M[14])(Mode0);//latch
	R0:WriteConf(RLatch0)(Mode0)||R2:WriteConf(RLatch2)(Mode0);
	R0:WriteConf(WLatch1)(Mode0);
    R2:PreConfig(M[14])(Mode0)||R0:PreConfig(M[14])(Mode0);
	R2:WriteConf(RLatch3)(Mode0)||R0:WriteConf(RLatch1)(Mode0);
	NOP;
	NOP;
	R0:M[18]->BIU0.T0(Mode0);
	R2:M[16] -> BIU2.T0;
	R3:M[17] -> BIU3.T0;
	NOP;

	//Mfetch:Lpto %BLOCKCyc @(KI0);//总循环

	BIU1:Load(T0)(A++) -> M[58](W1)(Mode0);//load fo_est
	BIU3:Load(T0)(A++) -> M[59](W1)(Mode0);//load fo_init
	R0:M[4] -> BIU0.T2||R1:M[4] -> BIU1.T2||R2:M[4] -> BIU2.T2||R3:M[4] -> BIU3.T2||R5:M[15] -> BIU1.T0;
	MFetch:REPEAT @(34);
	R0:M[58] -> IMA0.T0||R1:M[19] -> IMA0.T2;
	R0:M[59] -> IMA1.T0||R1:M[19] -> IMA0.T2;
	NOP;
	NOP;
	NOP;
	//IMA0:T0 << 16(W)(T) -> IMA0.T0;   // 每 Word 低 Short → 高 16 位, 低 16 位置零
  	//IMA0:Ttmp >> 16(W) -> IMA0.T0; // 算术右移 → 符号位自动填充高 16 位
	/*
	IMA0:V(0) -> IMA0.T1||IMA1:V(0) -> IMA1.T1;
	Mfetch:Lpto %fo_est @(KI3);

	//IMA1:T0+Ttmp(W) -> IMA1.T1(Mode0);
	//IMA1:ModAdd(Ttmp,T2)(W) -> IMA1.T1;

	Mfetch:Lpto %fo_est_init @(KI4);
	IMA0:T0+Ttmp(W) -> IMA0.T1(Mode0);
	IMA0:ModAdd(Ttmp,T2)(W) -> IMA0.T1;

	fo_est_init:

	fo_est:

  	R0:M[19] -> IMA0.T2;     // T2 =  2π  (TWO_PI_Q)
  	R0:M[8] -> IMA0.T3;     // T3 = -π   (-PI_Q)
  	R0:M[7] -> IMA0.T1;     // T1 =  π   (PI_Q)
  	// 计算两支备选值
  	IMA0:T0 - T2(W) -> IMA0.T4;    // T4 = r - 2π
  	IMA0:T0 + T2(W) -> IMA0.T5;    // T5 = r + 2π
  	// step1: if (r >= π) 选 r-2π，否则选 r
  	IMA0:CompSel(T0, T1, T4, T0)(W) -> IMA0.T2;
  	//      若 T0 >= T1(π) → 取 T4(r-2π)
  	//      否则           → 取 T0(r)
 	// step2: if (-π >= r') 选 r'+2π，否则选 r'  (即 r' <= -π 时 +2π)
  	IMA0:CompSel(T3, Ttmp, T5, Ttmp)(W) -> IMA0.T0;
  	*/

	IMA0:T0 >> 7(W)->IMA0.T1||IMA1:T0 >> 7(W)->IMA1.T1||IMA2:T0 >> 7(W)->IMA2.T1||IMA3:T0 >> 7(W)->IMA3.T1;
	IMA0:Ttmp << 2(W) -> BIU0.T3||IMA1:Ttmp << 2(W) -> BIU1.T3||IMA2:Ttmp << 2(W) -> BIU2.T3||IMA3:Ttmp << 2(W) -> BIU3.T3;
	IMA0:V(0) -> SHU0.T1||IMA1:V(0) -> SHU1.T1||IMA2:V(0) -> SHU2.T1||IMA3:V(0) -> SHU3.T1;
	IMA0:V(257) -> SHU0.T2||IMA1:V(257) -> SHU1.T2||IMA2:V(257) -> SHU2.T2||IMA3:V(257) -> SHU3.T2;
	BIU0:T2[0] + T3[0] -> BIU0.T2[0]||BIU1:T2[0] + T3[0] -> BIU1.T2[0]||BIU2:T2[0] + T3[0] -> BIU2.T2[0]||BIU3:T2[0] + T3[0] -> BIU3.T2[0];
	NOP;
    BIU0:Load(T2)(A++) -> SHU0.T0(Mode0);
    BIU1:Load(T2)(A++) -> SHU1.T0(Mode0);
    BIU2:Load(T2)(A++) -> SHU2.T0(Mode0);
    BIU3:Load(T2)(A++) -> SHU3.T0(Mode0);
    IMA0:V(2)->IMA0.T2(Mode0)||IMA1:V(2)->IMA1.T2(Mode0)||IMA2:V(2)->IMA2.T2(Mode0)||IMA3:V(2)->IMA3.T2(Mode0);
	NOP;
	IMA0:VHigh(T2,0)->IMA0.T2(Mode0)||IMA1:VHigh(T2,0)->IMA1.T2(Mode0)||IMA2:VHigh(T2,0)->IMA2.T2(Mode0)||IMA3:VHigh(T2,0)->IMA3.T2(Mode0);
	NOP;
	IMA0:SetShiftMode(T2)->ShiftMode2(Mode0)||IMA1:SetShiftMode(T2)->ShiftMode2(Mode0)||IMA2:SetShiftMode(T2)->ShiftMode2(Mode0)||IMA3:SetShiftMode(T2)->ShiftMode2(Mode0);
	NOP;
	NOP;
	NOP;
	NOP;
	SHU0:Index(T0,T0,T1) ->IMA0.T0||IMA0:T1 << 7(W) -> IMA0.T4||SHU1:Index(T0,T0,T1) ->IMA1.T0||IMA1:T1 << 7(W) -> IMA1.T4||SHU2:Index(T0,T0,T1) ->IMA2.T0||IMA2:T1 << 7(W) -> IMA2.T4||SHU3:Index(T0,T0,T1) ->IMA3.T0||IMA3:T1 << 7(W) -> IMA3.T4;//COS,delta_theta
	SHU0:Index(T0,T0,T2) ->IMA0.T2||IMA0:T0 - Ttmp(S) -> IMA0.T1||SHU1:Index(T0,T0,T2) ->IMA1.T2||IMA1:T0 - Ttmp(S) -> IMA1.T1||SHU2:Index(T0,T0,T2) ->IMA2.T2||IMA2:T0 - Ttmp(S) -> IMA2.T1||SHU3:Index(T0,T0,T2) ->IMA3.T2||IMA3:T0 - Ttmp(S) -> IMA3.T1;//SIN,T1:delta_theta
	NOP;
	IMA0:0 + T2 * T1(ShiftMode2)(S)(SSS) -> IMA0.T4||IMA1:0 + T2 * T1(ShiftMode2)(S)(SSS) -> IMA1.T4||IMA2:0 + T2 * T1(ShiftMode2)(S)(SSS) -> IMA2.T4||IMA3:0 + T2 * T1(ShiftMode2)(S)(SSS) -> IMA3.T4;//cos-sin*delta_theta
	IMA0:0 + T0 * T1(ShiftMode2)(S)(SSS) -> IMA0.T5||IMA1:0 + T0 * T1(ShiftMode2)(S)(SSS) -> IMA1.T5||IMA2:0 + T0 * T1(ShiftMode2)(S)(SSS) -> IMA2.T5||IMA3:0 + T0 * T1(ShiftMode2)(S)(SSS) -> IMA3.T5;//sin+cos*delta_theta
	NOP;
	NOP;
	IMA0:T0 - T4(S) -> SHU0.T0||IMA1:T0 - T4(S) -> SHU1.T0||IMA2:T0 - T4(S) -> SHU2.T0||IMA3:T0 - T4(S) -> SHU3.T0;
	IMA0:T2 + T5(S) -> SHU0.T2||IMA1:T2 + T5(S) -> SHU1.T2||IMA2:T2 + T5(S) -> SHU2.T2||IMA3:T2 + T5(S) -> SHU3.T2;
	IMA0:V(0) -> IMA0.T1||IMA1:V(0) -> IMA1.T1||IMA2:V(0) -> IMA2.T1||IMA3:V(0) -> IMA3.T1;
	NOP;
    IMA0:VHigh(T1,8224) ->SHU0.T1||IMA1:VHigh(T1,8224) ->SHU1.T1||IMA2:VHigh(T1,8224) ->SHU2.T1||IMA3:VHigh(T1,8224) ->SHU3.T1;
	NOP;
	SHU0:Index(T2,T0,T1) -> IMA0.T2||SHU1:Index(T2,T0,T1) -> IMA0.T1||SHU2:Index(T2,T0,T1) -> IMA2.T1||SHU3:Index(T2,T0,T1) -> IMA3.T1;
	NOP;
	NOP;


	Mfetch:Lpto %StoreCyc2 @(KI3);  // 外层32组，KI3=32
	Mfetch:Lpto %StoreCyc1 @(KI1);  // 内层8次，KI1=8
	BIU1:Wait 0 || IMA0:Wait 10 || BIU2:Wait 15 ;
	BIU1:Load(T0)(A++) -> IMA0.T0(Mode0)||IMA0:0 + T1*T0(ShiftMode1)(C)(S)(SSS) -> BIU2.T3(Mode0)||BIU2:Store(T3,T0)(A++)(Mask);

	StoreCyc1:
	BIU1:Wait 0 || IMA0:Wait 0 || BIU2:Wait 0;  // 内层结束，Wait复位
	MFetch:REPEAT @(20);

    // 每组结束后更新旋转因子
	IMA0:0 + T1*T2(ShiftMode0)(C)(S)(SSS) -> IMA0.T1(Mode0);  // T1 = T1 * T2

	StoreCyc2:
	MFetch:REPEAT @(20);
	/*IMA0:T1 -> BIU3.T3(Mode0);
	NOP;
	NOP;
	BIU3:Store(T3,T0)(A++)(Mask);*/
	MFetch:REPEAT @(34);
	NOP;
    //BLOCKCyc:

	MFetch:MPU.STOP;
