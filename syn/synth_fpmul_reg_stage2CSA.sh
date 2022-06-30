source /software/scripts/init_synopsys_64.18
cd syn/
mkdir work
mkdir reports_synth_fpmul_reg_stage2CSA
dc_shell-xg-t -f scripts/synth_fpmul_reg_stage2CSA.tcl
