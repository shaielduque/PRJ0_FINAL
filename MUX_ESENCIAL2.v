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
module CC_MUX5 #(parameter MUX5_SELECTWIDTH=4,parameter MUX5_RANDOMWIDTH=8, parameter MUX5_TRANSIWIDTH=8, parameter MUX5_PIERDOWIDTH=8, parameter MUX5_COMIENZOWIDTH=8)(
//////////// OUTPUTS //////////
	CC_REGISTRO2_Out,
//////////// INPUTS //////////
	CC_MUX5_select_InBUS,
	CC_MUX5_RANDOM_InBUS,
	CC_MUX5_TRANSI_InBUS,
	CC_MUX5_COMIENZO_InBUS,
	CC_MUX5_PIERDO_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_REGISTRO2_Out;
input 	[MUX5_SELECTWIDTH-1:0] CC_MUX5_select_InBUS;
input 	[MUX5_RANDOMWIDTH-1:0] CC_MUX5_RANDOM_InBUS;
input 	[MUX5_TRANSIWIDTH-1:0] CC_MUX5_TRANSI_InBUS;
input 	[MUX5_COMIENZOWIDTH-1:0] CC_MUX5_COMIENZO_InBUS;
input 	[MUX5_PIERDOWIDTH-1:0] CC_MUX5_PIERDO_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX5_COMIENZO_InBUS or CC_MUX5_RANDOM_InBUS or CC_MUX5_select_InBUS or CC_MUX5_TRANSI_InBUS or CC_MUX5_PIERDO_InBUS)
begin
   if( CC_MUX5_select_InBUS == 0)
      CC_REGISTRO2_Out = CC_MUX5_COMIENZO_InBUS;
   else if( CC_MUX5_select_InBUS == 1)
      CC_REGISTRO2_Out = CC_MUX5_RANDOM_InBUS;
	else if( CC_MUX5_select_InBUS == 2)
      CC_REGISTRO2_Out = CC_MUX5_TRANSI_InBUS;
	else if( CC_MUX5_select_InBUS == 3)
      CC_REGISTRO2_Out = CC_MUX5_PIERDO_InBUS;
	
end

endmodule