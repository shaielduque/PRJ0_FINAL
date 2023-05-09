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
module CC_MUX2 #(parameter MUX2_SELECTWIDTH=1,parameter MUX2_NADAWIDTH=8, parameter MUX2_UBICACIONWIDTH=8)(
//////////// OUTPUTS //////////
	CC_POSICION_Out,
//////////// INPUTS //////////
	CC_MUX2_select_InBUS,
	CC_MUX2_NADA_InBUS,
	CC_MUX2_UBICACION_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg [MUX2_NADAWIDTH-1:0]CC_POSICION_Out;
input 	[MUX2_SELECTWIDTH-1:0] CC_MUX2_select_InBUS;
input 	[MUX2_NADAWIDTH-1:0] CC_MUX2_NADA_InBUS;
input 	[MUX2_UBICACIONWIDTH-1:0] CC_MUX2_UBICACION_InBUS;
//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
   if( CC_MUX2_select_InBUS == 0)
      CC_POSICION_Out = CC_MUX2_UBICACION_InBUS;
   else //if( CC_MUX2_select_InBUS == 1)
      CC_POSICION_Out = CC_MUX2_NADA_InBUS;
end

endmodule