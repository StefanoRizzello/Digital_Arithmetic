source /software/scripts/init_msim6.2g
cd hdl/sim/
vlib work
vsim -c -do "do scripts/run_fpmul_reg_stage2_opt_cmd.do fpmul_reg_stage2_opt"
