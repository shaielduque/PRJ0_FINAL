/*######################################################################
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
module SC_RANDOM #(parameter RANDOM_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_RANDOM_data_OutBUS,
	//////////// INPUTS //////////
	SC_RANDOM_CLOCK_50,
	SC_RANDOM_RESET_InHigh,
	SC_RANDOM_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	[RANDOM_DATAWIDTH-1:0]	SC_RANDOM_data_OutBUS;
input		SC_RANDOM_CLOCK_50;
input		SC_RANDOM_RESET_InHigh;
input 	[7:0]SC_RANDOM_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RANDOM_DATAWIDTH-1:0] RANDOM_Register;
reg [RANDOM_DATAWIDTH-1:0] RANDOM_Signal;
wire funcionpro;

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL

always @(*)
begin
   RANDOM_Signal = {funcionpro,RANDOM_Register[7:1]};
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RANDOM_CLOCK_50, posedge SC_RANDOM_RESET_InHigh)
begin
	if (SC_RANDOM_RESET_InHigh == 1'b1)
		RANDOM_Register <= SC_RANDOM_data_InBUS;
	else
		RANDOM_Register <= RANDOM_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign funcionpro = RANDOM_Register[7]^RANDOM_Register[4]^RANDOM_Register[1];

assign SC_RANDOM_data_OutBUS = RANDOM_Register;


endmodule
