	.section .text.m0, "ax"
	.ifdef enable_dynamic_mim
	.include "get_fo_estAsm.inc"
	.endif
	.file	"get_fo_estAsm.m0.asm"
	// DO NOT MODIFY THE CONTENT ABOVE
	.global get_fo_estAsm
get_fo_estAsm:
    R1:M[0]->BIU1.T0;
	NOP;
	NOP;
	NOP;
	BIU1:Load(T0)(A++) -> M[112](W1)(Mode0)||IMA0:V(0)->IMA0.T0(Mode0)||IMA1:V(0)->IMA1.T0(Mode0)||IMA2:V(0)->IMA2.T0(Mode0)||IMA3:V(0)->IMA3.T0(Mode0);//ki
	NOP;
	BIU1:Load(T0)(A++) -> M[2](W1)(Mode0)||IMA0:VHigh(T0,0)->IMA0.T0(Mode0)||IMA1:VHigh(T0,0)->IMA1.T0(Mode0)||IMA2:VHigh(T0,0)->IMA2.T0(Mode0)||IMA3:VHigh(T0,0)->IMA3.T0(Mode0);//Ga64
	BIU1:Load(T0)(A++) -> M[3](Mode0);//SHU T6
	IMA0:SetShiftMode(T0)->ShiftMode0(Mode0)||IMA1:SetShiftMode(T0)->ShiftMode0(Mode0)||IMA2:SetShiftMode(T0)->ShiftMode0(Mode0)||IMA3:SetShiftMode(T0)->ShiftMode0(Mode0);//theta
	IMA1:V(1)->IMA1.T0(Mode0);
	NOP;
	IMA1:VHigh(T0,0)->M[13](Mode0);
	IMA0:V(512)->IMA0.T1(Mode0)||IMA1:V(512)->IMA1.T1(Mode0)||IMA2:V(512)->IMA2.T1(Mode0)||IMA3:V(512)->IMA3.T1(Mode0);//input——load
	BIU1:Load(T0)(A++) -> M[7](W1)(Mode0)||IMA0:VHigh(Ttmp,0)->IMA0.T1(Mode0)||IMA1:VHigh(Ttmp,0)->IMA1.T1(Mode0)||IMA2:VHigh(Ttmp,0)->IMA2.T1(Mode0)||IMA3:VHigh(Ttmp,0)->IMA3.T1(Mode0);//32767
	BIU1:Load(T0)(A++) -> M[8](W1)(Mode0);//-32768
	BIU1:Load(T0)(A++) -> M[9](W1)(Mode0)||R1:M[2]->BIU1.T1(Mode0)||IMA0:SetShiftMode(T1)->ShiftMode1(Mode0)||IMA1:SetShiftMode(T1)->ShiftMode1(Mode0)||IMA2:SetShiftMode(T1)->ShiftMode1(Mode0)||IMA3:SetShiftMode(T1)->ShiftMode1(Mode0);//LUTAddr
	BIU1:Load(T0)(A++) -> M[10](W1)(Mode0)||R0:M[3]->SHU0.T6(Mode0)||R1:M[3]->SHU1.T6(Mode0)||R5:PreConfig(M[112]);//12868
	BIU1:Load(T0)(A++) -> M[11](W1)(Mode0)||R2:M[3]->SHU2.T6(Mode0)||R3:M[3]->SHU3.T6(Mode0)||R5:WriteConf(Mfetch)->KI[0-3](Mode0);//-12868
	BIU1:Load(T0)(A++) -> M[12](W1)(Mode0);//25736
	BIU1:Load(T0)(A++) -> M[16](W1)(Mode0);//output0
	NOP;
	BIU1:Load(T0)(A++) -> M[18](W1)(Mode0);//Ga_Load
	MFetch:REPEAT @(10);
	R0:M[18]->BIU0.T0(Mode0);
	R2:M[16] -> BIU2.T0;
	NOP;
	NOP;
	//Mfetch:Lpto %BLOCKCyc @(KI0);//总循环
	IMA0:0+0*0(ShiftMode0)(C)(S)(SSS)->IMA0.MR||IMA1:0+0*0(ShiftMode0)(C)(S)(SSS)->IMA1.MR||IMA2:0+0*0(ShiftMode0)(C)(S)(SSS)->IMA2.MR||IMA3:0+0*0(ShiftMode0)(C)(S)(SSS)->IMA3.MR;

	Mfetch:Lpto %RECyc @(KI2);//循环16次
	BIU0:Wait 5 || BIU1:Wait 0 || IMA0:Wait 10 || IMA1:Wait 11 ||  IMA2:Wait 12 ||  IMA3:Wait 13;
	BIU0:Load(T0)(A++) -> IMA0.T0(Mode0)||BIU1:Load(T1)(A++)->IMA0.T1(Mode0)||IMA0:Conj(T1)(S)->IMA0.T2(Mode0)||IMA1:Conj(T1)(S)->IMA1.T2(Mode0)||IMA2:Conj(T1)(S)->IMA2.T2(Mode0)||IMA3:Conj(T1)(S)->IMA3.T2(Mode0);
    BIU0:Load(T0)(A++) -> IMA1.T0(Mode0)||BIU1:Load(T1)(A++)->IMA1.T1(Mode0);
	BIU0:Load(T0)(A++) -> IMA2.T0(Mode0)||BIU1:Load(T1)(A++)->IMA2.T1(Mode0);
	BIU0:Load(T0)(A++) -> IMA3.T0(Mode0)||BIU1:Load(T1)(A++)->IMA3.T1(Mode0);
	NOP;
	NOP;
	NOP;
	NOP;
	NOP;
	IMA0:MR + T0*T2(ShiftMode0)(C)(S)(SSS) -> IMA0.MR(Mode0)||IMA1:MR + T0*T2(ShiftMode0)(C)(S)(SSS) -> IMA1.MR(Mode0)||IMA2:MR + T0*T2(ShiftMode0)(C)(S)(SSS) -> IMA2.MR(Mode0)||IMA3:MR + T0*T2(ShiftMode0)(C)(S)(SSS) -> IMA3.MR(Mode0);

	RECyc:
	//BIU3:Load(T0)(A++) -> M[59](W1)(Mode0);//load fo_init
	BIU0:Wait 0 || R0:Wait 0 || IMA0:Wait 0 || R1:Wait 0 || IMA1:Wait 0|| R2:Wait 0 || IMA2:Wait 0 || R3:Wait 0 || IMA3:Wait 0;
	MFetch:REPEAT @(15);
	IMA0:ReadMR(L) -> IMA0.T0||IMA1:ReadMR(L) -> IMA1.T0||IMA2:ReadMR(L) -> IMA2.T0||IMA3:ReadMR(L) -> IMA3.T0;//R
	IMA0:ReadMR(H) -> IMA0.T1||IMA1:ReadMR(H) -> IMA1.T1||IMA2:ReadMR(H) -> IMA2.T1||IMA3:ReadMR(H) -> IMA3.T1;//I
	NOP;
	NOP;
	//IMA0:ReadMR(O1) -> IMA0.T2;
	//IMA0:ReadMR(O2) -> IMA1.T2;
	IMA0:RAdd(T0)(W)(SlipMode1) -> SHU0.T0||IMA1:RAdd(T0)(W)(SlipMode1) -> SHU1.T0||IMA2:RAdd(T0)(W)(SlipMode1) -> SHU2.T0||IMA3:RAdd(T0)(W)(SlipMode1) -> SHU3.T0;//real>>8 62bit
	IMA0:RAdd(T1)(W)(SlipMode1) -> SHU0.T1||IMA1:RAdd(T1)(W)(SlipMode1) -> SHU1.T1||IMA2:RAdd(T1)(W)(SlipMode1) -> SHU2.T1||IMA3:RAdd(T1)(W)(SlipMode1) -> SHU3.T1;//imag>>8 62bit
	NOP;
	NOP;
	SHU0:Index(T0,T6) -> IMA0.T0||R0:M[7] -> IMA0.T4||SHU1:Index(T0,T6) -> IMA1.T0||R1:M[7] -> IMA1.T4||SHU2:Index(T0,T6) -> IMA2.T0||R2:M[7] -> IMA2.T4||SHU3:Index(T0,T6) -> IMA3.T0||R3:M[7] -> IMA3.T4;//||IMA2:VHigh(T3,0) -> IMA2.T3;//取出结果的第1,5,9,13行，将它放在IMA3.T0的前4行
	SHU0:Index(T1,T6) -> IMA0.T1||R0:M[8] -> IMA0.T5||SHU1:Index(T1,T6) -> IMA1.T1||R1:M[8] -> IMA1.T5||SHU2:Index(T1,T6) -> IMA2.T1||R2:M[8] -> IMA2.T5||SHU3:Index(T1,T6) -> IMA3.T1||R3:M[8] -> IMA3.T5;
	IMA0:RAdd(T0)(W)(SlipMode1) -> IMA0.T0||IMA1:RAdd(T0)(W)(SlipMode1) -> IMA1.T0||IMA2:RAdd(T0)(W)(SlipMode1) -> IMA2.T0||IMA3:RAdd(T0)(W)(SlipMode1) -> IMA3.T0 ;
	IMA0:RAdd(T1)(W)(SlipMode1) -> IMA0.T1||IMA1:RAdd(T1)(W)(SlipMode1) -> IMA1.T1||IMA2:RAdd(T1)(W)(SlipMode1) -> IMA2.T1||IMA3:RAdd(T1)(W)(SlipMode1) -> IMA3.T1 ;
	IMA0:V(0) -> IMA0.T2||IMA1:V(0) -> IMA1.T2||IMA2:V(0) -> IMA2.T2||IMA3:V(0) -> IMA3.T2;
	IMA0:VHigh(Ttmp,257) -> SHU0.T3||IMA1:VHigh(Ttmp,257) -> SHU1.T3||IMA2:VHigh(Ttmp,257) -> SHU2.T3||IMA3:VHigh(Ttmp,257) -> SHU3.T3;//第一行复制16次索引
	IMA0:First(T0) (w) -> IMA0.T3||IMA1:First(T0) (w) -> IMA1.T3||IMA2:First(T0) (w) -> IMA2.T3||IMA3:First(T0) (w) -> IMA3.T3;
	IMA0:First(T1) (w) -> IMA0.T3||IMA1:First(T1) (w) -> IMA1.T3||IMA2:First(T1) (w) -> IMA2.T3||IMA3:First(T1) (w) -> IMA3.T3;
	IMA0:CompSel(Ttmp,T3,T3,Ttmp) (W)(U) -> IMA0.T3||IMA1:CompSel(Ttmp,T3,T3,Ttmp) (W)(U) -> IMA1.T3||IMA2:CompSel(Ttmp,T3,T3,Ttmp) (W)(U) -> IMA2.T3||IMA3:CompSel(Ttmp,T3,T3,Ttmp) (W)(U) -> IMA3.T3;
	IMA0:T0 << Ttmp(W)->IMA0.T0||IMA1:T0 << Ttmp(W)->IMA1.T0||IMA2:T0 << Ttmp(W)->IMA2.T0||IMA3:T0 << Ttmp(W)->IMA3.T0;
	IMA0:Ttmp >> 16(W)->IMA0.T0||IMA1:Ttmp >> 16(W)->IMA1.T0||IMA2:Ttmp >> 16(W)->IMA2.T0||IMA3:Ttmp >> 16(W)->IMA3.T0;
	IMA0:T1 << T3(W)->IMA0.T1||IMA1:T1 << T3(W)->IMA1.T1||IMA2:T1 << T3(W)->IMA2.T1||IMA3:T1 << T3(W)->IMA3.T1;
	IMA0:Ttmp >> 16(W)->IMA0.T1||IMA1:Ttmp >> 16(W)->IMA1.T1||IMA2:Ttmp >> 16(W)->IMA2.T1||IMA3:Ttmp >> 16(W)->IMA3.T1;
	IMA0:CompSel(T0,T4,T4,T0)(W)->IMA0.T0||IMA1:CompSel(T0,T4,T4,T0)(W)->IMA1.T0||IMA2:CompSel(T0,T4,T4,T0)(W)->IMA2.T0||IMA3:CompSel(T0,T4,T4,T0)(W)->IMA3.T0;//限定范围小于32767，7fff
	IMA0:CompSel(T1,T4,T4,T1)(W)->IMA0.T1||IMA1:CompSel(T1,T4,T4,T1)(W)->IMA1.T1||IMA2:CompSel(T1,T4,T4,T1)(W)->IMA2.T1||IMA3:CompSel(T1,T4,T4,T1)(W)->IMA3.T1;
	IMA0:CompSel(T0,T5,T0,T5)(W)->M[21] & IMA0.T0||IMA1:CompSel(T0,T5,T0,T5)(W)->M[27] & IMA1.T0||IMA2:CompSel(T0,T5,T0,T5)(W)->M[33] & IMA2.T0||IMA3:CompSel(T0,T5,T0,T5)(W)->M[39] & IMA3.T0;//Real 大于-32768 ffff8000，IMA2.T4为后面第一行复制作准备
	IMA0:CompSel(T1,T5,T1,T5)(W)->M[22] & IMA0.T1||IMA1:CompSel(T1,T5,T1,T5)(W)->M[28] & IMA1.T1||IMA2:CompSel(T1,T5,T1,T5)(W)->M[34] & IMA2.T1||IMA3:CompSel(T1,T5,T1,T5)(W)->M[40] & IMA3.T1;//Imag
	NOP;
	IMA0:T1 << 14(W) -> IMA0.T1||IMA1:T1 << 14(W) -> IMA1.T1||IMA2:T1 << 14(W) -> IMA2.T1||IMA3:T1 << 14(W) -> IMA3.T1;//虚部左移14位,实部左移14位
 	IMA0:T0 -> SHU0.T0||IMA1:T0 -> SHU1.T0||IMA2:T0 -> SHU2.T0||IMA3:T0 -> SHU3.T0;//将实部送到SHU2.T0
 	NOP;
    SHU0:Index(T0,T0,T3)->IMA0.T0||SHU1:Index(T0,T0,T3)->IMA1.T0||SHU2:Index(T0,T0,T3)->IMA2.T0||SHU3:Index(T0,T0,T3)->IMA3.T0;//T3：
    NOP;
	IMA0:DivStart(T1,T0)(W)(Mode0)||IMA1:DivStart(T1,T0)(W)(Mode0)||IMA2:DivStart(T1,T0)(W)(Mode0)||IMA3:DivStart(T1,T0)(W)(Mode0);//虚部除实部的结果
	MFetch:REPEAT @(17);
	IMA0:ReadQ(W)->IMA0.T4||IMA1:ReadQ(W)->IMA1.T4||IMA2:ReadQ(W)->IMA2.T4||IMA3:ReadQ(W)->IMA3.T4;//除法，商存到IMA0.T4
	IMA0:ABS(Ttmp)(W)-> M[25] & IMA0.T3 || R0:M[9] -> BIU0.T2||IMA1:ABS(Ttmp)(W)-> M[31] & IMA1.T3 || R1:M[9] -> BIU1.T2||IMA2:ABS(Ttmp)(W)-> M[37] & IMA2.T3||R2:M[9]-> BIU2.T2||IMA3:ABS(Ttmp)(W)-> M[43] & IMA3.T3 || R3:M[9] -> BIU3.T2;//商取绝对值保存到IMA0.T3 ；BIU2.T1：LUTAddr K参数
	IMA0:Ttmp >> 7(W)-> M[26] & IMA0.T0 ||IMA1:Ttmp >> 7(W)-> M[32] & IMA1.T0||IMA2:Ttmp >> 7(W)-> M[38] & IMA2.T0||IMA3:Ttmp >> 7(W)-> M[44] & IMA3.T0;//绝对值右移7位,M[30],M[31]是判断是否要取补角
	NOP;
	R0:M[21] -> IMA0.T0||R1:M[27] -> IMA1.T0||R2:M[33] -> IMA2.T0||R3:M[39] -> IMA3.T0;//Real
	R0:M[22] -> IMA0.T1||R1:M[28] -> IMA1.T1||R2:M[34] -> IMA2.T1||R3:M[40] -> IMA3.T1;//imag
	NOP;
	IMA0:T0 << 14(W) -> IMA0.T0||IMA1:T0 << 14(W) -> IMA1.T0||IMA2:T0 << 14(W) -> IMA2.T0||IMA3:T0 << 14(W) -> IMA3.T0;//Real左移14位
	IMA0:T1 -> SHU0.T1||IMA1:T1 -> SHU1.T1||IMA2:T1 -> SHU2.T1||IMA3:T1 -> SHU3.T1;
	NOP;
	SHU0:Index(T1,T1,T3)->IMA0.T1||SHU1:Index(T1,T1,T3)->IMA1.T1||SHU2:Index(T1,T1,T3)->IMA2.T1||SHU3:Index(T1,T1,T3)->IMA3.T1;//将第一行复制16次（虚部）
	NOP;
	IMA0:DivStart(T0,T1)(W)(Mode0)||IMA1:DivStart(T0,T1)(W)(Mode0)||IMA2:DivStart(T0,T1)(W)(Mode0)||IMA3:DivStart(T0,T1)(W)(Mode0);//实部除虚部的结果
	MFetch:REPEAT @(17);
	IMA0:ReadQ(W)->IMA0.T4||IMA1:ReadQ(W)->IMA1.T4||IMA2:ReadQ(W)->IMA2.T4||IMA3:ReadQ(W)->IMA3.T4;
	IMA0:ABS(Ttmp)(W)-> IMA0.T2||IMA1:ABS(Ttmp)(W)-> IMA1.T2||IMA2:ABS(Ttmp)(W)-> IMA2.T2||IMA3:ABS(Ttmp)(W)-> IMA3.T2;//T2：补角的abs商
	IMA0:Ttmp >> 7(W)-> IMA0.T1||IMA1:Ttmp >> 7(W)-> IMA1.T1||IMA2:Ttmp >> 7(W)-> IMA2.T1||IMA3:Ttmp >> 7(W)-> IMA3.T1;//T1:补角的索引
	IMA0:V(255) -> IMA0.T5||R0:M[26] -> IMA0.T0||IMA1:V(255) -> IMA1.T5||R1:M[32] -> IMA1.T0||IMA2:V(255) -> IMA2.T5||R2:M[38] -> IMA2.T0||IMA3:V(255) -> IMA3.T5||R3:M[44] -> IMA3.T0;
	R0:M[25] -> IMA0.T3||R1:M[31] -> IMA1.T3||R2:M[37] -> IMA2.T3||R3:M[43] -> IMA3.T3; //T3：abs商
	IMA0:VHigh(T5,0) -> IMA0.T5||IMA1:VHigh(T5,0) -> IMA1.T5||IMA2:VHigh(T5,0) -> IMA2.T5||IMA3:VHigh(T5,0) -> IMA3.T5;
	NOP;
	IMA0:CompSel(T5,T0,T0,T1)(W) -> IMA0.T0||IMA1:CompSel(T5,T0,T0,T1)(W) -> IMA1.T0||IMA2:CompSel(T5,T0,T0,T1)(W) -> IMA2.T0||IMA3:CompSel(T5,T0,T0,T1)(W) -> IMA3.T0;//比较选择哪个索引
	IMA0:CompSel(T5,T0,T3,T2)(W) -> IMA0.T3||IMA1:CompSel(T5,T0,T3,T2)(W) -> IMA1.T3||IMA2:CompSel(T5,T0,T3,T2)(W) -> IMA2.T3||IMA3:CompSel(T5,T0,T3,T2)(W) -> IMA3.T3;//比较选择哪个ABS商

	IMA0:T0 << 1(S)-> BIU0.T3||IMA1:T0 << 1(S)-> BIU1.T3||IMA2:T0 << 1(S)-> BIU2.T3||IMA3:T0 << 1(S)-> BIU3.T3;//每short左移1位
	NOP;
	NOP;

	BIU0:T2[0] + T3[0] -> BIU0.T2[0]||BIU1:T2[0] + T3[0] -> BIU1.T2[0]||BIU2:T2[0] + T3[0] -> BIU2.T2[0]||BIU3:T2[0] + T3[0] -> BIU3.T2[0];//BaseAddr + index(byte)
	NOP;

	BIU0:Load(T2)(A++)->IMA0.T0(Mode0);//y0         根据地址每次128行，只读2byte
	BIU0:Load(T2)(A++)->IMA0.T1(Mode0);//delta
	BIU0:Load(T2)(A++)->IMA0.T2(Mode0);//x0

	BIU1:Load(T2)(A++)->IMA1.T0(Mode0);
	BIU1:Load(T2)(A++)->IMA1.T1(Mode0);
	BIU1:Load(T2)(A++)->IMA1.T2(Mode0);

	BIU2:Load(T2)(A++)->IMA2.T0(Mode0);
	BIU2:Load(T2)(A++)->IMA2.T1(Mode0);
	BIU2:Load(T2)(A++)->IMA2.T2(Mode0);

	BIU3:Load(T2)(A++)->IMA3.T0(Mode0);
	BIU3:Load(T2)(A++)->IMA3.T1(Mode0);
	BIU3:Load(T2)(A++)->IMA3.T2(Mode0);
	NOP;
	IMA0:V(0)->IMA0.T5||IMA1:V(0)->IMA1.T5||IMA2:V(0)->IMA2.T5||IMA3:V(0)->IMA3.T5;
	NOP;
	IMA0:VHigh(T5,0)->IMA0.T5||IMA1:VHigh(T5,0)->IMA1.T5||IMA2:VHigh(T5,0)->IMA2.T5||IMA3:VHigh(T5,0)->IMA3.T5;
	NOP;
	IMA0:SetShiftMode(T5)->ShiftMode2||IMA1:SetShiftMode(T5)->ShiftMode2||IMA2:SetShiftMode(T5)->ShiftMode2||IMA3:SetShiftMode(T5)->ShiftMode2;//IMA0:shiftmode2=0
	NOP;
	NOP;
	NOP;
	IMA0:T3-T2(S)->IMA0.T2||IMA1:T3-T2(S)->IMA1.T2||IMA2:T3-T2(S)->IMA2.T2||IMA3:T3-T2(S)->IMA3.T2;//ABS(商）-x0
	IMA0:0+Ttmp*T1(ShiftMode2)(S)(SSS)->IMA0.T1||IMA1:0+Ttmp*T1(ShiftMode2)(S)(SSS)->IMA1.T1||IMA2:0+Ttmp*T1(ShiftMode2)(S)(SSS)->IMA2.T1||IMA3:0+Ttmp*T1(ShiftMode2)(S)(SSS)->IMA3.T1;//(ABS(商）-x0)*delta shiftmode2=0
	//IMA0:V(0)->IMA0.T2||IMA2:V(0)->IMA2.T2;
	NOP;
	NOP;
	NOP;
	IMA0:T0+T1(S)->IMA0.T0||IMA1:T0+T1(S)->IMA1.T0||IMA2:T0+T1(S)->IMA2.T0||IMA3:T0+T1(S)->IMA3.T0 ;//y0+(ABS(商）-x0)*delta
	IMA0:V(255) -> IMA0.T5||IMA1:V(255) -> IMA1.T5||IMA2:V(255) -> IMA2.T5||IMA3:V(255) -> IMA3.T5;//判断阈
	IMA0:T0 >> 1(S)-> IMA0.T0(Mode0)||IMA1:T0 >> 1(S)-> IMA1.T0(Mode0)||IMA2:T0 >> 1(S)-> IMA2.T0(Mode0)||IMA3:T0 >> 1(S)-> IMA3.T0(Mode0)||R0:M[10] -> IMA0.T3(Mode0)||R1:M[10] -> IMA1.T3(Mode0)||R2:M[10] -> IMA2.T3(Mode0)||R3:M[10] -> IMA3.T3(Mode0);//T0是第一向县中的角度，T2为派/2,12868
	R0:M[26] -> IMA0.T2||IMA0:VHigh(T5,0) -> IMA0.T5||R1:M[32] -> IMA1.T2||IMA1:VHigh(T5,0) -> IMA1.T5||R2:M[38] -> IMA2.T2||IMA2:VHigh(T5,0) -> IMA2.T5||R3:M[44] -> IMA3.T2||IMA3:VHigh(T5,0) -> IMA3.T5;
	NOP;
	IMA0:T3 - T0(S) -> IMA0.T1||IMA1:T3 - T0(S) -> IMA1.T1||IMA2:T3 - T0(S) -> IMA2.T1||IMA3:T3 - T0(S) -> IMA3.T1;//补角
	NOP;
	IMA0:CompSel(T5,T2,T0,T1)(W) ->  IMA0.T0||IMA1:CompSel(T5,T2,T0,T1)(W) ->  IMA1.T0||IMA2:CompSel(T5,T2,T0,T1)(W) ->  IMA2.T0||IMA3:CompSel(T5,T2,T0,T1)(W) ->  IMA3.T0;//判断是否需要取补角
	IMA0:V(0)->IMA0.T2||IMA1:V(0)->IMA1.T2||IMA2:V(0)->IMA2.T2||IMA3:V(0)->IMA3.T2;
	NOP;
	IMA0:T2-T0(S)->IMA0.T2||IMA1:T2-T0(S)->IMA1.T2||IMA2:T2-T0(S)->IMA2.T2||IMA3:T2-T0(S)->IMA3.T2;//0-(y0+(ABS(商）-x0)*delta)
	NOP;
	IMA0:CompSel(T4,0,T0,T2)(W)->M[24] & IMA0.T0||IMA1:CompSel(T4,0,T0,T2)(W)->M[30] & IMA1.T0||IMA2:CompSel(T4,0,T0,T2)(W)-> M[36] & IMA2.T0||IMA3:CompSel(T4,0,T0,T2)(W)->M[42] & IMA3.T0;//dfAng_fixed   商跟0比大小，如果商大于0,则为y0+(ABS(商）-x0)*delta，若商小于0,则-(y0+(ABS(商）-x0)*delta)
