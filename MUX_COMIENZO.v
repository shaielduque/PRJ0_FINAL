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
module CC_MUX1 #(parameter MUX1_SELECTWIDTH=1,parameter MUX1_comienzo1WIDTH=8, parameter MUX1_comienzo2WIDTH=8)(
//////////// OUTPUTS //////////
	CC_BITCOMIENZO_Out,
//////////// INPUTS //////////
	CC_MUX1_select_InBUS,
	CC_MUX1_comienzo1_InBUS,
	CC_MUX1_comienzo2_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg [MUX1_comienzo1WIDTH-1:0]CC_BITCOMIENZO_Out;
input 	[MUX1_SELECTWIDTH-1:0] CC_MUX1_select_InBUS;
input 	[MUX1_comienzo1WIDTH-1:0] CC_MUX1_comienzo1_InBUS;
input 	[MUX1_comienzo2WIDTH-1:0] CC_MUX1_comienzo2_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
   if( CC_MUX1_select_InBUS == 0)
      CC_BITCOMIENZO_Out = CC_MUX1_comienzo1_InBUS;
   else //if( CC_MUX1_select_InBUS == 1)
      CC_BITCOMIENZO_Out = CC_MUX1_comienzo2_InBUS;
end

endmodule