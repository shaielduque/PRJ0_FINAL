do BB_SYSTEM_run_msim_rtl_verilog.do
onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /TB_SYSTEM/eachvec

add wave  -divider LedMATRIX
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_CLOCK_50
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_RESET_InHigh
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_startButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_leftButton1_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_rightButton1_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_leftButton2_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_rightButton2_InLow


add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219DIN_Out
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219NCS_Out
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219CLK_Out

add wave  -divider SC_DEBOUNCE1_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_Out

add wave  -divider SC_DEBOUNCE1_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_Out

add wave  -divider SC_DEBOUNCE1_u2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_Out
add wave  -divider SC_DEBOUNCE1_u3
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_Out
add wave  -divider SC_DEBOUNCE1_u4
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_Out

add wave  -divider SC_upSPEEDCOUNTER_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upSPEEDCOUNTER_u0/SC_upSPEEDCOUNTER_upcount_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_upSPEEDCOUNTER_u0/SC_upSPEEDCOUNTER_data_OutBUS
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_upSPEEDCOUNTER_u0/SC_upSPEEDCOUNTER_RESET_InHigh



add wave  -divider SC_SPEEDCOMPARATOR_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SPEEDCOMPARATOR_u0/SC_SPEEDCOMPARATOR_data_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SPEEDCOMPARATOR_u0/SC_SPEEDCOMPARATOR_T0_OutLow


add wave  -divider STATEMACHINEPOINT_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_Comparador_moveRIGHT_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_Comparador_moveLEFT_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_leftButton_1_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_rightButton_1_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_load1_OutLow
add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_shiftselection_1_Out
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/STATE_Register

add wave  -divider STATEMACHINEPOINT_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/SC_STATEMACHINEPOINT_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/SC_STATEMACHINEPOINT_Comparador_moveRIGHT_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/SC_STATEMACHINEPOINT_Comparador_moveLEFT_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/SC_STATEMACHINEPOINT_leftButton_1_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/SC_STATEMACHINEPOINT_rightButton_1_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/SC_STATEMACHINEPOINT_load1_OutLow
add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/SC_STATEMACHINEPOINT_shiftselection_1_Out
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u1/STATE_Register

add wave  -divider SC_STATEMACHINELOAD_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINELOAD_u0/SC_STATEMACHINEBACKG_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINELOAD_u0/SC_STATEMACHINEBACKG_FLAG_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINELOAD_u0/SC_STATEMACHINEBACKG_load_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINELOAD_u0/SC_STATEMACHINEBACKG_reset_OutHigh
add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINELOAD_u0/SC_STATEMACHINEBACKG_upcount_out
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINELOAD_u0/STATE_Register
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINELOAD_u0/SC_STATEMACHINEBACKG_CLEAR_Outhigh

add wave  -divider SC_RegGENERAL_1_2_3_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_2_3_u0/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_2_3_u0/SC_RegGENERAL_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_2_3_u0/SC_RegGENERAL_data_InBUS1
add wave -nounpdate Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_2_3_u0/SC_RegGENERAL_data_OutBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_2_3_u0/SC_RegGENERAL_data_InBUS2
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_2_3_u0/SC_RegGENERAL_data_InBUS3

add wave  -divider SC_RegGENERAL_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u1/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u1/SC_RegGENERAL_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u1/SC_RegGENERAL_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u1/SC_RegGENERAL_data_OutBUS

add wave  -divider SC_RegGENERAL_u2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u2/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u2/SC_RegGENERAL_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u2/SC_RegGENERAL_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u2/SC_RegGENERAL_data_OutBUS

add wave  -divider SC_RegGENERAL_u3
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u3/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u3/SC_RegGENERAL_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u3/SC_RegGENERAL_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u3/SC_RegGENERAL_data_OutBUS

add wave  -divider SC_RegGENERAL_u4
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u4/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u4/SC_RegGENERAL_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u4/SC_RegGENERAL_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u4/SC_RegGENERAL_data_OutBUS

add wave  -divider SC_RegGENERAL_u5
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u5/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u5/SC_RegGENERAL_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u5/SC_RegGENERAL_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u5/SC_RegGENERAL_data_OutBUS

add wave  -divider SC_RegGENERAL_u6
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u6/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u6/SC_RegGENERAL_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u6/SC_RegGENERAL_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u6/SC_RegGENERAL_data_OutBUS

add wave  -divider SC_RegGENERAL_u7
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u7/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u7/SC_RegGENERAL_load_InLow
add wave -nounpdate Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u7/SC_RegGENERAL_data_InBUS1
add wave -nounpdate Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u7/SC_RegGENERAL_data_OutBUS
add wave -nounpdate Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_u7/SC_RegGENERAL_data_InBUS2


