source /software/scripts/init_synopsys_64.18
cd syn/
mkdir work
mkdir reports/reports_synth_fpmul_mbe_compile_ultra
dc_shell-xg-t -f scripts/synth_fpmul_mbe_compile_ultra.tcl
