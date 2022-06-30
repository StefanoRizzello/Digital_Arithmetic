project new . ${1}_proj.mpf
project addfile ../src/common/fpmul_stage1_struct.vhd
project addfile ../src/common/fpmul_stage3_struct.vhd
project addfile ../src/common/fpmul_stage4_struct.vhd
project addfile ../src/common/fpnormalize_fpnormalize.vhd
project addfile ../src/common/fpround_fpround.vhd
project addfile ../src/common/packfp_packfp.vhd
project addfile ../src/common/unpackfp_unpackfp.vhd
project addfile ../src/fpmul_pipeline_reg/ff.vhd
project addfile ../src/fpmul_pipeline_reg/fpmul_pipeline_reg.vhd
project addfile ../src/fpmul_pipeline_reg/reg.vhd
project addfile ../src/fpmul_pipeline_reg/stage2_mbe/fpmul_stage2_struct_mbe_noreg.vhd
project addfile ../src/fpmul_pipeline_reg/stage2_mbe/mbe/dadda_tree.vhd
project addfile ../src/fpmul_pipeline_reg/stage2_mbe/mbe/full_adder.vhd
project addfile ../src/fpmul_pipeline_reg/stage2_mbe/mbe/half_adder.vhd
project addfile ../src/fpmul_pipeline_reg/stage2_mbe/mbe/MBE_encoder.vhd
project addfile ../src/fpmul_pipeline_reg/stage2_mbe/mbe/mbe_multiplier.vhd
project addfile ../tb/clk_gen.vhd
project addfile ../tb/data_maker.vhd
project addfile ../tb/data_sink.vhd
project addfile ../tb/tb_fpmul.v
project compileall
vsim  work.tb_fpmul -t ns
run 1 us
quit -sim
project close
quit
