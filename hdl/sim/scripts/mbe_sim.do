#assume to have the project opened
project compileall
vsim  work.mbe_multiplier_tb -t ns
add wave -position insertpoint sim:/mbe_multiplier_tb/DUT/*
run 1 us