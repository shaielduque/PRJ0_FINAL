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
///Q=======================================================
//  MODULE Definition
//=======================================================
module CC_MUX4 #(parameter MUX4_SELECTWIDTH=2,parameter MUX4_RANDOMWIDTH=4, parameter MUX4_TRANSIWIDTH=4, parameter MUX4_PIERDOWIDTH=4, parameter MUX4_COMIENZOWIDTH=4)(
//////////// OUTPUTS //////////
	CC_REGISTRO1_Out,
//////////// INPUTS //////////
	CC_MUX4_select_InBUS,
	CC_MUX4_RANDOM_InBUS,
	CC_MUX4_TRANSI_InBUS,
	CC_MUX4_COMIENZO_InBUS,
	CC_MUX4_PIERDO_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg [MUX4_RANDOMWIDTH-1:0]CC_REGISTRO1_Out;
input 	[MUX4_SELECTWIDTH-1:0] CC_MUX4_select_InBUS;
input 	[MUX4_RANDOMWIDTH-1:0] CC_MUX4_RANDOM_InBUS;
input 	[MUX4_TRANSIWIDTH-1:0] CC_MUX4_TRANSI_InBUS;
input 	[MUX4_COMIENZOWIDTH-1:0] CC_MUX4_COMIENZO_InBUS;
input 	[MUX4_PIERDOWIDTH-1:0] CC_MUX4_PIERDO_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX4_COMIENZO_InBUS or CC_MUX4_RANDOM_InBUS or CC_MUX4_select_InBUS or CC_MUX4_TRANSI_InBUS or CC_MUX4_PIERDO_InBUS)
begin
   if( CC_MUX4_select_InBUS == 0)
      CC_REGISTRO1_Out = CC_MUX4_COMIENZO_InBUS;
   else if( CC_MUX4_select_InBUS == 1)
      CC_REGISTRO1_Out = CC_MUX4_RANDOM_InBUS;
	else if( CC_MUX4_select_InBUS == 2)
      CC_REGISTRO1_Out = CC_MUX4_TRANSI_InBUS;
	else //cambie algo xdxdxd (CC_MUX4_select_InBUS == 3) espero queno afecte
      CC_REGISTRO1_Out = CC_MUX4_PIERDO_InBUS;
end

endmodule