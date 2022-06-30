import math

def print_pyramid(bit_list,step,dadda_lst):
    with open("python/dadda_tree_scheme.txt","a") as filed:
        H=13
        a=0
        filed.write("--------------------------------\nSTEP N. : "+ str(step) +"\t\t Dadda Step : " + str(dadda_lst[step]) +"\n--------------------------------\n")
        for j in range (0,len(bit_list),1):
            if(a==10):
                a = 0
            if(a==0 and j!=0):
                filed.write("|")
            else:
                filed.write(str(a))
            a=a+1
        filed.write("\n")  
        for i in range(0,H,1):
            count_char = 0
            for j in range (0,len(bit_list),1):
                if(bit_list[j]-i>0):
                    filed.write("#")
                    count_char += 1
                else:
                    filed.write(".")
            filed.write("\t."+str(i)+"\t(bits=%d)\n"%count_char)
        filed.write("\n")
        filed.write(str(bit_list))
        filed.write("\n\n")

#output file creation
with open("python/dadda_tree_scheme.txt","w") as filed:
    pass

#Dadda tree maker
N = 24
H = math.ceil((N/2)+1)
bit_list = []
max_step = 0

#filling bitlist.. RISE
for i in range(2,H,1):
    bit_list.append(i)
    bit_list.append(i)
#SAT #check here for errors
for i in range(N,N+6,1): 
    bit_list.append(H)
#FALL
for i in range(1, H-1,1):
    if(i == 1 or i == H-2):
        bit_list.append(H-i)
    else:
        bit_list.append(H-i)
        bit_list.append(H-i)
print(len(bit_list))
print(bit_list)
dadda_lst = [2,3,4,6,9,13,19,28]
step = 0
start_h = 0

#find first number in dadda list
for i in range(0,len(dadda_lst),1):
    if(dadda_lst[i] >= H):
        step = i
        max_step = i-1
        break

