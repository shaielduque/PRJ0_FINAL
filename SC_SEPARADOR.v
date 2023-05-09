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
module SC_SEPARADOR #(parameter DATAWIDTH=8)(
//////////// OUTPUTS //////////
	SC_SEPARADOR_Out1,
	SC_SEPARADOR_Out2,
//////////// INPUTS //////////
	SC_SEPARADOR_data_InBUS_1
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	 [3:0]SC_SEPARADOR_Out1;
output	 [3:0]SC_SEPARADOR_Out2;
reg 			 [DATAWIDTH-1:0]SC_SEPARADOR_signal;
input 		 [DATAWIDTH-1:0] SC_SEPARADOR_data_InBUS_1;

//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
   SC_SEPARADOR_signal = SC_SEPARADOR_data_InBUS_1;
end

assign SC_SEPARADOR_Out1 = SC_SEPARADOR_signal[3:0];
assign SC_SEPARADOR_Out2 = SC_SEPARADOR_signal[7:4];


endmodule
