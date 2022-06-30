import math

def print_pyramid(bit_list):
    with open("dadda_tree_scheme.txt","a") as filed:
        H=13
        a=0
        for j in range (0,len(bit_list),1):
            if(a==10):
                a = 0
            if(a==0 and j!=0):
                filed.write("|",end='')
            else:
                filed.write(a,end='')
            a=a+1
        filed.write("\n")  
        for i in range(0,H,1):
            count_char = 0
            for j in range (0,len(bit_list),1):
                if(bit_list[j]-i>0):
                    filed.write("#",end='')
                    count_char += 1
                else:
                    filed.write(".",end='')
            filed.write("\t."+str(i)+"\t(bits=%d)"%count_char)
        filed.write("")
        filed.write(bit_list) 


bit_list=[]
H = 13
N = 24
for i in range(2,H,1):
    bit_list.append(i)
    bit_list.append(i)
#SAT #check here for errors
for i in range(N,N+math.ceil(N/4),1): 
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

print_pyramid(bit_list)