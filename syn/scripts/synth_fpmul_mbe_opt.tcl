proc elab {} {
source .synopsys_dc.setup
#adding elemts
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/fpmul_pipeline_reg.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/reg.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/ff.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/stage2_mbe/fpmul_stage2_struct_mbe.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/stage2_mbe/mbe/dadda_tree.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/stage2_mbe/mbe/full_adder.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/stage2_mbe/mbe/half_adder.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/stage2_mbe/mbe/MBE_encoder.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/stage2_mbe/mbe/mbe_multiplier.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpmul_stage1_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpmul_stage3_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpmul_stage4_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/packfp_packfp.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/unpackfp_unpackfp.vhd                   
analyze -f vhdl -lib WORK ../hdl/src/common/fpnormalize_fpnormalize.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpround_fpround.vhd
set power_preserve_rtl_hier_names true
elaborate FPmul -arch pipeline -lib WORK > reports/reports_synth_fpmul_mbe_opt/elaborate.txt
#filter contains multiple instances of reg, need to uniquify
uniquify 
link
ungroup -all -flatten
}

proc synth {clk_var} {
#set clock @argv1+-0.07ns
create_clock -name MY_CLK -period $clk_var clk
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clock MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clock]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
compile
optimize_registers
report_timing > reports/reports_synth_fpmul_mbe_opt/report_timing_${clk_var}_ns.txt
report_area > reports/reports_synth_fpmul_mbe_opt/report_area_clk_${clk_var}_ns.txt
report_resources > reports/reports_synth_fpmul_mbe_opt/report_resources_clk_${clk_var}_ns.txt
quit
}


elab
