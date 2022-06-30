project new . $1.mpf
project addfile ../src/fpmul_pipeline_reg.vhd
project addfile ../src/fpmul_stage2_struct_reg.vhd
project addfile ../src/reg.vhd
project addfile ../src/ff.vhd
project addfile ../src/common/fpmul_stage1_struct.vhd
project addfile ../src/common/fpmul_stage3_struct.vhd
project addfile ../src/common/fpmul_stage4_struct.vhd
project addfile ../src/common/fpnormalize_fpnormalize.vhd
project addfile ../src/common/fpround_fpround.vhd
project addfile ../src/common/packfp_packfp.vhd
project addfile ../src/common/unpackfp_unpackfp.vhd
project addfile ../tb/clk_gen.vhd
project addfile ../tb/data_maker.vhd
project addfile ../tb/data_sink_stage2_opt.vhd
project addfile ../tb/tb_fpmul_reg.v
project compileall
vsim work.tb_fpmul -t ns
run 180 ns
quit -sim
project close
quit
