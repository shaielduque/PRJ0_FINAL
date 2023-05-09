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
module CC_MUX8 #(parameter MUX8_SELECTWIDTH=2,parameter MUX8_NADAWIDTH=8, parameter MUX8_RANDOMWIDTH=8)(
//////////// OUTPUTS //////////
	CC_RANDOM3_Out,
//////////// INPUTS //////////
	CC_MUX8_select_InBUS,
	CC_MUX8_NADA_InBUS,
	CC_MUX8_RANDOM_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_RANDOM3_Out;
input 	[MUX8_SELECTWIDTH-1:0] CC_MUX8_select_InBUS;
input 	[MUX8_NADAWIDTH-1:0] CC_MUX8_NADA_InBUS;
input 	[MUX8_RANDOMWIDTH-1:0] CC_MUX8_RANDOM_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX8_NADA_InBUS or CC_MUX8_RANDOM_InBUS or CC_MUX8_select_InBUS)
begin
   if( CC_MUX8_select_InBUS == 0)
      CC_RANDOM3_Out = CC_MUX8_RANDOM_InBUS;
   else if( CC_MUX8_select_InBUS == 1)
      CC_RANDOM3_Out = CC_MUX8_RANDOM_InBUS;
end

endmodule