add wave  -divider SC_RegGENERAL_1_5
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_5/SC_RegGENERAL_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_5/SC_RegGENERAL_load_InLow
add wave  -nounpdate Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_5/SC_RegGENERAL_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegGENERAL_1_5/SC_RegGENERAL_data_OutBUS

add wave -divider SC_COMPARATORLOST_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u0/SC_COMPARATORLOST_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u0/SC_COMPARATORLOST_data_InBUS_1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u0/SC_COMPARATORLOST_data_InBUS_2

add wave -divider SC_COMPARATORLOST_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u1/SC_COMPARATORLOST_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u1/SC_COMPARATORLOST_data_InBUS_1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u1/SC_COMPARATORLOST_data_InBUS_2



add wave -divider SC_RANDOM_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RANDOM_u0/SC_RANDOM_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RANDOM_u0/SC_RANDOM_data_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RANDOM_u0/SC_RANDOM_RESET_InHigh


add wave -divider SC_RegSHIFTER_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/SC_RegSHIFTER_shiftselection_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/SC_RegSHIFTER_data_OutBUS
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/RegSHIFTER_Signal

add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/RegSHIFTER_Register


add wave -divider SC_RegSHIFTER_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u1/SC_RegSHIFTER_shiftselection_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u1/SC_RegSHIFTER_data_OutBUS


add wave -divider SC_BOTTOMSIDECOMPARATORRIGHT_1_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORRIGHT_1_u0/SC_BOTTOMSIDECOMPARATORRIGHT_data_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORRIGHT_1_u0/SC_BOTTOMSIDECOMPARATORRIGHT_bottomside_OutLow



add wave -divider SC_BOTTOMSIDECOMPARATORRIGHT_2_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORRIGHT_2_u0/SC_BOTTOMSIDECOMPARATORRIGHT_data_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORRIGHT_2_u0/SC_BOTTOMSIDECOMPARATORRIGHT_bottomside_OutLow

add wave -divider SC_BOTTOMSIDECOMPARATORLEFT_1_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORLEFT_1_u0/SC_BOTTOMSIDECOMPARATORLEFT_data_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORLEFT_1_u0/SC_BOTTOMSIDECOMPARATORLEFT_bottomside_OutLow
 
add wave -divider SC_BOTTOMSIDECOMPARATORLEFT_2_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORLEFT_2_u0/SC_BOTTOMSIDECOMPARATORLEFT_data_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_BOTTOMSIDECOMPARATORLEFT_2_u0/SC_BOTTOMSIDECOMPARATORLEFT_bottomside_OutLow

add wave -divider SC_STATEMACHINE_CAMBIANTE_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_CAMBIANTE_u0/SC_STATEMACHINEBACKG_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_CAMBIANTE_u0/SC_STATEMACHINEBACKG_SenalCambiante


add wave -divider SC_STATEMACHINE_MULTX_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MULTX_u0/SC_STATEMACHINE_MULTX_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MULTX_u0/SC_STATEMACHINE_MULTX_shiftselection_transi_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MULTX_u0/SC_STATEMACHINE_MULTX_shiftselection_random_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MULTX_u0/SC_STATEMACHINE_MULTX_shiftselection_esencial_Out
add wave -noupdate -radix/TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MULTX_u0/SC_STATEMACHINE_MULTX_reloj
add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MULTX_u0/SC_STATEMACHINE_MULTX_perdio1
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_MULTX_u0/STATE_Register

add wave -divider SC_COMPARATORLOST_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u0/SC_COMPARATORLOST_data_InBUS_1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u0/SC_COMPARATORLOST_data_InBUS_2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u0/SC_COMPARATORLOST_OutLow

add wave -divider SC_COMPARATORLOST_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u1/SC_COMPARATORLOST_data_InBUS_1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u1/SC_COMPARATORLOST_data_InBUS_2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_COMPARATORLOST_u1/SC_COMPARATORLOST_OutLow


add wave  -divider SC_RELOJ_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RELOJ_u0/SC_upSPEEDCOUNTER_upcount_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RELOJ_u0/SC_upSPEEDCOUNTER_data_OutBUS
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RELOJ_u0/SC_upSPEEDCOUNTER_RESET_InHigh


add wave  -divider CC_MUX_ESENCIAL1_0u

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_REGISTRO1_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_RANDOM_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_TRANSI_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_COMIENZO_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_PIERDO_InBUS

