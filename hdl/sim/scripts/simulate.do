project new . ${1}_proj.mpf
project addfile ../src/MBE/${1}.vhd
project addfile ../tb/${1}_tb.vhd
project compileall
vsim  work.${1}_tb -t ns
run 1 us
quit -sim
project close
quit
