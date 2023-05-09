/*######################################################################
//# G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//#
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#



add wave -divider SC_STATEMACHINEFAIL_f4
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEFAIL_f4/SC_STATEMACHINEFAIL_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEFAIL_f4/SC_STATEMACHINEFAIL_Comparador_CFAIL1_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEFAIL_f4/SC_STATEMACHINEFAIL_Comparador_CFAIL2_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEFAIL_f4/SC_STATEMACHINEFAIL_TOTAL_FAIL_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEFAIL_f4/SC_STATEMACHINEFAIL_FAIL_2_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEFAIL_f4/SC_STATEMACHINEFAIL_FAIL_1_Out
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEFAIL_f4/STATE_Register


//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
BB_SYSTEM_max7219DIN_Out,
BB_SYSTEM_max7219NCS_Out,
BB_SYSTEM_max7219CLK_Out,

//////////// INPUTS //////////

BB_SYSTEM_CLOCK_50,
BB_SYSTEM_RESET_InHigh,
BB_SYSTEM_startButton_InLow,
BB_SYSTEM_leftButton1_InLow,
BB_SYSTEM_rightButton1_InLow,
BB_SYSTEM_leftButton2_InLow,
BB_SYSTEM_rightButton2_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8;
 parameter PRESCALER_DATAWIDTH = 23;
 parameter DISPLAY_DATAWIDTH = 12;
 
 //PLAYER1
 parameter DATA_FIXED_POSICION1 = 8'b01000000; //8'b01000000
 //PLayer2
 parameter DATA_FIXED_POSICION2 = 8'b00001000; //8'b00000010
  //Transiciones
 parameter DATA_FIXED_TRANSNUM1 = 8'b10000001; //b00011000
 parameter DATA_FIXED_TRANSNUM2 = 8'b01100110; //b01100110
 parameter DATA_FIXED_TRANSNUM3 = 8'b10011001; //b11011011
 //Comienzo
 parameter DATA_FIXED_Comienxo1 = 8'b01010101;
 parameter DATA_FIXED_Comienxo2 = 8'b10101010;
 //0
 parameter DATA_FIXED_0 = 8'b00000000;
 
//RANDOM
 parameter RANDOM_1 = 8'b01000000;
 parameter RANDOM_2 = 8'b00001000; //b10010101
 parameter RANDOM_3 = 8'b00100000; //b10110101
 
 //NADA
 
 parameter NADA = 8'b00000000;
 
 parameter comienzo1 = 8'b10101010;
 parameter comienzo2 = 8'b01010101;
 
 //LOST
 
 parameter pierdo = 4'b1111;

 
 
 
 
 //=======================================================
//  PORT declarations
//=======================================================
output BB_SYSTEM_max7219DIN_Out;
output BB_SYSTEM_max7219NCS_Out;
output BB_SYSTEM_max7219CLK_Out;

input BB_SYSTEM_CLOCK_50;
input BB_SYSTEM_RESET_InHigh;
input BB_SYSTEM_startButton_InLow;
input BB_SYSTEM_leftButton1_InLow;
input BB_SYSTEM_rightButton1_InLow;
input BB_SYSTEM_leftButton2_InLow;
input BB_SYSTEM_rightButton2_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs

wire BB_SYSTEM_startButton_InLow_cwire;
wire BB_SYSTEM_reset_InHigh_cwire;
wire BB_SYSTEM_leftButton1_InLow_cwire;
wire BB_SYSTEM_rightButton1_InLow_cwire;
wire BB_SYSTEM_leftButton2_InLow_cwire;
wire BB_SYSTEM_rightButton2_InLow_cwire;

//REGISTERS
wire [DATAWIDTH_BUS-1:0] Reg7__6_wire;
wire [DATAWIDTH_BUS-1:0] Reg6__5_wire;
wire [DATAWIDTH_BUS-1:0] Reg5__4_wire;
wire [DATAWIDTH_BUS-1:0] Reg4__3_wire;
wire [DATAWIDTH_BUS-1:0] Reg3__2_wire;
wire [DATAWIDTH_BUS-1:0] Reg2__1_wire;
wire [DATAWIDTH_BUS-1:0] Reg1__0_wire;

// RANDOMS
wire [DATAWIDTH_BUS-1:0] Random1__Reg_wire;
wire [DATAWIDTH_BUS-1:0] Random2__Reg_wire; // de hecho este es el cable que comunica el multiplexor con el registro (combiar nombre cuando multiplexor este hecho)
wire [DATAWIDTH_BUS-5:0] MULTIPLEXOR_C_out_wire;
// SWITCH JUGADOR 1 Y 2


wire [DATAWIDTH_BUS-1:0] Switch1__POS_wire; //posición del switch
wire [DATAWIDTH_BUS-1:0] Switch2__POS_wire;

//STATEMACHINE GAME

//···SHIFTER···

wire STATEMACHINE_MOVE_RIGHT1_cwire;
wire STATEMACHINE_MOVE_RIGHT2_cwire;
wire STATEMACHINE_MOVE_LEFT1_cwire;
wire STATEMACHINE_MOVE_LEFT2_cwire;

wire STATEMACHINE_FLAG_MOVE_RIGHT1_cwire; //bandera para mandar el bit final
wire STATEMACHINE_FLAG_MOVE_RIGHT2_cwire;
wire STATEMACHINE_FLAG_MOVE_LEFT1_cwire;
wire STATEMACHINE_FLAG_MOVE_LEFT2_cwire;

wire [1:0]STATEMACHINE_shiftselection1_cwire;
wire [1:0]STATEMACHINE_shiftselection2_cwire; // bit final para el register

wire STATEMACHINE_loadREG_cwire;
// LOST :(
wire STATEMACHINE_FLAG_LOST_1_cwire;
wire STATEMACHINE_FLAG_LOST_2_cwire;
wire STATEMACHINE_FLAG_LOST1_cwire; //Cuando pierda un jugador la maquina mandara una bandera anunciando que perdio a: multiplexor y a comparador de LOST_TWO_PLAYERS  
wire STATEMACHINE_FLAG_LOST2_cwire;

wire [7:0]Comp__reg_wire;


wire STATEMACHINE_RESET_GAME_cwire; //resetear el juego cuando pierdan los dos jugadores
wire STATEMACHINEFAIL_FAIL_1_wire;
wire STATEMACHINEFAIL_FAIL_2_wire;
//LOADS

wire STATEMACHINEPOINT_load0_cwire;
wire STATEMACHINEPOINT_load1_cwire;
wire [DATAWIDTH_BUS-1:0] SC_RegGENERAL_data_OutBUS_wire;
wire SC_RegGENERAL_data_OutBUS;

//RESET

wire STATEMACHINE_RESET_InHigh;
wire START_wire;

wire STATEMACHINE_load_cwire;
//

//···END OF STATEMACHINE GAME···

wire [1:0]Bit_seleccion_escencial1_wire;
wire [3:0]transi__escencial1_wire;
wire [3:0]comienzo__escencial1_wire;
wire [3:0]pierdo__escencial1_wire;


wire [1:0]Bit_seleccion_escencial2_wire;
wire [3:0]transi__escencial2_wire;
wire [3:0]comienzo__escencial2_wire;
wire [3:0]pierdo__escencial2_wire;

//MUX_ESCENCIAL

wire [3:0]MUX__REG1_wire;
wire [3:0]MUX__REG2_wire;

//MUX_RANDOM

wire	[7:0]RANDOM1_MULT_wire;
wire 	[7:0]MULTIPLEXOR_C1_wire;

wire	[7:0]RANDOM2_MULT_wire;
wire 	[7:0]MULTIPLEXOR_C2_wire;

wire	[7:0]RANDOM3_MULT_wire;
wire 	[7:0]MULTIPLEXOR_C3_wire;

wire  [7:0]Random_final_out_wire;
wire  [3:0]Random_final1_out_wire;
wire  [3:0]Random_final2_out_wire;

wire  [1:0]Shift_random_final_wire;

//MUX_POS

wire 	Shift_selection_pos1_wire;
wire	[7:0]posicion_final1_wire;
wire 	Shift_selection_pos2_wire;
wire	[7:0]posicion_final2_wire;

//MUX_COMIENZO

wire  [7:0]comienzo_final_wire;

//MUX_TRANSI

wire	[7:0]transi1_wire;
wire	[0:0]Shift_transi1_wire;

wire	[7:0]transi2_wire;
wire	[1:0]Shift_transi2_wire;

wire	[7:0]transi3_wire;
wire	[1:0]Shift_transi3_wire;

wire	[7:0]Transi_grande_final_wire;
wire	[1:0]Shift_transi_grande_wire;
//CLK COUNTER 

wire COUNTER__STATEMACH_FLAG_load_wire;
wire SC_STATEMACHINELOAD_upcount_out_cwire;
wire [22:0] upSPEEDCOUNTER_data_BUS_wire;

//CLEAR??
wire STATEMACHINEBACKG_clear_cwire;

// 0---1---0---1

wire Senal_cambiante_wire;

// que horas son

wire [DATAWIDTH_BUS-1:0] QUE_HORAS_SON_wire;


//tierra

wire [1:0]tierra1;
wire [1:0]tierra2;

// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire [7:0] data_max;
wire [2:0] add;

// COMPARATOR LOST 2 PLAYERS

wire COMP_LOST_PLAYERS__STATEMAC_FLAG_wire; //Cuanod pierdan los dos jugadores el comparador mandará una bandera al state machine
wire [DATAWIDTH_BUS-1:0] LOST_PLAYER_1_wire;
wire [DATAWIDTH_BUS-1:0] LOST_PLAYER_2_wire;
//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//# INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers  
.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers  
.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton1_InLow_cwire),
.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton1_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers  
.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton1_InLow_cwire),
.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton1_InLow)

);
SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers  
.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton2_InLow_cwire),
.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton2_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u4 (
// port map - connection between master ports and signals/registers  
.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton2_InLow_cwire),
.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton2_InLow)

);

//######################################################################
//# !!! ACA VAN TUS COMPONENTES
//######################################################################

//reg 1.5

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_1_5 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Comp__reg_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS(Reg1__0_wire)
);	

// reg 8-7-6-5-4-3-2-1 (orden)


SC_RegGENERAL_1_2_3 #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_1_2_3_u0 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(SC_RegGENERAL_data_OutBUS_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS1(Reg1__0_wire),
.SC_RegGENERAL_data_InBUS2(posicion_final1_wire),
.SC_RegGENERAL_data_InBUS3(posicion_final2_wire)

);	

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u1 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Reg1__0_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS(Reg2__1_wire)
);	

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u2 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Reg2__1_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS(Reg3__2_wire)
);	
SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u3 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Reg3__2_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS(Reg4__3_wire)
);	
SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u4 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Reg4__3_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS(Reg5__4_wire)
);	
SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u5 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Reg5__4_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS(Reg6__5_wire)
);	
SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u6 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Reg6__5_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS(Reg7__6_wire)
);	

SC_RegGENERAL_1_2 #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u7 (
// port map - connection between master ports and signals/registers   
.SC_RegGENERAL_data_OutBUS(Reg7__6_wire),
.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_RegGENERAL_RESET_InHigh(START_wire),
.SC_RegGENERAL_load_InLow(STATEMACHINE_load_cwire),
.SC_RegGENERAL_data_InBUS1(MUX__REG1_wire),
.SC_RegGENERAL_data_InBUS2(MUX__REG2_wire)
);
//RANDOMS
	SC_RANDOM SC_RANDOM_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RANDOM_data_OutBUS(MULTIPLEXOR_C1_wire),
	.SC_RANDOM_CLOCK_50(STATEMACHINE_load_cwire),
	.SC_RANDOM_RESET_InHigh(~STATEMACHINEPOINT_load0_cwire),
	.SC_RANDOM_data_InBUS(RANDOM_1)
);	

	SC_RANDOM SC_RANDOM_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RANDOM_data_OutBUS(MULTIPLEXOR_C2_wire),
	.SC_RANDOM_CLOCK_50(STATEMACHINE_load_cwire),
	.SC_RANDOM_RESET_InHigh(~STATEMACHINEPOINT_load0_cwire),
	.SC_RANDOM_data_InBUS(RANDOM_2)
);	
	SC_RANDOM SC_RANDOM_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RANDOM_data_OutBUS(MULTIPLEXOR_C3_wire),
	.SC_RANDOM_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RANDOM_RESET_InHigh(~STATEMACHINEPOINT_load0_cwire),
	.SC_RANDOM_data_InBUS(RANDOM_3)
);
SC_RegSHIFTER #(.RegSHIFTER_DATAWIDTH(DATAWIDTH_BUS)) SC_RegSHIFTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegSHIFTER_data_OutBUS(Switch1__POS_wire),
	.SC_RegSHIFTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegSHIFTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegSHIFTER_load_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegSHIFTER_shiftselection_In(STATEMACHINE_shiftselection1_cwire),
	.SC_RegSHIFTER_data_InBUS(DATA_FIXED_POSICION1)
);
SC_RegSHIFTER #(.RegSHIFTER_DATAWIDTH(DATAWIDTH_BUS)) SC_RegSHIFTER_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegSHIFTER_data_OutBUS(Switch2__POS_wire),
	.SC_RegSHIFTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegSHIFTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegSHIFTER_load_InLow(STATEMACHINEPOINT_load0_cwire),
	.SC_RegSHIFTER_shiftselection_In(STATEMACHINE_shiftselection2_cwire),
	.SC_RegSHIFTER_data_InBUS(DATA_FIXED_POSICION2)
	
);

// COMPARATOR SHIFTER PLAYER 1

SC_BOTTOMSIDECOMPARATORRIGHT_1 #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) SC_BOTTOMSIDECOMPARATORRIGHT_1_u0 (
	.SC_BOTTOMSIDECOMPARATORRIGHT_bottomside_OutLow(STATEMACHINE_FLAG_MOVE_RIGHT1_cwire),
	.SC_BOTTOMSIDECOMPARATORRIGHT_data_InBUS(Switch1__POS_wire)
);
SC_BOTTOMSIDECOMPARATORLEFT_1 #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) SC_BOTTOMSIDECOMPARATORLEFT_1_u0 (
	.SC_BOTTOMSIDECOMPARATORLEFT_bottomside_OutLow(STATEMACHINE_FLAG_MOVE_LEFT1_cwire),
	.SC_BOTTOMSIDECOMPARATORLEFT_data_InBUS(Switch1__POS_wire)

);

// COMPARATOR SHIFTER PLAYER 2
SC_BOTTOMSIDECOMPARATORRIGHT_2 #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) SC_BOTTOMSIDECOMPARATORRIGHT_2_u0 (
	.SC_BOTTOMSIDECOMPARATORRIGHT_bottomside_OutLow(STATEMACHINE_FLAG_MOVE_RIGHT2_cwire),
	.SC_BOTTOMSIDECOMPARATORRIGHT_data_InBUS(Switch2__POS_wire)

);
SC_BOTTOMSIDECOMPARATORLEFT_2 #(.BOTTOMSIDECOMPARATOR_DATAWIDTH(DATAWIDTH_BUS)) SC_BOTTOMSIDECOMPARATORLEFT_2_u0 (
	.SC_BOTTOMSIDECOMPARATORLEFT_bottomside_OutLow(STATEMACHINE_FLAG_MOVE_LEFT2_cwire),
	.SC_BOTTOMSIDECOMPARATORLEFT_data_InBUS(Switch2__POS_wire)

);
 
// COMPARATOR LOST

SC_COMPARATORLOST #(.DATAWIDTH(DATAWIDTH_BUS)) SC_COMPARATORLOST_u0 (
	.SC_COMPARATORLOST_OutLow(STATEMACHINE_FLAG_LOST_1_cwire),
	.SC_COMPARATORLOST_data_InBUS_1(Comp__reg_wire),
	.SC_COMPARATORLOST_data_InBUS_2(Switch1__POS_wire)
	);
SC_COMPARATORLOST #(.DATAWIDTH(DATAWIDTH_BUS)) SC_COMPARATORLOST_u1 (
	.SC_COMPARATORLOST_OutLow(STATEMACHINE_FLAG_LOST_2_cwire),
	.SC_COMPARATORLOST_data_InBUS_1(Comp__reg_wire),
	.SC_COMPARATORLOST_data_InBUS_2(Switch2__POS_wire)
	);
 //SPEEEEEEEEEEEEEEEEEED
 
SC_CONTADORCLK #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(upSPEEDCOUNTER_data_BUS_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(STATEMACHINE_RESET_InHigh),
	.SC_upSPEEDCOUNTER_upcount_InLow(SC_STATEMACHINELOAD_upcount_out_cwire)
);

SC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_SPEEDCOMPARATOR_u0 (
	.SC_SPEEDCOMPARATOR_T0_OutLow(COUNTER__STATEMACH_FLAG_load_wire),
	.SC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire)
);

//RELOJ
SC_CONTADORCLK #(.upSPEEDCOUNTER_DATAWIDTH(DATAWIDTH_BUS)) SC_RELOJ_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(QUE_HORAS_SON_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(~STATEMACHINEPOINT_load0_cwire),
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINE_load_cwire)
);

// STATEMACHINE PLAYER 1 AND 2

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEPOINT_shiftselection_1_Out(STATEMACHINE_shiftselection1_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_rightButton_1_InLow(BB_SYSTEM_rightButton1_InLow_cwire),  
	.SC_STATEMACHINEPOINT_leftButton_1_InLow(BB_SYSTEM_leftButton1_InLow_cwire), 
	.SC_STATEMACHINEPOINT_Comparador_moveRIGHT_InLow(STATEMACHINE_FLAG_MOVE_RIGHT1_cwire),
	.SC_STATEMACHINEPOINT_Comparador_moveLEFT_InLow(STATEMACHINE_FLAG_MOVE_LEFT1_cwire),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEPOINT_load1_OutLow(STATEMACHINEPOINT_load0_cwire)

	);
SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u1 (
// port map - connection between master ports and signals/registers    
	.SC_STATEMACHINEPOINT_shiftselection_1_Out(STATEMACHINE_shiftselection2_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_rightButton_1_InLow(BB_SYSTEM_rightButton2_InLow_cwire),  
	.SC_STATEMACHINEPOINT_leftButton_1_InLow(BB_SYSTEM_leftButton2_InLow_cwire), 
	.SC_STATEMACHINEPOINT_Comparador_moveRIGHT_InLow(STATEMACHINE_FLAG_MOVE_RIGHT2_cwire),
	.SC_STATEMACHINEPOINT_Comparador_moveLEFT_InLow(STATEMACHINE_FLAG_MOVE_LEFT2_cwire),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEPOINT_load1_OutLow(STATEMACHINEPOINT_load1_cwire)

	);
	
	// LOADS
	
	SC_STATEMACHINELOAD SC_STATEMACHINELOAD_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEBACKG_reset_OutHigh(STATEMACHINE_RESET_InHigh), 
	.SC_STATEMACHINEBACKG_load_OutLow(STATEMACHINE_load_cwire), 
	.SC_STATEMACHINEBACKG_upcount_out(SC_STATEMACHINELOAD_upcount_out_cwire),
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_FLAG_InLow(COUNTER__STATEMACH_FLAG_load_wire),
	.SC_STATEMACHINEBACKG_CLEAR_Outhigh(START_wire)
);
	// 0---1---0---1 

	SC_STATEMACHINE_CAMBIANTE SC_STATEMACHINE_CAMBIANTE_u0 (
//
	.SC_STATEMACHINEBACKG_SenalCambiante(Senal_cambiante_wire),
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_FLAG_InLow(STATEMACHINE_load_cwire)
);

// STATEMACHINE_MULTX

SC_STATEMACHINE_MULTX SC_STATEMACHINE_MULTX_u0 (
// port map - connection between master ports and signals/registers    

	.SC_STATEMACHINE_MULTX_shiftselection_transi_Out(Shift_transi_grande_wire),
	.SC_STATEMACHINE_MULTX_shiftselection_random_Out(Shift_random_final_wire),
	.SC_STATEMACHINE_MULTX_shiftselection_esencial_Out(Bit_seleccion_escencial1_wire),
	.SC_STATEMACHINE_MULTX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_MULTX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_MULTX_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINE_MULTX_reloj(QUE_HORAS_SON_wire),
	.SC_STATEMACHINE_MULTX_perdio1(STATEMACHINE_FLAG_LOST_1_cwire),	
	.SC_STATEMACHINE_MULTX_shiftselection_posicion_Out(Shift_selection_pos1_wire)

	);
	
	SC_STATEMACHINE_MULTX SC_STATEMACHINE_MULTX_u1 (
// port map - connection between master ports and signals/registers    

	.SC_STATEMACHINE_MULTX_shiftselection_transi_Out(tierra1),
	.SC_STATEMACHINE_MULTX_shiftselection_random_Out(tierra2),
	.SC_STATEMACHINE_MULTX_shiftselection_esencial_Out(Bit_seleccion_escencial2_wire),
	.SC_STATEMACHINE_MULTX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_MULTX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_MULTX_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINE_MULTX_reloj(QUE_HORAS_SON_wire),
	.SC_STATEMACHINE_MULTX_perdio1(STATEMACHINE_FLAG_LOST_2_cwire),
	.SC_STATEMACHINE_MULTX_shiftselection_posicion_Out(Shift_selection_pos2_wire)

	);
	
	
	SC_STATEMACHINE_REGRESIVA SC_STATEMACHINE_REGRESIVA_u0 (
	.SC_STATEMACHINEBACKG_SENALREGRESIVA(Shift_transi1_wire),
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_FLAG_InLow(QUE_HORAS_SON_wire)
	);
	
// MUX_arriba de REG

   CC_MUX4 CC_MUX_ESENCIAL1_u0 (
	.CC_REGISTRO1_Out(MUX__REG1_wire),
	.CC_MUX4_select_InBUS(Bit_seleccion_escencial1_wire),
	.CC_MUX4_RANDOM_InBUS(Random_final1_out_wire),
	.CC_MUX4_TRANSI_InBUS(transi__escencial1_wire),
	.CC_MUX4_COMIENZO_InBUS(comienzo__escencial1_wire),
	.CC_MUX4_PIERDO_InBUS(pierdo)
);	


   CC_MUX4 CC_MUX_ESENCIAL1_u1 (
	.CC_REGISTRO1_Out(MUX__REG2_wire),
	.CC_MUX4_select_InBUS(Bit_seleccion_escencial2_wire),
	.CC_MUX4_RANDOM_InBUS(Random_final2_out_wire), 
	.CC_MUX4_TRANSI_InBUS(transi__escencial2_wire),
	.CC_MUX4_COMIENZO_InBUS(comienzo__escencial2_wire),
	.CC_MUX4_PIERDO_InBUS(pierdo)
);	

//MUX_RANDOM


		
	CC_MUX12 CC_RANDOM_GRANDE_u0 (	
	.CC_SALIDARANDOMS_Out(Random_final_out_wire),
	.CC_MUX12_select_InBUS(Shift_random_final_wire),
	.CC_MUX12_NADA_InBUS(NADA),
	.CC_MUX12_RANDOM1_InBUS(RANDOM1_MULT_wire),
	.CC_MUX12_RANDOM2_InBUS(RANDOM2_MULT_wire),
	.CC_MUX12_RANDOM3_InBUS(RANDOM3_MULT_wire)
	);
	
	
	// MUX_POSICION
	
	
	
	CC_MUX2 CC_POSICION_u0 (
	.CC_POSICION_Out(posicion_final1_wire),
	.CC_MUX2_select_InBUS(Shift_selection_pos1_wire),
	.CC_MUX2_NADA_InBUS(NADA),
	.CC_MUX2_UBICACION_InBUS(Switch1__POS_wire)
	);	
	
	CC_MUX2 CC_POSICION_u1 (
	.CC_POSICION_Out(posicion_final2_wire),
	.CC_MUX2_select_InBUS(Shift_selection_pos2_wire),
	.CC_MUX2_NADA_InBUS(NADA),
	.CC_MUX2_UBICACION_InBUS(Switch2__POS_wire)
	);	
		
		
//MUX_COMIENZO

	CC_MUX1 CC_COMIENZO_u0 (
	.CC_BITCOMIENZO_Out(comienzo_final_wire),
	.CC_MUX1_select_InBUS(Senal_cambiante_wire),
	.CC_MUX1_comienzo1_InBUS(comienzo1),
	.CC_MUX1_comienzo2_InBUS(comienzo2)
	);
	
	CC_MUX1 CC_COMIENZO_u1 (
	.CC_BITCOMIENZO_Out(RANDOM1_MULT_wire),
	.CC_MUX1_select_InBUS(Senal_cambiante_wire),
	.CC_MUX1_comienzo1_InBUS(NADA),
	.CC_MUX1_comienzo2_InBUS(MULTIPLEXOR_C1_wire)
	);	

	CC_MUX1 CC_COMIENZO_u2 (
	.CC_BITCOMIENZO_Out(RANDOM2_MULT_wire),
	.CC_MUX1_select_InBUS(Senal_cambiante_wire),
	.CC_MUX1_comienzo1_InBUS(NADA),
	.CC_MUX1_comienzo2_InBUS(MULTIPLEXOR_C2_wire)
	);
		CC_MUX1 CC_COMIENZO_u3 (
	.CC_BITCOMIENZO_Out(RANDOM3_MULT_wire),
	.CC_MUX1_select_InBUS(Senal_cambiante_wire),
	.CC_MUX1_comienzo1_InBUS(NADA),
	.CC_MUX1_comienzo2_InBUS(MULTIPLEXOR_C3_wire)
	);
	
// MUX_TRANSI
	
	CC_MUX9 CC_TRANSI_u0(
	.CC_TRANSI1_Out(transi1_wire),
	.CC_MUX9_select_InBUS(Shift_transi1_wire),
	.CC_MUX9_NADA_InBUS(NADA),
	.CC_MUX9_TRANSI_InBUS(DATA_FIXED_TRANSNUM1)
	);

	CC_MUX9 CC_TRANSI_u1(
	.CC_TRANSI1_Out(transi2_wire),
	.CC_MUX9_select_InBUS(Shift_transi1_wire),
	.CC_MUX9_NADA_InBUS(NADA),
	.CC_MUX9_TRANSI_InBUS(DATA_FIXED_TRANSNUM2)
	);	
	
	CC_MUX9 CC_TRANSI_u2(
	.CC_TRANSI1_Out(transi3_wire),
	.CC_MUX9_select_InBUS(Shift_transi1_wire),
	.CC_MUX9_NADA_InBUS(NADA),
	.CC_MUX9_TRANSI_InBUS(DATA_FIXED_TRANSNUM3)
	);	
	
	CC_MUX13 CC_TRANSIGRANDE_u0(
	
	.CC_SALIDATRANSI_Out(Transi_grande_final_wire),
	.CC_MUX13_select_InBUS(Shift_transi_grande_wire),
	.CC_MUX13_NADA_InBUS(NADA),
	.CC_MUX13_TRANSI1_InBUS(transi1_wire),
	.CC_MUX13_TRANSI2_InBUS(transi2_wire),
	.CC_MUX13_TRANSI3_InBUS(transi3_wire)
	
	
	);
	
	//SEPARATORS 
	
	SC_SEPARADOR SC_SEPARADOR_transi(
	.SC_SEPARADOR_Out1(transi__escencial1_wire),
	.SC_SEPARADOR_Out2(transi__escencial2_wire),
	.SC_SEPARADOR_data_InBUS_1(Transi_grande_final_wire)
	
	);
	SC_SEPARADOR SC_SEPARADOR_random(
	.SC_SEPARADOR_Out1(Random_final1_out_wire),
	.SC_SEPARADOR_Out2(Random_final2_out_wire),
	.SC_SEPARADOR_data_InBUS_1(Random_final_out_wire)
	
	);	
	SC_SEPARADOR SC_SEPARADOR_comienzo(
	.SC_SEPARADOR_Out1(comienzo__escencial1_wire),
	.SC_SEPARADOR_Out2(comienzo__escencial2_wire),
	.SC_SEPARADOR_data_InBUS_1(comienzo_final_wire)
	
	);	
//######################################################################
//# TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = SC_RegGENERAL_data_OutBUS_wire;
assign regGAME_data1_wire = Reg1__0_wire;
assign regGAME_data2_wire = Reg2__1_wire;
assign regGAME_data3_wire = Reg3__2_wire;
assign regGAME_data4_wire = Reg4__3_wire;
assign regGAME_data5_wire = Reg5__4_wire;
assign regGAME_data6_wire = Reg6__5_wire;
assign regGAME_data7_wire = Reg7__6_wire;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
      (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
      (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
      (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
      (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
      (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
      (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};

matrix_ctrl matrix_ctrl_unit_0(
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max),
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 );
 
//######################################################################
//# TO TEST
//######################################################################





endmodule