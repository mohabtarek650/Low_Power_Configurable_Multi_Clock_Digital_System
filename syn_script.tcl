define_design_lib work -path ./work
################## Design Compiler Library Files ######################

#Add the path of the libraries to the search_path variable
lappend search_path /home/IC/Labs/SYSTEM/std_cells
lappend search_path /home/IC/Labs/SYSTEM/rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

set_svf SYSTEM.svf

######################## Reading RTL Files #################################

set file_format verilog

analyze -format $file_format [glob /home/IC/Labs/SYSTEM/rtl/*.v]

elaborate -lib work SYS_TOP


puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

check_design SYS_TOP

###################### Mapping and optimization ########################"
source ./cons.tcl

compile

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output System_Top_netlist.v
write_file -format ddc -hierarchy -output System_Top_netlist.ddc
write_sdc  -nosplit System_Top.sdc
write_sdf           System_Top.sdf

################# reporting #######################

report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt

#gui_start


