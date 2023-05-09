///*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
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
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINE_CAMBIANTE (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEBACKG_SenalCambiante,
	
	//////////// INPUTS //////////
	SC_STATEMACHINEBACKG_CLOCK_50,
	SC_STATEMACHINEBACKG_RESET_InHigh,
	SC_STATEMACHINEBACKG_startButton_InLow,
	SC_STATEMACHINEBACKG_FLAG_InLow
	
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_INIT_0										= 3;
localparam STATE_senal1_0									= 4;
localparam STATE_senal0_0									= 5;
localparam STATE_CHECK_1									= 6;
localparam STATE_CHECK_2									= 7;
//=======================================================
//  PORT declarations
//=======================================================
output reg 		SC_STATEMACHINEBACKG_SenalCambiante;
input				SC_STATEMACHINEBACKG_CLOCK_50;
input 			SC_STATEMACHINEBACKG_RESET_InHigh;
input				SC_STATEMACHINEBACKG_startButton_InLow;
input				SC_STATEMACHINEBACKG_FLAG_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_START_0;
		STATE_START_0: STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_INIT_0;
						else if (SC_STATEMACHINEBACKG_FLAG_InLow == 1'b0) STATE_Signal = STATE_senal1_0;
						else STATE_Signal = STATE_CHECK_0;
		STATE_INIT_0:	STATE_Signal = STATE_CHECK_1;
		STATE_senal1_0: 	STATE_Signal = STATE_CHECK_2;
		STATE_CHECK_2: if (SC_STATEMACHINEBACKG_FLAG_InLow == 1'b0) STATE_Signal = STATE_senal0_0;
						else STATE_Signal = STATE_CHECK_2;	
		STATE_senal0_0: 	STATE_Signal = STATE_CHECK_0;
		
		STATE_CHECK_1: if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_CHECK_1;
						else STATE_Signal = STATE_CHECK_0;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEBACKG_CLOCK_50 , posedge SC_STATEMACHINEBACKG_RESET_InHigh)
begin
	if (SC_STATEMACHINEBACKG_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b0;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b0;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b0; //como esta esperando a mandar el 1, debe estar en 0
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_1 :
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b0; //como esta esperando a mandar el 1, debe estar en 0
		end
//=========================================================
// STATE_CHECK_2
//=========================================================
	STATE_CHECK_2 :	
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b1;  //como esta esperando a mandar el 0, debe estar en 1
		end
//=========================================================
// STATE_senal1_0
//=========================================================
	STATE_senal1_0 :
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b1;
		end
//=========================================================
// STATE_senal0_0
//=========================================================
	STATE_senal0_0 :	
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b0;
		end
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEBACKG_SenalCambiante = 1'b0;
		end
	endcase
end
endmodule
