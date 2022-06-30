#script to verify the correctness of MBE encoder
import fileinput
import re
import os
triplets = ["000",
            "001",
            "010",
            "011",
            "100",
            "101",
            "110",
            "111"]

for i in range (0,len(triplets),1):

    #open testbench
    with open("../tb/MBE_encoder_tb.vhd","r") as tb_r:
        tb_data = tb_r.read()
    #change triplet
    tb_data_w = re.sub(r'[01][01][01]',triplets[i],tb_data)
    #write new testbench
    with open("../tb/MBE_encoder_tb.vhd","w+") as tb_w:
        tb_w.write(tb_data_w)
    #open modelsim for simulation
    os.system('vsim -c -do "do scripts/simulate.do MBE_encoder"')
