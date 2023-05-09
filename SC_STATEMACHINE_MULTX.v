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
module SC_STATEMACHINE_MULTX (
	//////////// OUTPUTS //////////
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out,
	SC_STATEMACHINE_MULTX_shiftselection_random_Out,
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out,
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out,
	
	
	//////////// INPUTS //////////
	SC_STATEMACHINE_MULTX_CLOCK_50,
	SC_STATEMACHINE_MULTX_RESET_InHigh,
	SC_STATEMACHINE_MULTX_startButton_InLow,
	SC_STATEMACHINE_MULTX_reloj,
	SC_STATEMACHINE_MULTX_perdio1	

	);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_CHECK_1									= 3;
localparam STATE_INIT_0										= 4;


localparam STATE_COMIENZO									= 5; 
localparam STATE_TRANSI1									= 6;
localparam STATE_RANDOM1									= 7;
localparam STATE_TRANSI2 									= 8;
localparam STATE_PUFF1										= 9;
localparam STATE_RANDOM2									= 10;
localparam STATE_TRANSI3 									= 11;
localparam STATE_PUFF2										= 12;
localparam STATE_RANDOM3									= 13;
localparam STATE_LOST										= 14;
localparam STATE_PUFF3 										= 15;


//=======================================================
//  PORT declarations
//=======================================================
output reg		[1:0]SC_STATEMACHINE_MULTX_shiftselection_esencial_Out;
output reg		[1:0]SC_STATEMACHINE_MULTX_shiftselection_transi_Out;
output reg		[1:0]SC_STATEMACHINE_MULTX_shiftselection_random_Out;
output reg		[0:0]SC_STATEMACHINE_MULTX_shiftselection_posicion_Out;
input 			SC_STATEMACHINE_MULTX_perdio1;
input				SC_STATEMACHINE_MULTX_CLOCK_50;
input	 			SC_STATEMACHINE_MULTX_RESET_InHigh;
input				SC_STATEMACHINE_MULTX_startButton_InLow;
input				[7:0]SC_STATEMACHINE_MULTX_reloj;


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
		STATE_CHECK_0: if (SC_STATEMACHINE_MULTX_startButton_InLow == 1'b0) STATE_Signal = STATE_INIT_0;// 
						else STATE_Signal = STATE_CHECK_0;//
		STATE_INIT_0: 	STATE_Signal = STATE_CHECK_1;
///////////////////////////////////////////////////////////////////////////////////////////////////


		STATE_COMIENZO: if (SC_STATEMACHINE_MULTX_reloj == 8) STATE_Signal = STATE_TRANSI1;
						else STATE_Signal = STATE_COMIENZO;


		STATE_TRANSI1: if (SC_STATEMACHINE_MULTX_reloj == 24) STATE_Signal = STATE_RANDOM1;
						else STATE_Signal = STATE_TRANSI1;
		
		STATE_RANDOM1:	if (SC_STATEMACHINE_MULTX_reloj == 44) STATE_Signal = STATE_PUFF1;
						else if (SC_STATEMACHINE_MULTX_perdio1 == 1) STATE_Signal = STATE_LOST;
						else STATE_Signal = STATE_RANDOM1;
						
		STATE_PUFF1: if (SC_STATEMACHINE_MULTX_reloj == 52) STATE_Signal = STATE_TRANSI2;
						else if (SC_STATEMACHINE_MULTX_perdio1 == 1) STATE_Signal = STATE_LOST;
						else STATE_Signal = STATE_PUFF1;
		
		
		STATE_TRANSI2: if (SC_STATEMACHINE_MULTX_reloj == 60) STATE_Signal = STATE_RANDOM2;
						else STATE_Signal = STATE_TRANSI2;
		
		STATE_RANDOM2:	if (SC_STATEMACHINE_MULTX_reloj == 90) STATE_Signal = STATE_PUFF2;
						else if (SC_STATEMACHINE_MULTX_perdio1 == 1) STATE_Signal = STATE_LOST;
						else STATE_Signal = STATE_RANDOM2;
						
		STATE_PUFF2: if (SC_STATEMACHINE_MULTX_reloj == 98) STATE_Signal = STATE_TRANSI3;
						else if (SC_STATEMACHINE_MULTX_perdio1 == 1) STATE_Signal = STATE_LOST;
						else STATE_Signal = STATE_PUFF2;

		
		STATE_TRANSI3: if (SC_STATEMACHINE_MULTX_reloj == 106) STATE_Signal = STATE_RANDOM3;
						else STATE_Signal = STATE_TRANSI3;
						
		STATE_RANDOM3:	if (SC_STATEMACHINE_MULTX_reloj == 146) STATE_Signal = STATE_COMIENZO;
						else if (SC_STATEMACHINE_MULTX_perdio1 == 1) STATE_Signal = STATE_LOST;
						else STATE_Signal = STATE_RANDOM3;
						
		STATE_PUFF3: if (SC_STATEMACHINE_MULTX_reloj == 154) STATE_Signal = STATE_PUFF3;
						else if (SC_STATEMACHINE_MULTX_perdio1 == 1) STATE_Signal = STATE_LOST;
						else STATE_Signal = STATE_PUFF3;
		
		STATE_LOST: STATE_Signal = STATE_LOST;

		STATE_CHECK_1: if (SC_STATEMACHINE_MULTX_startButton_InLow == 1'b0) STATE_Signal = STATE_CHECK_1;
						else STATE_Signal = STATE_COMIENZO;

		default : 		STATE_Signal = STATE_CHECK_0;//
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINE_MULTX_CLOCK_50 , posedge SC_STATEMACHINE_MULTX_RESET_InHigh)
begin
	if (SC_STATEMACHINE_MULTX_RESET_InHigh == 1'b1)
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
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

	end 
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
 begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

 end 
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
 begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

 end 
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_1 :
 begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

 end 
//=========================================================
// STATE_INIT_0
//=========================================================
	STATE_INIT_0 :	
 begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

 end 
//=========================================================
// STATE_LEFT_0
//=========================================================

STATE_COMIENZO :

	begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

end
							
 STATE_TRANSI1	:
	begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b01;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b01;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

end

 
 STATE_RANDOM1	:
 begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b01;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b01;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b0;

 end
 
  STATE_PUFF1 :

	begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b0;

end
 
 
 
 
 
 
 STATE_TRANSI2 :

	begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

end
 
 STATE_RANDOM2	:	
 begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b01;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b0;

 end 
 
   STATE_PUFF2 :

	begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b0;

end
 
 
 
 STATE_TRANSI3 :	
begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

end 
 STATE_RANDOM3	:		
 begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b01;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b0;

 end  
 
   STATE_PUFF3 :

	begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b01;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b0;

end
 
 
 STATE_LOST	:
 
  begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b11;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b0;

 end 
 
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
	SC_STATEMACHINE_MULTX_shiftselection_transi_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_random_Out = 2'b00;
	SC_STATEMACHINE_MULTX_shiftselection_esencial_Out = 2'b10;
	SC_STATEMACHINE_MULTX_shiftselection_posicion_Out = 1'b1;

		end
	endcase
end
endmodule