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
module SC_SPEEDCOMPARATOR #(parameter SPEEDCOMPARATOR_DATAWIDTH=24)(
//////////// OUTPUTS //////////
	SC_SPEEDCOMPARATOR_T0_OutLow,
//////////// INPUTS //////////
	SC_SPEEDCOMPARATOR_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg SC_SPEEDCOMPARATOR_T0_OutLow;
input 	[SPEEDCOMPARATOR_DATAWIDTH-1:0] SC_SPEEDCOMPARATOR_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
														//11001011011100110101011
always @(SC_SPEEDCOMPARATOR_data_InBUS)   //1111111111111111111
begin													//0000000000000000000
	if( SC_SPEEDCOMPARATOR_data_InBUS == 23'b11001011011100110101011)
		SC_SPEEDCOMPARATOR_T0_OutLow = 1'b0;
	else 
		SC_SPEEDCOMPARATOR_T0_OutLow = 1'b1;
end

endmodule

