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
module SC_COMPARATORLOST #(parameter DATAWIDTH=8)(
//////////// OUTPUTS //////////
	SC_COMPARATORLOST_OutLow,
//////////// INPUTS //////////
	SC_COMPARATORLOST_data_InBUS_1,
	SC_COMPARATORLOST_data_InBUS_2
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg SC_COMPARATORLOST_OutLow;
input 	[DATAWIDTH-1:0] SC_COMPARATORLOST_data_InBUS_1;
input 	[DATAWIDTH-1:0] SC_COMPARATORLOST_data_InBUS_2;

//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(SC_COMPARATORLOST_data_InBUS_1, SC_COMPARATORLOST_data_InBUS_2)
begin
	if(SC_COMPARATORLOST_data_InBUS_1 & SC_COMPARATORLOST_data_InBUS_2)
		SC_COMPARATORLOST_OutLow = 1'b1; //PIERDE SE MANDA UN UNO 
	else 
		SC_COMPARATORLOST_OutLow = 1'b0;
end


endmodule

