source /software/scripts/init_synopsys_64.18
cd syn/
mkdir work
mkdir reports/reports_synth_fpmul_reg_flatten
dc_shell-xg-t -f scripts/synth.tcl -x "set name 'fpmul_reg_flatten'"
