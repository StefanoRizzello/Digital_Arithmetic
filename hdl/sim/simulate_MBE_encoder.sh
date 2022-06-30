source /software/scripts/init_msim6.2g
cd hdl/sim/
vlib work
vsim -c -do "do scripts/simulate.do MBE_encoder"
