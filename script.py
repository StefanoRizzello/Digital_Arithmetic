import os

def synth(file_name):
	clk_value = 0	
	fine = 0
	flag = 0
	while fine == 0:
		next = 0
		file_object = open('syn/scripts/'+file_name+'.tcl','r')
		for line in file_object:
			pos = next
			next += len(line)
			line = line.strip()
			line = " ".join(line.split())
			if line.split(' ')[0] == "synth":
				file_object = open('syn/scripts/'+file_name+'.tcl','ab')
				file_object.truncate(pos)
				break
		pass
		file_object = open('syn/scripts/'+file_name+'.tcl','a')
		file_object.write('synth '+ str(clk_value))
		file_object.close()
		print("\n**********************SYNTHESIS WITH " + str(clk_value) + " ns**********************\n")
		os.system('syn/'+file_name+'.sh')

		with open('syn/reports/reports_'+file_name+'/report_timing_' +str(clk_value)+ '_ns.txt','r') as file:
			for line in file:
				if len(line.split(' '))>2:
					if ((line.split(' ')[2] == "slack")):
						line_to_save = line
						break
			pass

		line_to_save = line_to_save.strip()
		line_to_save = " ".join(line_to_save.split())
		line_to_save = line_to_save.split(' ')[2]
		if line_to_save == "increase":
			flag = 1
			with open('syn/reports/reports_'+file_name+'/report_timing_' +str(clk_value)+ '_ns.txt','r') as file:
				for line in file:
					if len(line.split(' '))>2:
						if ((line.split(' ')[2] == "slack")):
							line_to_save = line
							break
				pass
			line_to_save = line_to_save.strip()
			line_to_save = " ".join(line_to_save.split())
			line_to_save = line_to_save.split(' ')[5]
		file_object = open('syn/scripts/'+file_name+'.tcl', 'rb')
		pos = next = 0

		for line in file_object:
		  	pos = next # position of beginning of this line
		  	next += len(line) # compute position of beginning of next line

		file_object = open('syn/scripts/'+file_name+'.tcl', 'ab')
		file_object.truncate(pos)

		if flag == 1:
			clk_value += 0.01
		elif float(line_to_save) >= 0:
			fine = 1
		else:
			clk_add = float(line_to_save)
			clk_value = float(clk_value) - clk_add
			clk_value += 0.01
		flag = 0

	return clk_value


def change_clock_gen(clk_value):
    file_read = open('hdl/tb/clk_gen.vhd', 'r')
    file_write = open('hdl/tb/clk_gen_tmp.vhd', 'w')
    for line in file_read:
        line2write = line
        line = line.strip()
        line = " ".join(line.split())
        if line.split(' ')[0] == "constant":
            tmp_line = "  constant Ts : time := " + str(clk_value) + " ns;\n"
            file_write.write(tmp_line)
        else:
            file_write.write(line2write)
    file_read.close()
    file_write.close()
    os.remove('hdl/tb/clk_gen.vhd')
    os.rename('hdl/tb/clk_gen_tmp.vhd' , 'hdl/tb/clk_gen.vhd')


#-------------------INIZIO FUNZIONI----------------------

def part1():
	#---------------- MODELSIM SIMULATION -------------------
	#os.system("hdl/sim/simulate_fpmul_reg.sh")

	#----------------------- REG IN -------------------------
	synth("synth_fpmul_reg_flatten")

	synth("synth_fpmul_reg_CSA")

	synth("synth_fpmul_reg_PPARCH")

def part2():
	#-----------------MODELSIM SIMULATION--------------------
	#os.system("hdl/sim/simulate_fpmul_reg_stage2_opt.sh")

	#----------------------- STAGE 2 ------------------------
	#synth("synth_fpmul_reg_stage2_flatten")

	synth("synth_fpmul_reg_stage2_opt")

	synth("synth_fpmul_reg_stage2_compile_ultra")

	synth("synth_fpmul_reg_stage2_CSA_opt")

	synth("synth_fpmul_reg_stage2_CSA_compile_ultra")

	synth("synth_fpmul_reg_stage2_PPARCH_opt")

	synth("synth_fpmul_reg_stage2_PPARCH_compile_ultra")

def part3():
	#-----------------MODELSIM SIMULATION--------------------
	#os.system("hdl/sim/")

	#------------------------- MBE --------------------------
	synth("synth_fpmul_mbe_flatten")

	synth("synth_fpmul_mbe_opt")

	synth("synth_fpmul_mbe_compile_ultra")
	

##########################  MAIN  ###########################

#part1()

#part2()

#part3()
