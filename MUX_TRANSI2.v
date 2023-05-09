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
module CC_MUX10 #(parameter MUX10_SELECTWIDTH=2,parameter MUX10_NADAWIDTH=8, parameter MUX10_TRANSIWIDTH=8)(
//////////// OUTPUTS //////////
	CC_TRANSI2_Out,
//////////// INPUTS //////////
	CC_MUX10_select_InBUS,
	CC_MUX10_NADA_InBUS,
	CC_MUX10_TRANSI_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_TRANSI2_Out;
input 	[MUX10_SELECTWIDTH-1:0] CC_MUX10_select_InBUS;
input 	[MUX10_NADAWIDTH-1:0] CC_MUX10_NADA_InBUS;
input 	[MUX10_TRANSIWIDTH-1:0] CC_MUX10_TRANSI_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(CC_MUX10_NADA_InBUS or CC_MUX10_TRANSI_InBUS or CC_MUX10_select_InBUS)
begin
   if( CC_MUX10_select_InBUS == 0)
      CC_TRANSI2_Out = CC_MUX10_TRANSI_InBUS;
   else if( CC_MUX10_select_InBUS == 1)
      CC_TRANSI2_Out = CC_MUX10_TRANSI_InBUS;
end

endmodule