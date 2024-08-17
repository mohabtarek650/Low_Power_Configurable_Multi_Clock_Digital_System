

set SSLIB "/home/IC/Labs/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"


set synopsys_auto_setup true

set_svf "/home/IC/Labs/SYSTEM/dft/SYSTEM_TOP_dft.svf"



read_verilog -container Ref [glob /home/IC/Labs/SYSTEM/rtl/*.v]

read_db -container Ref "/home/IC/Labs/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"

set_reference_design SYS_TOP_dft
set_top SYS_TOP_dft



read_verilog -netlist -container Imp "/home/IC/Labs/SYSTEM/dft/SYSTEM_dft.v"

read_db -container Imp "/home/IC/Labs/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"

set_implementation_design SYS_TOP_dft
set_top SYS_TOP_dft


set_dont_verify_points -type port Ref:/WORK/*/SI
set_dont_verify_points -type port Imp:/WORK/*/SI

set_dont_verify_points -type port Ref:/WORK/*/SO
set_dont_verify_points -type port Imp:/WORK/*/SO



set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0



match


set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}


report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui
