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
module CC_MUX7 #(parameter MUX7_SELECTWIDTH=1,parameter MUX7_NADAWIDTH=8, parameter MUX7_RANDOMWIDTH=8)(
//////////// OUTPUTS //////////
	CC_RANDOM2_Out,
//////////// INPUTS //////////
	CC_MUX7_select_InBUS,
	CC_MUX7_NADA_InBUS,
	CC_MUX7_RANDOM_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg [MUX7_RANDOMWIDTH-1:0]CC_RANDOM2_Out;
input 	[MUX7_SELECTWIDTH-1:0] CC_MUX7_select_InBUS;
input 	[MUX7_NADAWIDTH-1:0] CC_MUX7_NADA_InBUS;
input 	[MUX7_RANDOMWIDTH-1:0] CC_MUX7_RANDOM_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
   if( CC_MUX7_select_InBUS == 0)
      CC_RANDOM2_Out = CC_MUX7_RANDOM_InBUS;
   else if( CC_MUX7_select_InBUS == 1)
      CC_RANDOM2_Out = CC_MUX7_RANDOM_InBUS;
end

endmodule