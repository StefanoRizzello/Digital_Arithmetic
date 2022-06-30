proc elab {} {
source .synopsys_dc.setup
#adding elemts
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/fpmul_pipeline_reg.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/reg.vhd
analyze -f vhdl -lib WORK ../hdl/src/fpmul_pipeline_reg/ff.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpmul_stage1_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpmul_stage2_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpmul_stage3_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpmul_stage4_struct.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/packfp_packfp.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/unpackfp_unpackfp.vhd                   
analyze -f vhdl -lib WORK ../hdl/src/common/fpnormalize_fpnormalize.vhd
analyze -f vhdl -lib WORK ../hdl/src/common/fpround_fpround.vhd
set power_preserve_rtl_hier_names true
elaborate FPmul -arch pipeline -lib WORK 
#> reports/reports_synth_fpmul_reg_stage2CSA_opt/elaborate.txt
#filter contains multiple instances of reg, need to uniquify
uniquify 
link
#ungroup -all -flatten
#set_implementation DW02_mult/csa [find cell I2/mult_134]
}
elab