with open("hdl/src/MBE/dadda_tree.vhd","w") as file:
    #HEADER
    file.write("-- Generated .vhd for MBE multiplication\n\n")
    
    #LIBRARIES
    file.write("library ieee;\nuse ieee.std_logic_1164.all;\nuse ieee.numeric_std.all;\n\n")

    #ENTITY
    file.write("entity dadda_tree is\n\n")
    file.write("\tport (\n\t")
    #partial product declaration:
    #first
    file.write("Pp_0 : ")
    file.write("std_logic_vector("+str(N+3)+" downto 0);\n\t")
    #Loop: second to second last-1
    for i in range(1,H-3,1):
        file.write("Pp_"+str(i)+", ")
    file.write("Pp_"+str(H-3)+" : ")
    file.write("in std_logic_vector("+str(N+4)+" downto 0);\n")
    #second last
    file.write("\tPp_"+str(H-2)+" : ")
    file.write("in std_logic_vector("+str(N+3)+" downto 0);\n")
    #last
    file.write("\tPp_"+str(H-1)+" : ")
    file.write("in std_logic_vector("+str(N+2)+" downto 0);\n")
    #output
    file.write("\tZ\t\t: out std_logic_vector("+str(2*N)+"-1 downto 0));\t-- output Z\n\n")
    file.write("end entity dadda_tree;\n\n")
    
    #ARCHITECTURE
    file.write("architecture arch of dadda_tree is\n\n")

    #SIGNAL DECLARATION
    file.write("------------------------\n")
    file.write("-- SIGNALS\n")
    file.write("------------------------\n\n")

    #Partial products
    file.write("-- PARTIAL PRODUCTS (INPUT)\n")
    file.write("signal ")
    for i in range(0,H-1,1):
        file.write("Pp_EXT_"+str(i)+", ")
    file.write("Pp_EXT_"+str(H-1)+" : ")
    file.write("std_logic_vector("+str(2*N-1)+" downto 0):=(others => '0');\n")
    #Last step signals
    file.write("\n-- STEP NO."+str(step)+" (inverse pyramid creation)\n")
    file.write("signal ")
    for i in range(0,H-1,1):
        file.write("r_L"+str(step)+"_"+str(i)+", ")
    file.write("r_L"+str(step)+"_"+str(H-1))
    file.write(": std_logic_vector("+str(2*N)+"-1 downto 0):=(others => '0');\t-- input\n\n")
    #signals for other steps
    step = step -1
    while (step > -1):
        file.write("--STEP NO. "+str(step)+"\n")
        file.write("signal ")
        for i in range(0,dadda_lst[step]-1,1):
            file.write("r_L"+str(step)+"_"+str(i)+", ")
        file.write("r_L"+str(step)+"_"+str(dadda_lst[step]-1))
        file.write(": std_logic_vector("+str(2*N)+"-1 downto 0):=(others => '0');\n\n")
        step = step -1

    #COMPONENT DECLARATION
    file.write("------------------------\n")
    file.write("-- COMPONENTS\n")
    file.write("------------------------\n\n")

    #full adder
    file.write("component full_adder is\n\tport (\n\t\tA\t: in  std_logic;\n\t\tB\t: in  std_logic;\n\t\tCin\t: in  std_logic;\n\t\tSum\t: out std_logic;\n\t\tCout : out std_logic);\nend component full_adder;\n\n")
    #half adder
    file.write("component half_adder is\n\tport (\n\t\tA\t: in  std_logic;\n\t\tB\t: in  std_logic;\n\t\tS\t: out std_logic;\n\t\tCout: out std_logic);\nend component half_adder;\n\n")

    #BEGIN
    file.write("begin\n")
    
    step = max_step+1 
    
    file.write("------------------------\n")
    file.write("-- SIGNALS ASSIGNEMENT\n")
    file.write("------------------------\n\n")
    #FIRST STEP
    
    file.write("-- Zero padding for partial products in input\n")
    #zero padding for pp extension: first and second
    file.write("Pp_EXT_0 <=")
    file.write("("+str(2*N)+"-1 downto (Pp_0'length) => '0')&Pp_0;\n")
    file.write("Pp_EXT_1 <=")
    file.write("("+str(2*N)+"-1 downto (Pp_1'length) => '0')&Pp_1;\n")

    #zero padding for pp extension: second to last
    sh=2
    for k in range(2,H-2,1):
        file.write("Pp_EXT_"+str(k)+"<=")
        #file.write("("+str(2*N)+"-1 downto (Pp_"+str(k)+"'length) => '0')&std_logic_vector(shift_left(signed(Pp_"+str(k)+"),"+str(sh)+"));\n")
        file.write("("+str(2*N)+"-1 downto (Pp_"+str(k)+"'length+"+str(sh)+") => '0')&Pp_"+str(k)+"&\"")
        for i in range (0,sh,1):
            file.write("0")
        file.write("\";\n")
        sh=sh+2
    #last 2
    file.write("Pp_EXT_"+str(H-2)+"<=")
    file.write("Pp_"+str(H-2)+"&\"")
    for i in range (0,sh,1):
       file.write("0")
    file.write("\";\n")
    sh=sh+2
    file.write("Pp_EXT_"+str(H-1)+"<=")
    file.write("Pp_"+str(H-1)+"(Pp_"+str(H-1)+"'length-2 downto 0)&\"")
    for i in range (0,sh,1):
        file.write("0")
    file.write("\";\n")

    
    file.write("\n-- Assignment for dadda tree creation \n")
    #pyramid creation:
    offset_pp = 0
    for i in range(0,(2*N)-N+4,1):
        for j in range(0,bit_list[i],1):
            file.write("r_L"+str(step)+"_"+str(j)+"("+str(i)+")<=")
            file.write("Pp_EXT_"+str(j)+"("+str(i)+");\n") 
        file.write("--\n")
    for i in range((2*N)-N+4, (2*N),1):
        offset_pp = H-bit_list[i]
        for j in range(0,bit_list[i],1):
            file.write("r_L"+str(step)+"_"+str(j)+"("+str(i)+")<=")
            file.write("Pp_EXT_"+str(offset_pp+j)+"("+str(i)+");\n") 
        file.write("--\n")
    file.write("\n--STARTING COMPRESSION:")
    #tree assignment

    print_pyramid(bit_list,step,dadda_lst)

    step = step -1
    last = 0 #last iteration
    while(step>=0):
        c=[0]*(2*N) #carries for the next stage
        file.write("\n--STEP L"+str(step)+"\td ="+str(dadda_lst[step])+":\n")
        for i in range(0,2*N,1):
            if (i == 0):
                last = 0
            if(i==(2*N)-1):
                last = 1
            diff=bit_list[i]-dadda_lst[step]
            n_fa = 0 #number of FA
            ha = 0 #presence of the HA [0,1]
            pos=c[i] #position in col
            pos_old = 0
            j=0
            if(diff>=2): #allocate a FA
                while (diff >=2):
                    n_fa = n_fa+1
                    file.write("FH_L"+str(step)+"_"+str(i)+"_"+str(n_fa)+":")
                    file.write(" full_adder port map(")
                    file.write("r_L"+str(step+1)+"_"+str(j)+"("+str(i)+"), ") #A
                    file.write("r_L"+str(step+1)+"_"+str(j+1)+"("+str(i)+"), ") #B
                    file.write("r_L"+str(step+1)+"_"+str(j+2)+"("+str(i)+"), ") #Cin
                    if (not last):
                        file.write("r_L"+str(step)+"_"+str(pos)+"("+str(i)+"), ") #Sum
                        file.write("r_L"+str(step)+"_"+str(c[i+1])+"("+str(i+1)+"));\n") #Cout
                    else:
                        file.write("r_L"+str(step)+"_"+str(pos)+"("+str(i)+")") #Sum
                        file.write(");\n") #Cout
                    j = j+3 #position (old)
                    pos = pos+1 #position (new)
                    
                    bit_list[i]= bit_list[i]-2 #2:3 compression
                    if(not last):
                        bit_list[i+1]= bit_list[i+1]+1 #update number of col bits with carry out
                        c[i+1] = c[i+1]+1 #update position for the next carry in
                    diff=bit_list[i]-dadda_lst[step] #recalculate diff
                    pos_old = j

            if (diff==1): #if positive, diff must be == 2 at this point, half adder
                file.write("HA_L"+str(step)+"_"+str(i)+":")
                file.write(" half_adder port map(")
                file.write("r_L"+str(step+1)+"_"+str(j)+"("+str(i)+"), ") #A
                file.write("r_L"+str(step+1)+"_"+str(j+1)+"("+str(i)+"), ") #B
                if (not last):
                    file.write("r_L"+str(step)+"_"+str(pos)+"("+str(i)+"), ") #Sum
                    file.write("r_L"+str(step)+"_"+str(c[i+1])+"("+str(i+1)+"));\n") #Cout
                else:
                    file.write("r_L"+str(step)+"_"+str(pos)+"("+str(i)+")") #Sum
                    file.write(");\n") #Cout
                bit_list[i]= bit_list[i]-1 #2:3 compression
                if(not last):
                    c[i+1] = c[i+1]+1 #update position for the next carry in
                    bit_list[i+1]= bit_list[i+1]+1 #carry out
                ha = 1 #count for half adder presence
                pos=pos+1
                pos_old = j+2

            #pos_old = c[i]+n_fa*(2)+(ha*(1))
            for v in range(pos,bit_list[i],1):

                file.write("r_L"+str(step)+"_"+str(v)+"("+str(i)+")"+"<= r_L"+str(step+1)+"_"+str(pos_old)+"("+str(i)+")"+";\n")
                pos_old = pos_old+1
            file.write("--\n")
        print_pyramid(bit_list,step,dadda_lst)
        step = step -1
    #SIGNAL ASSOCIATIONS
    file.write("Z <=  std_logic_vector(unsigned(r_L0_0) + unsigned(r_L0_1));\n")
    #END ARCHITECTURE
    file.write("\nend architecture arch;")