add wave  -divider CC_MUX_ESENCIAL1_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u1/CC_REGISTRO1_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_RANDOM_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_TRANSI_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_COMIENZO_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX_ESENCIAL1_u0/CC_MUX4_PIERDO_InBUS

add wave  -divider CC_RANDOM_GRANDE_u0

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_RANDOM_GRANDE_u0/CC_SALIDARANDOMS_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_RANDOM_GRANDE_u0/CC_MUX12_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_RANDOM_GRANDE_u0/CC_MUX12_NADA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_RANDOM_GRANDE_u0/CC_MUX12_RANDOM1_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_RANDOM_GRANDE_u0/CC_MUX12_RANDOM2_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_RANDOM_GRANDE_u0/CC_MUX12_RANDOM3_InBUS

add wave  -divider CC_POSICION_u0

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u0/CC_POSICION_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u0/CC_MUX2_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u0/CC_MUX2_NADA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u0/CC_MUX2_UBICACION_InBUS


add wave  -divider CC_POSICION_u1

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u1/CC_POSICION_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u1/CC_MUX2_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u1/CC_MUX2_NADA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_POSICION_u1/CC_MUX2_UBICACION_InBUS

add wave  -divider CC_COMIENZO_u0

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u0/CC_BITCOMIENZO_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u0/CC_MUX1_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u0/CC_MUX1_comienzo1_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u0/CC_MUX1_comienzo2_InBUS

add wave  -divider CC_COMIENZO_u1

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u1/CC_BITCOMIENZO_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u1/CC_MUX1_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u1/CC_MUX1_comienzo1_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u1/CC_MUX1_comienzo2_InBUS

add wave  -divider CC_COMIENZO_u2

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u2/CC_BITCOMIENZO_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u2/CC_MUX1_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u2/CC_MUX1_comienzo1_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u2/CC_MUX1_comienzo2_InBUS

add wave  -divider CC_COMIENZO_u3

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u3/CC_BITCOMIENZO_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u3/CC_MUX1_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u3/CC_MUX1_comienzo1_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_COMIENZO_u3/CC_MUX1_comienzo2_InBUS



add wave  -divider CC_TRANSI_u0

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u0/CC_TRANSI1_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u0/CC_MUX9_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u0/CC_MUX9_NADA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u0/CC_MUX9_TRANSI_InBUS

add wave  -divider CC_TRANSI_u1

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u1/CC_TRANSI1_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u1/CC_MUX9_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u1/CC_MUX9_NADA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u1/CC_MUX9_TRANSI_InBUS

add wave  -divider CC_TRANSI_u2

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u2/CC_TRANSI1_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u2/CC_MUX9_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u2/CC_MUX9_NADA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSI_u2/CC_MUX9_TRANSI_InBUS

add wave  -divider CC_TRANSIGRANDE_u0

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSIGRANDE_u0/CC_SALIDATRANSI_Out
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSIGRANDE_u0/CC_MUX13_select_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSIGRANDE_u0/CC_MUX13_NADA_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSIGRANDE_u0/CC_MUX13_TRANSI1_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSIGRANDE_u0/CC_MUX13_TRANSI2_InBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_TRANSIGRANDE_u0/CC_MUX13_TRANSI3_InBUS

add wave -divider SC_STATEMACHINE_REGRESIVA_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_REGRESIVA_u0/SC_STATEMACHINEBACKG_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_REGRESIVA_u0/SC_STATEMACHINEBACKG_SENALREGRESIVA
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_REGRESIVA_u0/SC_STATEMACHINEBACKG_RESET_InHigh
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_REGRESIVA_u0/SC_STATEMACHINEBACKG_startButton_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_REGRESIVA_u0/SC_STATEMACHINEBACKG_FLAG_InLow
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_REGRESIVA_u0/STATE_Register



add wave -divider SC_SEPARADOR_transi

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_transi/SC_SEPARADOR_Out1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_transi/SC_SEPARADOR_Out2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_transi/SC_SEPARADOR_data_InBUS_1


add wave -divider SC_SEPARADOR_random

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_random/SC_SEPARADOR_Out1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_random/SC_SEPARADOR_Out2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_random/SC_SEPARADOR_data_InBUS_1


add wave -divider SC_SEPARADOR_comienzo

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_comienzo/SC_SEPARADOR_Out1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_comienzo/SC_SEPARADOR_Out2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_SEPARADOR_comienzo/SC_SEPARADOR_data_InBUS_1



restart
run 500ms

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {319999492 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 445
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {59829352 ps} {60892417 ps}