//if I,R
	//R=0
	R0:M[10] -> IMA0.T2(Mode0)||R1:M[10] -> IMA1.T2(Mode0)||R2:M[10] -> IMA2.T2(Mode0)||R3:M[10] -> IMA3.T2(Mode0);//12868
	R0:M[11] -> IMA0.T3(Mode0)||R1:M[11] -> IMA1.T3(Mode0)||R2:M[11] -> IMA2.T3(Mode0)||R3:M[11] -> IMA3.T3(Mode0);//-12868
	R0:M[22] -> IMA0.T1(Mode0)||R1:M[28] -> IMA1.T1(Mode0)||R2:M[34] -> IMA2.T1(Mode0)||R3:M[40] -> IMA3.T1(Mode0);//虚部
	NOP;
	NOP;
	IMA0: CompSel(T1,0,T2,T3) (S) -> M[23] (Mode0) || R0:M[12] -> IMA0.T2(Mode0)||IMA1: CompSel(T1,0,T2,T3) (S) -> M[29] (Mode0) || R1:M[12] -> IMA1.T2(Mode0)||IMA2: CompSel(T1,0,T2,T3) (S) -> M[35] (Mode0)||R2:M[12] -> IMA2.T2(Mode0)||IMA3: CompSel(T1,0,T2,T3) (S) -> M[41] (Mode0) || R3:M[12] -> IMA3.T2(Mode0);//如果虚部大于等于0,则选12868,如果虚部小于0.则选-12868；M【12】：25736
	//R<0
	NOP;
	//IMA0:T0 >> 1(S)-> M[24] & IMA0.T1(Mode0)||IMA2:T0 >> 1(S)-> M[28] & IMA2.T1(Mode0);//dfAng_fixed右移1位
	IMA0:T0 -> IMA0.T1(Mode0)||IMA1:T0 -> IMA1.T1(Mode0)||IMA2:T0 -> IMA2.T1(Mode0)||IMA3:T0 -> IMA3.T1(Mode0);
	NOP;
	IMA0:T1 + T2(S) -> IMA0.T2 (Mode0)||IMA1:T1 + T2(S) -> IMA1.T2 (Mode0)||IMA2:T1 + T2(S) -> IMA2.T2 (Mode0)||IMA3:T1 + T2(S) -> IMA3.T2 (Mode0);
	IMA0:T1 - T2(S) -> IMA0.T3 (Mode0)||IMA1:T1 - T2(S) -> IMA1.T3 (Mode0)||IMA2:T1 - T2(S) -> IMA2.T3 (Mode0)||IMA3:T1 - T2(S) -> IMA3.T3 (Mode0);
	R0:M[22] -> IMA0.T1(Mode0)||R1:M[28] -> IMA1.T1(Mode0)||R2:M[34] -> IMA2.T1(Mode0)||R3:M[40] -> IMA3.T1(Mode0);
	NOP;
	NOP;
	IMA0: CompSel(T1,0,T2,T3) (S) -> IMA0.T3 (Mode0)|| R0:M[23] -> IMA0.T2(Mode0)||IMA1: CompSel(T1,0,T2,T3) (S) -> IMA1.T3 (Mode0)|| R1:M[29] -> IMA1.T2(Mode0)||IMA2: CompSel(T1,0,T2,T3) (S) -> IMA2.T3 (Mode0)||R2:M[35] -> IMA2.T2(Mode0)||IMA3: CompSel(T1,0,T2,T3) (S) -> IMA3.T3 (Mode0)|| R3:M[41] -> IMA3.T2(Mode0);//如果虚部大于等于0,则dfAng_fixed>>1+25736,若小于0,则选dfAng_fixed>>1-25736
	R0:M[21] -> IMA0.T1(Mode0)||R1:M[27] -> IMA1.T1(Mode0)||R2:M[33] -> IMA2.T1(Mode0)||R3:M[39] -> IMA3.T1(Mode0);//R
	NOP;
	NOP;
	IMA0: CompSel(T1,0,T2,T3) (S) -> IMA0.T0 (Mode0)||IMA1: CompSel(T1,0,T2,T3) (S) -> IMA1.T0 (Mode0)||IMA2: CompSel(T1,0,T2,T3) (S) -> IMA2.T0 (Mode0)||IMA3: CompSel(T1,0,T2,T3) (S) -> IMA3.T0 (Mode0);//如果实部大于等于0,则选第150行的输出结果，若小于0,则选第159行的输出结果
	//R>0
	R0:M[24] -> IMA0.T2(Mode0)||R1:M[30] -> IMA1.T2(Mode0)||R2:M[36] -> IMA2.T2(Mode0)||R3:M[42] -> IMA3.T2(Mode0);//>>1
	R0:M[13] -> IMA0.T4(Mode0)||R1:M[13] -> IMA1.T4(Mode0)||R2:M[13] -> IMA2.T4(Mode0)||R3:M[13] -> IMA3.T4(Mode0);//1
	NOP;
	NOP;
	IMA0: CompSel(T1,T4,T2,T0) (S) -> IMA0.T0 (Mode0)||IMA1: CompSel(T1,T4,T2,T0) (S) -> IMA1.T0 (Mode0)||IMA2: CompSel(T1,T4,T2,T0) (S) -> IMA2.T0 (Mode0)||IMA3: CompSel(T1,T4,T2,T0) (S) -> IMA3.T0 (Mode0);//如果实部大于等于1,则选dfAng_fixed>>1，若小于1，则选第163行结果
	//I=0
	R0:M[22] -> IMA0.T2(Mode0)||R1:M[28] -> IMA1.T2(Mode0)||R2:M[34] -> IMA2.T2(Mode0)||R3:M[40] -> IMA3.T2(Mode0);//虚部
	IMA0:V(0) -> IMA0.T1(Mode0)||IMA1:V(0) -> IMA1.T1(Mode0)||IMA2:V(0) -> IMA2.T1(Mode0)||IMA3:V(0) -> IMA3.T1(Mode0);
	NOP;
	IMA0:T2==T1(S)->IMA0.T0 (Mode0) ||R0:M[4] -> BIU0.T2||IMA1:T2==T1(S)->IMA1.T0 (Mode0) ||R1:M[4] -> BIU1.T2||IMA2:T2==T1(S)->IMA2.T0 (Mode0)||R2:M[4] -> BIU2.T2||IMA3:T2==T1(S)->IMA3.T0 (Mode0) ||R3:M[4] -> BIU3.T2;//  如果虚部等于0,则IMA0.T0=1
	IMA0:CompSel(Ttmp,T4,T1,T0) (S) -> IMA0.T0 (Mode0)||IMA1:CompSel(Ttmp,T4,T1,T0) (S) -> IMA1.T0 (Mode0)||IMA2:CompSel(Ttmp,T4,T1,T0) (S) -> IMA2.T0 (Mode0)||IMA3:CompSel(Ttmp,T4,T1,T0) (S) -> IMA3.T0 (Mode0) ;//如果虚部等于0,则选0,若不等于0,则选第169行结果
	NOP;
	IMA0:T0 >> 2(S)->IMA0.T1||IMA1:T0 >> 2(S)->IMA0.T2||IMA2:T0 >> 2(S)->IMA0.T3||IMA3:T0 >>2(S)-> IMA0.T4;
	NOP;
	//R0:M[59] -> IMA1.T0;
	IMA0:T1 + T2(S) -> IMA0.T0;
	IMA0:Ttmp + T3(S) -> IMA0.T0;
	IMA0:Ttmp + T4(S) -> IMA0.T0;
	IMA0:Ttmp >> 1(S) -> BIU2.T3;
	//IMA0:Ttmp >> 1(S) -> IMA0.T0;
	NOP;
	NOP;
	NOP;
	BIU2:Store(T3,T0)(A++)(Mask);
	MFetch:REPEAT @(20);
	MFetch:MPU.STOP;
