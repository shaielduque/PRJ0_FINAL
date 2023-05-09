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
module SC_STATEMACHINEFAIL (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEFAIL_FAIL_1_Out,
	SC_STATEMACHINEFAIL_FAIL_2_Out,
	SC_STATEMACHINEFAIL_TOTAL_FAIL_Out,

	//////////// INPUTS //////////
	SC_STATEMACHINEFAIL_CLOCK_50,
	SC_STATEMACHINEFAIL_RESET_InHigh,
	SC_STATEMACHINEFAIL_Comparador_CFAIL1_InLow,
	SC_STATEMACHINEFAIL_Comparador_CFAIL2_InLow,
	SC_STATEMACHINEFAIL_startButton_InLow
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_CHECK_1									= 6;
localparam STATE_CFAIL_1 									= 7;
localparam STATE_CFAIL_2 									= 8;
localparam STATE_FAILBOTH                          = 9;
localparam STATE_INIT_0										=10;

//=======================================================
//  PORT declarations
//=======================================================
output reg	SC_STATEMACHINEFAIL_FAIL_1_Out;
output reg	SC_STATEMACHINEFAIL_FAIL_2_Out;
output reg 	SC_STATEMACHINEFAIL_TOTAL_FAIL_Out;
input			SC_STATEMACHINEFAIL_CLOCK_50;
input 		SC_STATEMACHINEFAIL_RESET_InHigh;
input 		SC_STATEMACHINEFAIL_Comparador_CFAIL1_InLow;
input			SC_STATEMACHINEFAIL_Comparador_CFAIL2_InLow;
input 		SC_STATEMACHINEFAIL_startButton_InLow;
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
		STATE_CHECK_0: if (SC_STATEMACHINEFAIL_startButton_InLow == 1'b0) STATE_Signal = STATE_INIT_0;// 
						else if ((SC_STATEMACHINEFAIL_Comparador_CFAIL1_InLow == 1'b0)) STATE_Signal = STATE_CFAIL_1;
						else if (SC_STATEMACHINEFAIL_Comparador_CFAIL2_InLow == 1'b0) STATE_Signal = STATE_CFAIL_2;
						else if ((SC_STATEMACHINEFAIL_Comparador_CFAIL1_InLow == 1'b0) & (SC_STATEMACHINEFAIL_Comparador_CFAIL2_InLow == 1'b0)) STATE_Signal = STATE_FAILBOTH;
						else STATE_Signal = STATE_CHECK_0;//
		STATE_INIT_0: 	STATE_Signal = STATE_CHECK_1;
			
		STATE_CFAIL_1:  if (SC_STATEMACHINEFAIL_Comparador_CFAIL2_InLow == 1'b0) STATE_Signal = STATE_FAILBOTH;
						else STATE_Signal = STATE_CFAIL_1;
						
						
		STATE_CFAIL_2:  if (SC_STATEMACHINEFAIL_Comparador_CFAIL1_InLow == 1'b0) STATE_Signal = STATE_FAILBOTH; 
						else STATE_Signal = STATE_CFAIL_2;
			
		STATE_FAILBOTH: STATE_Signal = STATE_FAILBOTH;

		STATE_CHECK_1: if (SC_STATEMACHINEFAIL_startButton_InLow == 1'b0) STATE_Signal = STATE_CHECK_1;
						else STATE_Signal = STATE_CHECK_0;

		default : 		STATE_Signal = STATE_CHECK_0;//
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEFAIL_CLOCK_50 , posedge SC_STATEMACHINEFAIL_RESET_InHigh)
begin
	if (SC_STATEMACHINEFAIL_RESET_InHigh == 1'b1)
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
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b0;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b0;
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b0;
		end
		
//=========================================================
// STATE_INIT_0
//=========================================================
	STATE_INIT_0 :	
		begin
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b0;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b0;
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b0;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b0;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b0;
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b0;
		end
//=========================================================
// STATE_CHECK 
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b0;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b0;
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b0;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_1 :
		begin
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b0;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b0;
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b0;
		end
//=========================================================
// STATE_CFAIL1
//=========================================================
	STATE_CFAIL_1 :	
		begin
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b1;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b0;
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b0;
		end
//=========================================================
// STATE_CFAIL2
//=========================================================
	STATE_CFAIL_2 :	
		begin
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b0;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b1;
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b0;
		end
//=========================================================
// STATE_FAILBOTH
//=========================================================
	STATE_FAILBOTH :
		begin
			SC_STATEMACHINEFAIL_FAIL_1_Out = 1'b1;
			SC_STATEMACHINEFAIL_FAIL_2_Out = 1'b1; 
			SC_STATEMACHINEFAIL_TOTAL_FAIL_Out = 1'b1;

		end
	endcase
end
endmodule