import math
#MBE multiplier maker
        
N= 24
#dadda tree
dadda_lst = [2,3,4,6,9,13,19,28]
step = 0
H = math.ceil(N/2)+1
start_h = 0

#find first number in dadda list
for i in range(0,len(dadda_lst),1):
    if(dadda_lst[i] >= H):
        step = i
        max_step = i-1
        break
with open("hdl/src/MBE/mbe_multiplier.vhd","w") as file:
#with open("mbe_multiplier.vhd","w") as file:
    #HEADER
    
    file.write("-- Generated .vhd for MBE "+str(N)+"x"+str(N)+"multiplication\n\n")
    
    #LIBRARIES
    file.write("library ieee;\nuse ieee.std_logic_1164.all;\nuse ieee.numeric_std.all;\n\n")

    #ENTITY
    file.write("entity MBE_multiplier is\n\n")
    file.write("\tport (\n")
    file.write("\t\tA\t: in  std_logic_vector("+str(N)+"-1 downto 0);\t-- input A\n")
    file.write("\t\tB\t: in  std_logic_vector("+str(N)+"-1 downto 0);\t-- input B\n")
    file.write("\t\tZ\t: out  std_logic_vector("+str(2*N)+"-1 downto 0));\t-- output Z\n\n")
    file.write("end entity MBE_multiplier;\n\n")
    
    #ARCHITECTURE
    file.write("architecture arch of MBE_multiplier is\n\n")

    #SIGNAL DECLARATION
    file.write("-- SIGNALS\n")
    #B extended 
    file.write("signal B_ext : std_logic_vector("+str(N)+"-1+3 downto 0);\n\n")

    #partial products
    file.write("signal ")
    for i in range(0,H-1,1):
        file.write("par_pro_"+str(i)+", ")
    file.write("par_pro_"+str(H-1)+" : ")
    file.write("std_logic_vector("+str(N)+" downto 0);\n\n")

    #partial products sign extended
    #first
    file.write("signal par_pro_EXT_0 : ")
    file.write("std_logic_vector("+str(N+3)+" downto 0);\n")

    #PPExt loop
    file.write("signal ")
    for i in range(1,H-3,1):
        file.write("par_pro_EXT_"+str(i)+", ")
    file.write("par_pro_EXT_"+str(H-3)+" : ")
    file.write("std_logic_vector("+str(N+4)+" downto 0);\n")
    
    #second last
    file.write("signal par_pro_EXT_"+str(H-2)+" : ")
    file.write("std_logic_vector("+str(N+3)+" downto 0);\n")
    
    #last
    file.write("signal par_pro_EXT_"+str(H-1)+" : ")
    file.write("std_logic_vector("+str(N+2)+" downto 0);\n\n")



     #triplets
    file.write("signal ")
    for i in range(0,H-1,1):
        file.write("triplet_"+str(i)+", ")
    file.write("triplet_"+str((H-1))+" : ")
    file.write("std_logic_vector(2 downto 0);\n\n")

    #COMPONENT DECLARATION
    file.write("-- COMPONENTS\n")

    #mbe encoder
    file.write("component MBE_encoder is\n")
    file.write("generic (\n")
    file.write("N : integer);\n")
    file.write("port (\n")
    file.write("triplet : in  std_logic_vector(2 downto 0);\n")
    file.write("A       : in  std_logic_vector(N-1 downto 0);\n")
    file.write("P       : out std_logic_vector(N downto 0));\n")
    file.write("end component MBE_encoder;\n\n")

    #dadda tree component
    file.write("component dadda_tree is\n")
    file.write("\tport (\n\t")
    #first
    file.write("Pp_0 : ")
    file.write("std_logic_vector("+str(N+3)+" downto 0);\n\t")

    #PPExt loop
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
    file.write("\tZ\t\t: out std_logic_vector("+str(2*N)+"-1 downto 0));\t-- output Z\n\n")
    file.write("end component dadda_tree;\n\n")
    #BEGIN
    file.write("begin\n")

    #PORT MAP
    #mbe enc
    for i in range(0,H,1):
        file.write("mbe_enc"+str(i)+":\t mbe_encoder generic map(N => "+str(N)+") port map (triplet=>triplet_"+str(i)+",A=>A,P=>par_pro_"+str(i)+");\n")

    #dadda tree
    file.write("\ndadda_tree_imp:\t dadda_tree port map( ")
    for i in range(0,H-1,1):
        file.write("Par_pro_EXT_"+str(i)+", ")
    file.write("Par_pro_EXT_"+str(H-1)+", Z);\n")



    #SIGNAL ASSOCIATIONS
    file.write("\n-- SIGNAL ASSOCIATIONS\n")
    #ext b
    file.write("B_ext <= \"00\"&B&'0';\n\n")
    #triplets
    a=0
    for i in range(1,N+2,2):
        file.write("triplet_"+str(a)+"<=B_ext("+str(i+1)+")&B_ext("+str(i)+")&B_ext("+str(i-1)+");\n")
        a=a+1
    
    #sign extension
    file.write("\n\nPar_pro_EXT_0<=not(triplet_0(2))&triplet_0(2)&triplet_0(2)&Par_pro_0;\n")
    for i in range(1,H-2,1):
        file.write("Par_pro_EXT_"+str(i)+"<='1'&not(triplet_"+str(i)+"(2))&Par_pro_"+str(i)+"&'0'&triplet_"+str(i-1)+"(2);\n")
    file.write("Par_pro_EXT_"+str(H-2)+"<=not(triplet_"+str(H-2)+"(2))&Par_pro_"+str(H-2)+"&'0'&triplet_"+str(H-3)+"(2);\n")
    file.write("Par_pro_EXT_"+str(H-1)+"<=Par_pro_"+str(H-1)+"&'0'&triplet_"+str(H-2)+"(2);\n")
    

    #END ARCHITECTURE
    file.write("\nend architecture arch;")
