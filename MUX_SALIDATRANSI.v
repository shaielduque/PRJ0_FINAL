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
module CC_MUX13 #(parameter MUX13_SELECTWIDTH=2,parameter MUX13_NADAWIDTH=8, parameter MUX13_TRANSI1WIDTH=8, parameter MUX13_TRANSI2WIDTH=8, parameter MUX13_TRANSI3WIDTH=8 )(
//////////// OUTPUTS //////////
	CC_SALIDATRANSI_Out,
//////////// INPUTS //////////
	CC_MUX13_select_InBUS,
	CC_MUX13_NADA_InBUS,
	CC_MUX13_TRANSI1_InBUS,
	CC_MUX13_TRANSI2_InBUS,
	CC_MUX13_TRANSI3_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg [MUX13_NADAWIDTH-1:0]CC_SALIDATRANSI_Out;
input 	[MUX13_SELECTWIDTH-1:0] CC_MUX13_select_InBUS;
input 	[MUX13_NADAWIDTH-1:0] CC_MUX13_NADA_InBUS;
input 	[MUX13_TRANSI1WIDTH-1:0] CC_MUX13_TRANSI1_InBUS;
input 	[MUX13_TRANSI2WIDTH-1:0] CC_MUX13_TRANSI2_InBUS;
input 	[MUX13_TRANSI3WIDTH-1:0] CC_MUX13_TRANSI3_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
   if( CC_MUX13_select_InBUS == 0)
      CC_SALIDATRANSI_Out = CC_MUX13_NADA_InBUS;
   else if( CC_MUX13_select_InBUS == 1)
      CC_SALIDATRANSI_Out = CC_MUX13_TRANSI1_InBUS;
   else if( CC_MUX13_select_InBUS == 2)
      CC_SALIDATRANSI_Out = CC_MUX13_TRANSI2_InBUS;
   else //if( CC_MUX13_select_InBUS == 3)
      CC_SALIDATRANSI_Out = CC_MUX13_TRANSI3_InBUS;
end

endmodule