-- Generated .vhd for MBE multiplication

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dadda_tree is

	port (
	Pp_0 : std_logic_vector(27 downto 0);
	Pp_1, Pp_2, Pp_3, Pp_4, Pp_5, Pp_6, Pp_7, Pp_8, Pp_9, Pp_10 : in std_logic_vector(28 downto 0);
	Pp_11 : in std_logic_vector(27 downto 0);
	Pp_12 : in std_logic_vector(26 downto 0);
	Z		: out std_logic_vector(48-1 downto 0));	-- output Z

end entity dadda_tree;

architecture arch of dadda_tree is

------------------------
-- SIGNALS
------------------------

-- PARTIAL PRODUCTS (INPUT)
signal Pp_EXT_0, Pp_EXT_1, Pp_EXT_2, Pp_EXT_3, Pp_EXT_4, Pp_EXT_5, Pp_EXT_6, Pp_EXT_7, Pp_EXT_8, Pp_EXT_9, Pp_EXT_10, Pp_EXT_11, Pp_EXT_12 : std_logic_vector(47 downto 0):=(others => '0');

-- STEP NO.5 (inverse pyramid creation)
signal r_L5_0, r_L5_1, r_L5_2, r_L5_3, r_L5_4, r_L5_5, r_L5_6, r_L5_7, r_L5_8, r_L5_9, r_L5_10, r_L5_11, r_L5_12: std_logic_vector(48-1 downto 0):=(others => '0');	-- input

--STEP NO. 4
signal r_L4_0, r_L4_1, r_L4_2, r_L4_3, r_L4_4, r_L4_5, r_L4_6, r_L4_7, r_L4_8: std_logic_vector(48-1 downto 0):=(others => '0');

--STEP NO. 3
signal r_L3_0, r_L3_1, r_L3_2, r_L3_3, r_L3_4, r_L3_5: std_logic_vector(48-1 downto 0):=(others => '0');

--STEP NO. 2
signal r_L2_0, r_L2_1, r_L2_2, r_L2_3: std_logic_vector(48-1 downto 0):=(others => '0');

--STEP NO. 1
signal r_L1_0, r_L1_1, r_L1_2: std_logic_vector(48-1 downto 0):=(others => '0');

--STEP NO. 0
signal r_L0_0, r_L0_1: std_logic_vector(48-1 downto 0):=(others => '0');

------------------------
-- COMPONENTS
------------------------

component full_adder is
	port (
		A	: in  std_logic;
		B	: in  std_logic;
		Cin	: in  std_logic;
		Sum	: out std_logic;
		Cout : out std_logic);
end component full_adder;

component half_adder is
	port (
		A	: in  std_logic;
		B	: in  std_logic;
		S	: out std_logic;
		Cout: out std_logic);
end component half_adder;

begin
------------------------
-- SIGNALS ASSIGNEMENT
------------------------

-- Zero padding for partial products in input
Pp_EXT_0 <=(48-1 downto (Pp_0'length) => '0')&Pp_0;
Pp_EXT_1 <=(48-1 downto (Pp_1'length) => '0')&Pp_1;
Pp_EXT_2<=(48-1 downto (Pp_2'length+2) => '0')&Pp_2&"00";
Pp_EXT_3<=(48-1 downto (Pp_3'length+4) => '0')&Pp_3&"0000";
Pp_EXT_4<=(48-1 downto (Pp_4'length+6) => '0')&Pp_4&"000000";
Pp_EXT_5<=(48-1 downto (Pp_5'length+8) => '0')&Pp_5&"00000000";
Pp_EXT_6<=(48-1 downto (Pp_6'length+10) => '0')&Pp_6&"0000000000";
Pp_EXT_7<=(48-1 downto (Pp_7'length+12) => '0')&Pp_7&"000000000000";
Pp_EXT_8<=(48-1 downto (Pp_8'length+14) => '0')&Pp_8&"00000000000000";
Pp_EXT_9<=(48-1 downto (Pp_9'length+16) => '0')&Pp_9&"0000000000000000";
Pp_EXT_10<=(48-1 downto (Pp_10'length+18) => '0')&Pp_10&"000000000000000000";
Pp_EXT_11<=Pp_11&"00000000000000000000";
Pp_EXT_12<=Pp_12(Pp_12'length-2 downto 0)&"0000000000000000000000";

-- Assignment for dadda tree creation 
r_L5_0(0)<=Pp_EXT_0(0);
r_L5_1(0)<=Pp_EXT_1(0);
--
r_L5_0(1)<=Pp_EXT_0(1);
r_L5_1(1)<=Pp_EXT_1(1);
--
r_L5_0(2)<=Pp_EXT_0(2);
r_L5_1(2)<=Pp_EXT_1(2);
r_L5_2(2)<=Pp_EXT_2(2);
--
r_L5_0(3)<=Pp_EXT_0(3);
r_L5_1(3)<=Pp_EXT_1(3);
r_L5_2(3)<=Pp_EXT_2(3);
--
r_L5_0(4)<=Pp_EXT_0(4);
r_L5_1(4)<=Pp_EXT_1(4);
r_L5_2(4)<=Pp_EXT_2(4);
r_L5_3(4)<=Pp_EXT_3(4);
--
r_L5_0(5)<=Pp_EXT_0(5);
r_L5_1(5)<=Pp_EXT_1(5);
r_L5_2(5)<=Pp_EXT_2(5);
r_L5_3(5)<=Pp_EXT_3(5);
--
r_L5_0(6)<=Pp_EXT_0(6);
r_L5_1(6)<=Pp_EXT_1(6);
r_L5_2(6)<=Pp_EXT_2(6);
r_L5_3(6)<=Pp_EXT_3(6);
r_L5_4(6)<=Pp_EXT_4(6);
--
r_L5_0(7)<=Pp_EXT_0(7);
r_L5_1(7)<=Pp_EXT_1(7);
r_L5_2(7)<=Pp_EXT_2(7);
r_L5_3(7)<=Pp_EXT_3(7);
r_L5_4(7)<=Pp_EXT_4(7);
--
r_L5_0(8)<=Pp_EXT_0(8);
r_L5_1(8)<=Pp_EXT_1(8);
r_L5_2(8)<=Pp_EXT_2(8);
r_L5_3(8)<=Pp_EXT_3(8);
r_L5_4(8)<=Pp_EXT_4(8);
r_L5_5(8)<=Pp_EXT_5(8);
--
r_L5_0(9)<=Pp_EXT_0(9);
r_L5_1(9)<=Pp_EXT_1(9);
r_L5_2(9)<=Pp_EXT_2(9);
r_L5_3(9)<=Pp_EXT_3(9);
r_L5_4(9)<=Pp_EXT_4(9);
r_L5_5(9)<=Pp_EXT_5(9);
--
r_L5_0(10)<=Pp_EXT_0(10);
r_L5_1(10)<=Pp_EXT_1(10);
r_L5_2(10)<=Pp_EXT_2(10);
r_L5_3(10)<=Pp_EXT_3(10);
r_L5_4(10)<=Pp_EXT_4(10);
r_L5_5(10)<=Pp_EXT_5(10);
r_L5_6(10)<=Pp_EXT_6(10);
--
r_L5_0(11)<=Pp_EXT_0(11);
r_L5_1(11)<=Pp_EXT_1(11);
r_L5_2(11)<=Pp_EXT_2(11);
r_L5_3(11)<=Pp_EXT_3(11);
r_L5_4(11)<=Pp_EXT_4(11);
r_L5_5(11)<=Pp_EXT_5(11);
r_L5_6(11)<=Pp_EXT_6(11);
--
r_L5_0(12)<=Pp_EXT_0(12);
r_L5_1(12)<=Pp_EXT_1(12);
r_L5_2(12)<=Pp_EXT_2(12);
r_L5_3(12)<=Pp_EXT_3(12);
r_L5_4(12)<=Pp_EXT_4(12);
r_L5_5(12)<=Pp_EXT_5(12);
r_L5_6(12)<=Pp_EXT_6(12);
r_L5_7(12)<=Pp_EXT_7(12);
--
r_L5_0(13)<=Pp_EXT_0(13);
r_L5_1(13)<=Pp_EXT_1(13);
r_L5_2(13)<=Pp_EXT_2(13);
r_L5_3(13)<=Pp_EXT_3(13);
r_L5_4(13)<=Pp_EXT_4(13);
r_L5_5(13)<=Pp_EXT_5(13);
r_L5_6(13)<=Pp_EXT_6(13);
r_L5_7(13)<=Pp_EXT_7(13);
--
r_L5_0(14)<=Pp_EXT_0(14);
r_L5_1(14)<=Pp_EXT_1(14);
r_L5_2(14)<=Pp_EXT_2(14);
r_L5_3(14)<=Pp_EXT_3(14);
r_L5_4(14)<=Pp_EXT_4(14);
r_L5_5(14)<=Pp_EXT_5(14);
r_L5_6(14)<=Pp_EXT_6(14);
r_L5_7(14)<=Pp_EXT_7(14);
r_L5_8(14)<=Pp_EXT_8(14);
--
r_L5_0(15)<=Pp_EXT_0(15);
r_L5_1(15)<=Pp_EXT_1(15);
r_L5_2(15)<=Pp_EXT_2(15);
r_L5_3(15)<=Pp_EXT_3(15);
r_L5_4(15)<=Pp_EXT_4(15);
r_L5_5(15)<=Pp_EXT_5(15);
r_L5_6(15)<=Pp_EXT_6(15);
r_L5_7(15)<=Pp_EXT_7(15);
r_L5_8(15)<=Pp_EXT_8(15);
--
r_L5_0(16)<=Pp_EXT_0(16);
r_L5_1(16)<=Pp_EXT_1(16);
r_L5_2(16)<=Pp_EXT_2(16);
r_L5_3(16)<=Pp_EXT_3(16);
r_L5_4(16)<=Pp_EXT_4(16);
r_L5_5(16)<=Pp_EXT_5(16);
r_L5_6(16)<=Pp_EXT_6(16);
r_L5_7(16)<=Pp_EXT_7(16);
r_L5_8(16)<=Pp_EXT_8(16);
r_L5_9(16)<=Pp_EXT_9(16);
--
r_L5_0(17)<=Pp_EXT_0(17);
r_L5_1(17)<=Pp_EXT_1(17);
r_L5_2(17)<=Pp_EXT_2(17);
r_L5_3(17)<=Pp_EXT_3(17);
r_L5_4(17)<=Pp_EXT_4(17);
r_L5_5(17)<=Pp_EXT_5(17);
r_L5_6(17)<=Pp_EXT_6(17);
r_L5_7(17)<=Pp_EXT_7(17);
r_L5_8(17)<=Pp_EXT_8(17);
r_L5_9(17)<=Pp_EXT_9(17);
--
r_L5_0(18)<=Pp_EXT_0(18);
r_L5_1(18)<=Pp_EXT_1(18);
r_L5_2(18)<=Pp_EXT_2(18);
r_L5_3(18)<=Pp_EXT_3(18);
r_L5_4(18)<=Pp_EXT_4(18);
r_L5_5(18)<=Pp_EXT_5(18);
r_L5_6(18)<=Pp_EXT_6(18);
r_L5_7(18)<=Pp_EXT_7(18);
r_L5_8(18)<=Pp_EXT_8(18);
r_L5_9(18)<=Pp_EXT_9(18);
r_L5_10(18)<=Pp_EXT_10(18);
--
r_L5_0(19)<=Pp_EXT_0(19);
r_L5_1(19)<=Pp_EXT_1(19);
r_L5_2(19)<=Pp_EXT_2(19);
r_L5_3(19)<=Pp_EXT_3(19);
r_L5_4(19)<=Pp_EXT_4(19);
r_L5_5(19)<=Pp_EXT_5(19);
r_L5_6(19)<=Pp_EXT_6(19);
r_L5_7(19)<=Pp_EXT_7(19);
r_L5_8(19)<=Pp_EXT_8(19);
r_L5_9(19)<=Pp_EXT_9(19);
r_L5_10(19)<=Pp_EXT_10(19);
--
r_L5_0(20)<=Pp_EXT_0(20);
r_L5_1(20)<=Pp_EXT_1(20);
r_L5_2(20)<=Pp_EXT_2(20);
r_L5_3(20)<=Pp_EXT_3(20);
r_L5_4(20)<=Pp_EXT_4(20);
r_L5_5(20)<=Pp_EXT_5(20);
r_L5_6(20)<=Pp_EXT_6(20);
r_L5_7(20)<=Pp_EXT_7(20);
r_L5_8(20)<=Pp_EXT_8(20);
r_L5_9(20)<=Pp_EXT_9(20);
r_L5_10(20)<=Pp_EXT_10(20);
r_L5_11(20)<=Pp_EXT_11(20);
--
r_L5_0(21)<=Pp_EXT_0(21);
r_L5_1(21)<=Pp_EXT_1(21);
r_L5_2(21)<=Pp_EXT_2(21);
r_L5_3(21)<=Pp_EXT_3(21);
r_L5_4(21)<=Pp_EXT_4(21);
r_L5_5(21)<=Pp_EXT_5(21);
r_L5_6(21)<=Pp_EXT_6(21);
r_L5_7(21)<=Pp_EXT_7(21);
r_L5_8(21)<=Pp_EXT_8(21);
r_L5_9(21)<=Pp_EXT_9(21);
r_L5_10(21)<=Pp_EXT_10(21);
r_L5_11(21)<=Pp_EXT_11(21);
--
r_L5_0(22)<=Pp_EXT_0(22);
r_L5_1(22)<=Pp_EXT_1(22);
r_L5_2(22)<=Pp_EXT_2(22);
r_L5_3(22)<=Pp_EXT_3(22);
r_L5_4(22)<=Pp_EXT_4(22);
r_L5_5(22)<=Pp_EXT_5(22);
r_L5_6(22)<=Pp_EXT_6(22);
r_L5_7(22)<=Pp_EXT_7(22);
r_L5_8(22)<=Pp_EXT_8(22);
r_L5_9(22)<=Pp_EXT_9(22);
r_L5_10(22)<=Pp_EXT_10(22);
r_L5_11(22)<=Pp_EXT_11(22);
r_L5_12(22)<=Pp_EXT_12(22);
--
r_L5_0(23)<=Pp_EXT_0(23);
r_L5_1(23)<=Pp_EXT_1(23);
r_L5_2(23)<=Pp_EXT_2(23);
r_L5_3(23)<=Pp_EXT_3(23);
r_L5_4(23)<=Pp_EXT_4(23);
r_L5_5(23)<=Pp_EXT_5(23);
r_L5_6(23)<=Pp_EXT_6(23);
r_L5_7(23)<=Pp_EXT_7(23);
r_L5_8(23)<=Pp_EXT_8(23);
r_L5_9(23)<=Pp_EXT_9(23);
r_L5_10(23)<=Pp_EXT_10(23);
r_L5_11(23)<=Pp_EXT_11(23);
r_L5_12(23)<=Pp_EXT_12(23);
--
r_L5_0(24)<=Pp_EXT_0(24);
r_L5_1(24)<=Pp_EXT_1(24);
r_L5_2(24)<=Pp_EXT_2(24);
r_L5_3(24)<=Pp_EXT_3(24);
r_L5_4(24)<=Pp_EXT_4(24);
r_L5_5(24)<=Pp_EXT_5(24);
r_L5_6(24)<=Pp_EXT_6(24);
r_L5_7(24)<=Pp_EXT_7(24);
r_L5_8(24)<=Pp_EXT_8(24);
r_L5_9(24)<=Pp_EXT_9(24);
r_L5_10(24)<=Pp_EXT_10(24);
r_L5_11(24)<=Pp_EXT_11(24);
r_L5_12(24)<=Pp_EXT_12(24);
--
r_L5_0(25)<=Pp_EXT_0(25);
r_L5_1(25)<=Pp_EXT_1(25);
r_L5_2(25)<=Pp_EXT_2(25);
r_L5_3(25)<=Pp_EXT_3(25);
r_L5_4(25)<=Pp_EXT_4(25);
r_L5_5(25)<=Pp_EXT_5(25);
r_L5_6(25)<=Pp_EXT_6(25);
r_L5_7(25)<=Pp_EXT_7(25);
r_L5_8(25)<=Pp_EXT_8(25);
r_L5_9(25)<=Pp_EXT_9(25);
r_L5_10(25)<=Pp_EXT_10(25);
r_L5_11(25)<=Pp_EXT_11(25);
r_L5_12(25)<=Pp_EXT_12(25);
--
r_L5_0(26)<=Pp_EXT_0(26);
r_L5_1(26)<=Pp_EXT_1(26);
r_L5_2(26)<=Pp_EXT_2(26);
r_L5_3(26)<=Pp_EXT_3(26);
r_L5_4(26)<=Pp_EXT_4(26);
r_L5_5(26)<=Pp_EXT_5(26);
r_L5_6(26)<=Pp_EXT_6(26);
r_L5_7(26)<=Pp_EXT_7(26);
r_L5_8(26)<=Pp_EXT_8(26);
r_L5_9(26)<=Pp_EXT_9(26);
r_L5_10(26)<=Pp_EXT_10(26);
r_L5_11(26)<=Pp_EXT_11(26);
r_L5_12(26)<=Pp_EXT_12(26);
--
r_L5_0(27)<=Pp_EXT_0(27);
r_L5_1(27)<=Pp_EXT_1(27);
r_L5_2(27)<=Pp_EXT_2(27);
r_L5_3(27)<=Pp_EXT_3(27);
r_L5_4(27)<=Pp_EXT_4(27);
r_L5_5(27)<=Pp_EXT_5(27);
r_L5_6(27)<=Pp_EXT_6(27);
r_L5_7(27)<=Pp_EXT_7(27);
r_L5_8(27)<=Pp_EXT_8(27);
r_L5_9(27)<=Pp_EXT_9(27);
r_L5_10(27)<=Pp_EXT_10(27);
r_L5_11(27)<=Pp_EXT_11(27);
r_L5_12(27)<=Pp_EXT_12(27);
--
r_L5_0(28)<=Pp_EXT_1(28);
r_L5_1(28)<=Pp_EXT_2(28);
r_L5_2(28)<=Pp_EXT_3(28);
r_L5_3(28)<=Pp_EXT_4(28);
r_L5_4(28)<=Pp_EXT_5(28);
r_L5_5(28)<=Pp_EXT_6(28);
r_L5_6(28)<=Pp_EXT_7(28);
r_L5_7(28)<=Pp_EXT_8(28);
r_L5_8(28)<=Pp_EXT_9(28);
r_L5_9(28)<=Pp_EXT_10(28);
r_L5_10(28)<=Pp_EXT_11(28);
r_L5_11(28)<=Pp_EXT_12(28);
--
r_L5_0(29)<=Pp_EXT_2(29);
r_L5_1(29)<=Pp_EXT_3(29);
r_L5_2(29)<=Pp_EXT_4(29);
r_L5_3(29)<=Pp_EXT_5(29);
r_L5_4(29)<=Pp_EXT_6(29);
r_L5_5(29)<=Pp_EXT_7(29);
r_L5_6(29)<=Pp_EXT_8(29);
r_L5_7(29)<=Pp_EXT_9(29);
r_L5_8(29)<=Pp_EXT_10(29);
r_L5_9(29)<=Pp_EXT_11(29);
r_L5_10(29)<=Pp_EXT_12(29);
--
r_L5_0(30)<=Pp_EXT_2(30);
r_L5_1(30)<=Pp_EXT_3(30);
r_L5_2(30)<=Pp_EXT_4(30);
r_L5_3(30)<=Pp_EXT_5(30);
r_L5_4(30)<=Pp_EXT_6(30);
r_L5_5(30)<=Pp_EXT_7(30);
r_L5_6(30)<=Pp_EXT_8(30);
r_L5_7(30)<=Pp_EXT_9(30);
r_L5_8(30)<=Pp_EXT_10(30);
r_L5_9(30)<=Pp_EXT_11(30);
r_L5_10(30)<=Pp_EXT_12(30);
--
r_L5_0(31)<=Pp_EXT_3(31);
r_L5_1(31)<=Pp_EXT_4(31);
r_L5_2(31)<=Pp_EXT_5(31);
r_L5_3(31)<=Pp_EXT_6(31);
r_L5_4(31)<=Pp_EXT_7(31);
r_L5_5(31)<=Pp_EXT_8(31);
r_L5_6(31)<=Pp_EXT_9(31);
r_L5_7(31)<=Pp_EXT_10(31);
r_L5_8(31)<=Pp_EXT_11(31);
r_L5_9(31)<=Pp_EXT_12(31);
--
r_L5_0(32)<=Pp_EXT_3(32);
r_L5_1(32)<=Pp_EXT_4(32);
r_L5_2(32)<=Pp_EXT_5(32);
r_L5_3(32)<=Pp_EXT_6(32);
r_L5_4(32)<=Pp_EXT_7(32);
r_L5_5(32)<=Pp_EXT_8(32);
r_L5_6(32)<=Pp_EXT_9(32);
r_L5_7(32)<=Pp_EXT_10(32);
r_L5_8(32)<=Pp_EXT_11(32);
r_L5_9(32)<=Pp_EXT_12(32);
--
r_L5_0(33)<=Pp_EXT_4(33);
r_L5_1(33)<=Pp_EXT_5(33);
r_L5_2(33)<=Pp_EXT_6(33);
r_L5_3(33)<=Pp_EXT_7(33);
r_L5_4(33)<=Pp_EXT_8(33);
r_L5_5(33)<=Pp_EXT_9(33);
r_L5_6(33)<=Pp_EXT_10(33);
r_L5_7(33)<=Pp_EXT_11(33);
r_L5_8(33)<=Pp_EXT_12(33);
--
r_L5_0(34)<=Pp_EXT_4(34);
r_L5_1(34)<=Pp_EXT_5(34);
r_L5_2(34)<=Pp_EXT_6(34);
r_L5_3(34)<=Pp_EXT_7(34);
r_L5_4(34)<=Pp_EXT_8(34);
r_L5_5(34)<=Pp_EXT_9(34);
r_L5_6(34)<=Pp_EXT_10(34);
r_L5_7(34)<=Pp_EXT_11(34);
r_L5_8(34)<=Pp_EXT_12(34);
--
r_L5_0(35)<=Pp_EXT_5(35);
r_L5_1(35)<=Pp_EXT_6(35);
r_L5_2(35)<=Pp_EXT_7(35);
r_L5_3(35)<=Pp_EXT_8(35);
r_L5_4(35)<=Pp_EXT_9(35);
r_L5_5(35)<=Pp_EXT_10(35);
r_L5_6(35)<=Pp_EXT_11(35);
r_L5_7(35)<=Pp_EXT_12(35);
--
r_L5_0(36)<=Pp_EXT_5(36);
r_L5_1(36)<=Pp_EXT_6(36);
r_L5_2(36)<=Pp_EXT_7(36);
r_L5_3(36)<=Pp_EXT_8(36);
r_L5_4(36)<=Pp_EXT_9(36);
r_L5_5(36)<=Pp_EXT_10(36);
r_L5_6(36)<=Pp_EXT_11(36);
r_L5_7(36)<=Pp_EXT_12(36);
--
r_L5_0(37)<=Pp_EXT_6(37);
r_L5_1(37)<=Pp_EXT_7(37);
r_L5_2(37)<=Pp_EXT_8(37);
r_L5_3(37)<=Pp_EXT_9(37);
r_L5_4(37)<=Pp_EXT_10(37);
r_L5_5(37)<=Pp_EXT_11(37);
r_L5_6(37)<=Pp_EXT_12(37);
--
r_L5_0(38)<=Pp_EXT_6(38);
r_L5_1(38)<=Pp_EXT_7(38);
r_L5_2(38)<=Pp_EXT_8(38);
r_L5_3(38)<=Pp_EXT_9(38);
r_L5_4(38)<=Pp_EXT_10(38);
r_L5_5(38)<=Pp_EXT_11(38);
r_L5_6(38)<=Pp_EXT_12(38);
--
r_L5_0(39)<=Pp_EXT_7(39);
r_L5_1(39)<=Pp_EXT_8(39);
r_L5_2(39)<=Pp_EXT_9(39);
r_L5_3(39)<=Pp_EXT_10(39);
r_L5_4(39)<=Pp_EXT_11(39);
r_L5_5(39)<=Pp_EXT_12(39);
--
r_L5_0(40)<=Pp_EXT_7(40);
r_L5_1(40)<=Pp_EXT_8(40);
r_L5_2(40)<=Pp_EXT_9(40);
r_L5_3(40)<=Pp_EXT_10(40);
r_L5_4(40)<=Pp_EXT_11(40);
r_L5_5(40)<=Pp_EXT_12(40);
--
r_L5_0(41)<=Pp_EXT_8(41);
r_L5_1(41)<=Pp_EXT_9(41);
r_L5_2(41)<=Pp_EXT_10(41);
r_L5_3(41)<=Pp_EXT_11(41);
r_L5_4(41)<=Pp_EXT_12(41);
--
r_L5_0(42)<=Pp_EXT_8(42);
r_L5_1(42)<=Pp_EXT_9(42);
r_L5_2(42)<=Pp_EXT_10(42);
r_L5_3(42)<=Pp_EXT_11(42);
r_L5_4(42)<=Pp_EXT_12(42);
--
r_L5_0(43)<=Pp_EXT_9(43);
r_L5_1(43)<=Pp_EXT_10(43);
r_L5_2(43)<=Pp_EXT_11(43);
r_L5_3(43)<=Pp_EXT_12(43);
--
r_L5_0(44)<=Pp_EXT_9(44);
r_L5_1(44)<=Pp_EXT_10(44);
r_L5_2(44)<=Pp_EXT_11(44);
r_L5_3(44)<=Pp_EXT_12(44);
--
r_L5_0(45)<=Pp_EXT_10(45);
r_L5_1(45)<=Pp_EXT_11(45);
r_L5_2(45)<=Pp_EXT_12(45);
--
r_L5_0(46)<=Pp_EXT_10(46);
r_L5_1(46)<=Pp_EXT_11(46);
r_L5_2(46)<=Pp_EXT_12(46);
--
r_L5_0(47)<=Pp_EXT_11(47);
r_L5_1(47)<=Pp_EXT_12(47);
--

--STARTING COMPRESSION:
--STEP L4	d =9:
r_L4_0(0)<= r_L5_0(0);
r_L4_1(0)<= r_L5_1(0);
--
r_L4_0(1)<= r_L5_0(1);
r_L4_1(1)<= r_L5_1(1);
--
r_L4_0(2)<= r_L5_0(2);
r_L4_1(2)<= r_L5_1(2);
r_L4_2(2)<= r_L5_2(2);
--
r_L4_0(3)<= r_L5_0(3);
r_L4_1(3)<= r_L5_1(3);
r_L4_2(3)<= r_L5_2(3);
--
r_L4_0(4)<= r_L5_0(4);
r_L4_1(4)<= r_L5_1(4);
r_L4_2(4)<= r_L5_2(4);
r_L4_3(4)<= r_L5_3(4);
--
r_L4_0(5)<= r_L5_0(5);
r_L4_1(5)<= r_L5_1(5);
r_L4_2(5)<= r_L5_2(5);
r_L4_3(5)<= r_L5_3(5);
--
r_L4_0(6)<= r_L5_0(6);
r_L4_1(6)<= r_L5_1(6);
r_L4_2(6)<= r_L5_2(6);
r_L4_3(6)<= r_L5_3(6);
r_L4_4(6)<= r_L5_4(6);
--
r_L4_0(7)<= r_L5_0(7);
r_L4_1(7)<= r_L5_1(7);
r_L4_2(7)<= r_L5_2(7);
r_L4_3(7)<= r_L5_3(7);
r_L4_4(7)<= r_L5_4(7);
--
r_L4_0(8)<= r_L5_0(8);
r_L4_1(8)<= r_L5_1(8);
r_L4_2(8)<= r_L5_2(8);
r_L4_3(8)<= r_L5_3(8);
r_L4_4(8)<= r_L5_4(8);
r_L4_5(8)<= r_L5_5(8);
--
r_L4_0(9)<= r_L5_0(9);
r_L4_1(9)<= r_L5_1(9);
r_L4_2(9)<= r_L5_2(9);
r_L4_3(9)<= r_L5_3(9);
r_L4_4(9)<= r_L5_4(9);
r_L4_5(9)<= r_L5_5(9);
--
r_L4_0(10)<= r_L5_0(10);
r_L4_1(10)<= r_L5_1(10);
r_L4_2(10)<= r_L5_2(10);
r_L4_3(10)<= r_L5_3(10);
r_L4_4(10)<= r_L5_4(10);
r_L4_5(10)<= r_L5_5(10);
r_L4_6(10)<= r_L5_6(10);
--
r_L4_0(11)<= r_L5_0(11);
r_L4_1(11)<= r_L5_1(11);
r_L4_2(11)<= r_L5_2(11);
r_L4_3(11)<= r_L5_3(11);
r_L4_4(11)<= r_L5_4(11);
r_L4_5(11)<= r_L5_5(11);
r_L4_6(11)<= r_L5_6(11);
--
r_L4_0(12)<= r_L5_0(12);
r_L4_1(12)<= r_L5_1(12);
r_L4_2(12)<= r_L5_2(12);
r_L4_3(12)<= r_L5_3(12);
r_L4_4(12)<= r_L5_4(12);
r_L4_5(12)<= r_L5_5(12);
r_L4_6(12)<= r_L5_6(12);
r_L4_7(12)<= r_L5_7(12);
--
r_L4_0(13)<= r_L5_0(13);
r_L4_1(13)<= r_L5_1(13);
r_L4_2(13)<= r_L5_2(13);
r_L4_3(13)<= r_L5_3(13);
r_L4_4(13)<= r_L5_4(13);
r_L4_5(13)<= r_L5_5(13);
r_L4_6(13)<= r_L5_6(13);
r_L4_7(13)<= r_L5_7(13);
--
r_L4_0(14)<= r_L5_0(14);
r_L4_1(14)<= r_L5_1(14);
r_L4_2(14)<= r_L5_2(14);
r_L4_3(14)<= r_L5_3(14);
r_L4_4(14)<= r_L5_4(14);
r_L4_5(14)<= r_L5_5(14);
r_L4_6(14)<= r_L5_6(14);
r_L4_7(14)<= r_L5_7(14);
r_L4_8(14)<= r_L5_8(14);
--
r_L4_0(15)<= r_L5_0(15);
r_L4_1(15)<= r_L5_1(15);
r_L4_2(15)<= r_L5_2(15);
r_L4_3(15)<= r_L5_3(15);
r_L4_4(15)<= r_L5_4(15);
r_L4_5(15)<= r_L5_5(15);
r_L4_6(15)<= r_L5_6(15);
r_L4_7(15)<= r_L5_7(15);
r_L4_8(15)<= r_L5_8(15);
--
HA_L4_16: half_adder port map(r_L5_0(16), r_L5_1(16), r_L4_0(16), r_L4_0(17));
r_L4_1(16)<= r_L5_2(16);
r_L4_2(16)<= r_L5_3(16);
r_L4_3(16)<= r_L5_4(16);
r_L4_4(16)<= r_L5_5(16);
r_L4_5(16)<= r_L5_6(16);
r_L4_6(16)<= r_L5_7(16);
r_L4_7(16)<= r_L5_8(16);
r_L4_8(16)<= r_L5_9(16);
--
FH_L4_17_1: full_adder port map(r_L5_0(17), r_L5_1(17), r_L5_2(17), r_L4_1(17), r_L4_0(18));
r_L4_2(17)<= r_L5_3(17);
r_L4_3(17)<= r_L5_4(17);
r_L4_4(17)<= r_L5_5(17);
r_L4_5(17)<= r_L5_6(17);
r_L4_6(17)<= r_L5_7(17);
r_L4_7(17)<= r_L5_8(17);
r_L4_8(17)<= r_L5_9(17);
--
FH_L4_18_1: full_adder port map(r_L5_0(18), r_L5_1(18), r_L5_2(18), r_L4_1(18), r_L4_0(19));
HA_L4_18: half_adder port map(r_L5_3(18), r_L5_4(18), r_L4_2(18), r_L4_1(19));
r_L4_3(18)<= r_L5_5(18);
r_L4_4(18)<= r_L5_6(18);
r_L4_5(18)<= r_L5_7(18);
r_L4_6(18)<= r_L5_8(18);
r_L4_7(18)<= r_L5_9(18);
r_L4_8(18)<= r_L5_10(18);
--
FH_L4_19_1: full_adder port map(r_L5_0(19), r_L5_1(19), r_L5_2(19), r_L4_2(19), r_L4_0(20));
FH_L4_19_2: full_adder port map(r_L5_3(19), r_L5_4(19), r_L5_5(19), r_L4_3(19), r_L4_1(20));
r_L4_4(19)<= r_L5_6(19);
r_L4_5(19)<= r_L5_7(19);
r_L4_6(19)<= r_L5_8(19);
r_L4_7(19)<= r_L5_9(19);
r_L4_8(19)<= r_L5_10(19);
--
FH_L4_20_1: full_adder port map(r_L5_0(20), r_L5_1(20), r_L5_2(20), r_L4_2(20), r_L4_0(21));
FH_L4_20_2: full_adder port map(r_L5_3(20), r_L5_4(20), r_L5_5(20), r_L4_3(20), r_L4_1(21));
HA_L4_20: half_adder port map(r_L5_6(20), r_L5_7(20), r_L4_4(20), r_L4_2(21));
r_L4_5(20)<= r_L5_8(20);
r_L4_6(20)<= r_L5_9(20);
r_L4_7(20)<= r_L5_10(20);
r_L4_8(20)<= r_L5_11(20);
--
FH_L4_21_1: full_adder port map(r_L5_0(21), r_L5_1(21), r_L5_2(21), r_L4_3(21), r_L4_0(22));
FH_L4_21_2: full_adder port map(r_L5_3(21), r_L5_4(21), r_L5_5(21), r_L4_4(21), r_L4_1(22));
FH_L4_21_3: full_adder port map(r_L5_6(21), r_L5_7(21), r_L5_8(21), r_L4_5(21), r_L4_2(22));
r_L4_6(21)<= r_L5_9(21);
r_L4_7(21)<= r_L5_10(21);
r_L4_8(21)<= r_L5_11(21);
--
FH_L4_22_1: full_adder port map(r_L5_0(22), r_L5_1(22), r_L5_2(22), r_L4_3(22), r_L4_0(23));
FH_L4_22_2: full_adder port map(r_L5_3(22), r_L5_4(22), r_L5_5(22), r_L4_4(22), r_L4_1(23));
FH_L4_22_3: full_adder port map(r_L5_6(22), r_L5_7(22), r_L5_8(22), r_L4_5(22), r_L4_2(23));
HA_L4_22: half_adder port map(r_L5_9(22), r_L5_10(22), r_L4_6(22), r_L4_3(23));
r_L4_7(22)<= r_L5_11(22);
r_L4_8(22)<= r_L5_12(22);
--
FH_L4_23_1: full_adder port map(r_L5_0(23), r_L5_1(23), r_L5_2(23), r_L4_4(23), r_L4_0(24));
FH_L4_23_2: full_adder port map(r_L5_3(23), r_L5_4(23), r_L5_5(23), r_L4_5(23), r_L4_1(24));
FH_L4_23_3: full_adder port map(r_L5_6(23), r_L5_7(23), r_L5_8(23), r_L4_6(23), r_L4_2(24));
FH_L4_23_4: full_adder port map(r_L5_9(23), r_L5_10(23), r_L5_11(23), r_L4_7(23), r_L4_3(24));
r_L4_8(23)<= r_L5_12(23);
--
FH_L4_24_1: full_adder port map(r_L5_0(24), r_L5_1(24), r_L5_2(24), r_L4_4(24), r_L4_0(25));
FH_L4_24_2: full_adder port map(r_L5_3(24), r_L5_4(24), r_L5_5(24), r_L4_5(24), r_L4_1(25));
FH_L4_24_3: full_adder port map(r_L5_6(24), r_L5_7(24), r_L5_8(24), r_L4_6(24), r_L4_2(25));
FH_L4_24_4: full_adder port map(r_L5_9(24), r_L5_10(24), r_L5_11(24), r_L4_7(24), r_L4_3(25));
r_L4_8(24)<= r_L5_12(24);
--
FH_L4_25_1: full_adder port map(r_L5_0(25), r_L5_1(25), r_L5_2(25), r_L4_4(25), r_L4_0(26));
FH_L4_25_2: full_adder port map(r_L5_3(25), r_L5_4(25), r_L5_5(25), r_L4_5(25), r_L4_1(26));
FH_L4_25_3: full_adder port map(r_L5_6(25), r_L5_7(25), r_L5_8(25), r_L4_6(25), r_L4_2(26));
FH_L4_25_4: full_adder port map(r_L5_9(25), r_L5_10(25), r_L5_11(25), r_L4_7(25), r_L4_3(26));
r_L4_8(25)<= r_L5_12(25);
--
FH_L4_26_1: full_adder port map(r_L5_0(26), r_L5_1(26), r_L5_2(26), r_L4_4(26), r_L4_0(27));
FH_L4_26_2: full_adder port map(r_L5_3(26), r_L5_4(26), r_L5_5(26), r_L4_5(26), r_L4_1(27));
FH_L4_26_3: full_adder port map(r_L5_6(26), r_L5_7(26), r_L5_8(26), r_L4_6(26), r_L4_2(27));
FH_L4_26_4: full_adder port map(r_L5_9(26), r_L5_10(26), r_L5_11(26), r_L4_7(26), r_L4_3(27));
r_L4_8(26)<= r_L5_12(26);
--
FH_L4_27_1: full_adder port map(r_L5_0(27), r_L5_1(27), r_L5_2(27), r_L4_4(27), r_L4_0(28));
FH_L4_27_2: full_adder port map(r_L5_3(27), r_L5_4(27), r_L5_5(27), r_L4_5(27), r_L4_1(28));
FH_L4_27_3: full_adder port map(r_L5_6(27), r_L5_7(27), r_L5_8(27), r_L4_6(27), r_L4_2(28));
FH_L4_27_4: full_adder port map(r_L5_9(27), r_L5_10(27), r_L5_11(27), r_L4_7(27), r_L4_3(28));
r_L4_8(27)<= r_L5_12(27);
--
FH_L4_28_1: full_adder port map(r_L5_0(28), r_L5_1(28), r_L5_2(28), r_L4_4(28), r_L4_0(29));
FH_L4_28_2: full_adder port map(r_L5_3(28), r_L5_4(28), r_L5_5(28), r_L4_5(28), r_L4_1(29));
FH_L4_28_3: full_adder port map(r_L5_6(28), r_L5_7(28), r_L5_8(28), r_L4_6(28), r_L4_2(29));
HA_L4_28: half_adder port map(r_L5_9(28), r_L5_10(28), r_L4_7(28), r_L4_3(29));
r_L4_8(28)<= r_L5_11(28);
--
FH_L4_29_1: full_adder port map(r_L5_0(29), r_L5_1(29), r_L5_2(29), r_L4_4(29), r_L4_0(30));
FH_L4_29_2: full_adder port map(r_L5_3(29), r_L5_4(29), r_L5_5(29), r_L4_5(29), r_L4_1(30));
FH_L4_29_3: full_adder port map(r_L5_6(29), r_L5_7(29), r_L5_8(29), r_L4_6(29), r_L4_2(30));
r_L4_7(29)<= r_L5_9(29);
r_L4_8(29)<= r_L5_10(29);
--
FH_L4_30_1: full_adder port map(r_L5_0(30), r_L5_1(30), r_L5_2(30), r_L4_3(30), r_L4_0(31));
FH_L4_30_2: full_adder port map(r_L5_3(30), r_L5_4(30), r_L5_5(30), r_L4_4(30), r_L4_1(31));
HA_L4_30: half_adder port map(r_L5_6(30), r_L5_7(30), r_L4_5(30), r_L4_2(31));
r_L4_6(30)<= r_L5_8(30);
r_L4_7(30)<= r_L5_9(30);
r_L4_8(30)<= r_L5_10(30);
--
FH_L4_31_1: full_adder port map(r_L5_0(31), r_L5_1(31), r_L5_2(31), r_L4_3(31), r_L4_0(32));
FH_L4_31_2: full_adder port map(r_L5_3(31), r_L5_4(31), r_L5_5(31), r_L4_4(31), r_L4_1(32));
r_L4_5(31)<= r_L5_6(31);
r_L4_6(31)<= r_L5_7(31);
r_L4_7(31)<= r_L5_8(31);
r_L4_8(31)<= r_L5_9(31);
--
FH_L4_32_1: full_adder port map(r_L5_0(32), r_L5_1(32), r_L5_2(32), r_L4_2(32), r_L4_0(33));
HA_L4_32: half_adder port map(r_L5_3(32), r_L5_4(32), r_L4_3(32), r_L4_1(33));
r_L4_4(32)<= r_L5_5(32);
r_L4_5(32)<= r_L5_6(32);
r_L4_6(32)<= r_L5_7(32);
r_L4_7(32)<= r_L5_8(32);
r_L4_8(32)<= r_L5_9(32);
--
FH_L4_33_1: full_adder port map(r_L5_0(33), r_L5_1(33), r_L5_2(33), r_L4_2(33), r_L4_0(34));
r_L4_3(33)<= r_L5_3(33);
r_L4_4(33)<= r_L5_4(33);
r_L4_5(33)<= r_L5_5(33);
r_L4_6(33)<= r_L5_6(33);
r_L4_7(33)<= r_L5_7(33);
r_L4_8(33)<= r_L5_8(33);
--
HA_L4_34: half_adder port map(r_L5_0(34), r_L5_1(34), r_L4_1(34), r_L4_0(35));
r_L4_2(34)<= r_L5_2(34);
r_L4_3(34)<= r_L5_3(34);
r_L4_4(34)<= r_L5_4(34);
r_L4_5(34)<= r_L5_5(34);
r_L4_6(34)<= r_L5_6(34);
r_L4_7(34)<= r_L5_7(34);
r_L4_8(34)<= r_L5_8(34);
--
r_L4_1(35)<= r_L5_0(35);
r_L4_2(35)<= r_L5_1(35);
r_L4_3(35)<= r_L5_2(35);
r_L4_4(35)<= r_L5_3(35);
r_L4_5(35)<= r_L5_4(35);
r_L4_6(35)<= r_L5_5(35);
r_L4_7(35)<= r_L5_6(35);
r_L4_8(35)<= r_L5_7(35);
--
r_L4_0(36)<= r_L5_0(36);
r_L4_1(36)<= r_L5_1(36);
r_L4_2(36)<= r_L5_2(36);
r_L4_3(36)<= r_L5_3(36);
r_L4_4(36)<= r_L5_4(36);
r_L4_5(36)<= r_L5_5(36);
r_L4_6(36)<= r_L5_6(36);
r_L4_7(36)<= r_L5_7(36);
--
r_L4_0(37)<= r_L5_0(37);
r_L4_1(37)<= r_L5_1(37);
r_L4_2(37)<= r_L5_2(37);
r_L4_3(37)<= r_L5_3(37);
r_L4_4(37)<= r_L5_4(37);
r_L4_5(37)<= r_L5_5(37);
r_L4_6(37)<= r_L5_6(37);
--
r_L4_0(38)<= r_L5_0(38);
r_L4_1(38)<= r_L5_1(38);
r_L4_2(38)<= r_L5_2(38);
r_L4_3(38)<= r_L5_3(38);
r_L4_4(38)<= r_L5_4(38);
r_L4_5(38)<= r_L5_5(38);
r_L4_6(38)<= r_L5_6(38);
--
r_L4_0(39)<= r_L5_0(39);
r_L4_1(39)<= r_L5_1(39);
r_L4_2(39)<= r_L5_2(39);
r_L4_3(39)<= r_L5_3(39);
r_L4_4(39)<= r_L5_4(39);
r_L4_5(39)<= r_L5_5(39);
--
r_L4_0(40)<= r_L5_0(40);
r_L4_1(40)<= r_L5_1(40);
r_L4_2(40)<= r_L5_2(40);
r_L4_3(40)<= r_L5_3(40);
r_L4_4(40)<= r_L5_4(40);
r_L4_5(40)<= r_L5_5(40);
--
r_L4_0(41)<= r_L5_0(41);
r_L4_1(41)<= r_L5_1(41);
r_L4_2(41)<= r_L5_2(41);
r_L4_3(41)<= r_L5_3(41);
r_L4_4(41)<= r_L5_4(41);
--
r_L4_0(42)<= r_L5_0(42);
r_L4_1(42)<= r_L5_1(42);
r_L4_2(42)<= r_L5_2(42);
r_L4_3(42)<= r_L5_3(42);
r_L4_4(42)<= r_L5_4(42);
--
r_L4_0(43)<= r_L5_0(43);
r_L4_1(43)<= r_L5_1(43);
r_L4_2(43)<= r_L5_2(43);
r_L4_3(43)<= r_L5_3(43);
--
r_L4_0(44)<= r_L5_0(44);
r_L4_1(44)<= r_L5_1(44);
r_L4_2(44)<= r_L5_2(44);
r_L4_3(44)<= r_L5_3(44);
--
r_L4_0(45)<= r_L5_0(45);
r_L4_1(45)<= r_L5_1(45);
r_L4_2(45)<= r_L5_2(45);
--
r_L4_0(46)<= r_L5_0(46);
r_L4_1(46)<= r_L5_1(46);
r_L4_2(46)<= r_L5_2(46);
--
r_L4_0(47)<= r_L5_0(47);
r_L4_1(47)<= r_L5_1(47);
--

--STEP L3	d =6:
r_L3_0(0)<= r_L4_0(0);
r_L3_1(0)<= r_L4_1(0);
--
r_L3_0(1)<= r_L4_0(1);
r_L3_1(1)<= r_L4_1(1);
--
r_L3_0(2)<= r_L4_0(2);
r_L3_1(2)<= r_L4_1(2);
r_L3_2(2)<= r_L4_2(2);
--
r_L3_0(3)<= r_L4_0(3);
r_L3_1(3)<= r_L4_1(3);
r_L3_2(3)<= r_L4_2(3);
--
r_L3_0(4)<= r_L4_0(4);
r_L3_1(4)<= r_L4_1(4);
r_L3_2(4)<= r_L4_2(4);
r_L3_3(4)<= r_L4_3(4);
--
r_L3_0(5)<= r_L4_0(5);
r_L3_1(5)<= r_L4_1(5);
r_L3_2(5)<= r_L4_2(5);
r_L3_3(5)<= r_L4_3(5);
--
r_L3_0(6)<= r_L4_0(6);
r_L3_1(6)<= r_L4_1(6);
r_L3_2(6)<= r_L4_2(6);
r_L3_3(6)<= r_L4_3(6);
r_L3_4(6)<= r_L4_4(6);
--
r_L3_0(7)<= r_L4_0(7);
r_L3_1(7)<= r_L4_1(7);
r_L3_2(7)<= r_L4_2(7);
r_L3_3(7)<= r_L4_3(7);
r_L3_4(7)<= r_L4_4(7);
--
r_L3_0(8)<= r_L4_0(8);
r_L3_1(8)<= r_L4_1(8);
r_L3_2(8)<= r_L4_2(8);
r_L3_3(8)<= r_L4_3(8);
r_L3_4(8)<= r_L4_4(8);
r_L3_5(8)<= r_L4_5(8);
--
r_L3_0(9)<= r_L4_0(9);
r_L3_1(9)<= r_L4_1(9);
r_L3_2(9)<= r_L4_2(9);
r_L3_3(9)<= r_L4_3(9);
r_L3_4(9)<= r_L4_4(9);
r_L3_5(9)<= r_L4_5(9);
--
HA_L3_10: half_adder port map(r_L4_0(10), r_L4_1(10), r_L3_0(10), r_L3_0(11));
r_L3_1(10)<= r_L4_2(10);
r_L3_2(10)<= r_L4_3(10);
r_L3_3(10)<= r_L4_4(10);
r_L3_4(10)<= r_L4_5(10);
r_L3_5(10)<= r_L4_6(10);
--
FH_L3_11_1: full_adder port map(r_L4_0(11), r_L4_1(11), r_L4_2(11), r_L3_1(11), r_L3_0(12));
r_L3_2(11)<= r_L4_3(11);
r_L3_3(11)<= r_L4_4(11);
r_L3_4(11)<= r_L4_5(11);
r_L3_5(11)<= r_L4_6(11);
--
FH_L3_12_1: full_adder port map(r_L4_0(12), r_L4_1(12), r_L4_2(12), r_L3_1(12), r_L3_0(13));
HA_L3_12: half_adder port map(r_L4_3(12), r_L4_4(12), r_L3_2(12), r_L3_1(13));
r_L3_3(12)<= r_L4_5(12);
r_L3_4(12)<= r_L4_6(12);
r_L3_5(12)<= r_L4_7(12);
--
FH_L3_13_1: full_adder port map(r_L4_0(13), r_L4_1(13), r_L4_2(13), r_L3_2(13), r_L3_0(14));
FH_L3_13_2: full_adder port map(r_L4_3(13), r_L4_4(13), r_L4_5(13), r_L3_3(13), r_L3_1(14));
r_L3_4(13)<= r_L4_6(13);
r_L3_5(13)<= r_L4_7(13);
--
FH_L3_14_1: full_adder port map(r_L4_0(14), r_L4_1(14), r_L4_2(14), r_L3_2(14), r_L3_0(15));
FH_L3_14_2: full_adder port map(r_L4_3(14), r_L4_4(14), r_L4_5(14), r_L3_3(14), r_L3_1(15));
HA_L3_14: half_adder port map(r_L4_6(14), r_L4_7(14), r_L3_4(14), r_L3_2(15));
r_L3_5(14)<= r_L4_8(14);
--
FH_L3_15_1: full_adder port map(r_L4_0(15), r_L4_1(15), r_L4_2(15), r_L3_3(15), r_L3_0(16));
FH_L3_15_2: full_adder port map(r_L4_3(15), r_L4_4(15), r_L4_5(15), r_L3_4(15), r_L3_1(16));
FH_L3_15_3: full_adder port map(r_L4_6(15), r_L4_7(15), r_L4_8(15), r_L3_5(15), r_L3_2(16));
--
FH_L3_16_1: full_adder port map(r_L4_0(16), r_L4_1(16), r_L4_2(16), r_L3_3(16), r_L3_0(17));
FH_L3_16_2: full_adder port map(r_L4_3(16), r_L4_4(16), r_L4_5(16), r_L3_4(16), r_L3_1(17));
FH_L3_16_3: full_adder port map(r_L4_6(16), r_L4_7(16), r_L4_8(16), r_L3_5(16), r_L3_2(17));
--
FH_L3_17_1: full_adder port map(r_L4_0(17), r_L4_1(17), r_L4_2(17), r_L3_3(17), r_L3_0(18));
FH_L3_17_2: full_adder port map(r_L4_3(17), r_L4_4(17), r_L4_5(17), r_L3_4(17), r_L3_1(18));
FH_L3_17_3: full_adder port map(r_L4_6(17), r_L4_7(17), r_L4_8(17), r_L3_5(17), r_L3_2(18));
--
FH_L3_18_1: full_adder port map(r_L4_0(18), r_L4_1(18), r_L4_2(18), r_L3_3(18), r_L3_0(19));
FH_L3_18_2: full_adder port map(r_L4_3(18), r_L4_4(18), r_L4_5(18), r_L3_4(18), r_L3_1(19));
FH_L3_18_3: full_adder port map(r_L4_6(18), r_L4_7(18), r_L4_8(18), r_L3_5(18), r_L3_2(19));
--
FH_L3_19_1: full_adder port map(r_L4_0(19), r_L4_1(19), r_L4_2(19), r_L3_3(19), r_L3_0(20));
FH_L3_19_2: full_adder port map(r_L4_3(19), r_L4_4(19), r_L4_5(19), r_L3_4(19), r_L3_1(20));
FH_L3_19_3: full_adder port map(r_L4_6(19), r_L4_7(19), r_L4_8(19), r_L3_5(19), r_L3_2(20));
--
FH_L3_20_1: full_adder port map(r_L4_0(20), r_L4_1(20), r_L4_2(20), r_L3_3(20), r_L3_0(21));
FH_L3_20_2: full_adder port map(r_L4_3(20), r_L4_4(20), r_L4_5(20), r_L3_4(20), r_L3_1(21));
FH_L3_20_3: full_adder port map(r_L4_6(20), r_L4_7(20), r_L4_8(20), r_L3_5(20), r_L3_2(21));
--
FH_L3_21_1: full_adder port map(r_L4_0(21), r_L4_1(21), r_L4_2(21), r_L3_3(21), r_L3_0(22));
FH_L3_21_2: full_adder port map(r_L4_3(21), r_L4_4(21), r_L4_5(21), r_L3_4(21), r_L3_1(22));
FH_L3_21_3: full_adder port map(r_L4_6(21), r_L4_7(21), r_L4_8(21), r_L3_5(21), r_L3_2(22));
--
FH_L3_22_1: full_adder port map(r_L4_0(22), r_L4_1(22), r_L4_2(22), r_L3_3(22), r_L3_0(23));
FH_L3_22_2: full_adder port map(r_L4_3(22), r_L4_4(22), r_L4_5(22), r_L3_4(22), r_L3_1(23));
FH_L3_22_3: full_adder port map(r_L4_6(22), r_L4_7(22), r_L4_8(22), r_L3_5(22), r_L3_2(23));
--
FH_L3_23_1: full_adder port map(r_L4_0(23), r_L4_1(23), r_L4_2(23), r_L3_3(23), r_L3_0(24));
FH_L3_23_2: full_adder port map(r_L4_3(23), r_L4_4(23), r_L4_5(23), r_L3_4(23), r_L3_1(24));
FH_L3_23_3: full_adder port map(r_L4_6(23), r_L4_7(23), r_L4_8(23), r_L3_5(23), r_L3_2(24));
--
FH_L3_24_1: full_adder port map(r_L4_0(24), r_L4_1(24), r_L4_2(24), r_L3_3(24), r_L3_0(25));
FH_L3_24_2: full_adder port map(r_L4_3(24), r_L4_4(24), r_L4_5(24), r_L3_4(24), r_L3_1(25));
FH_L3_24_3: full_adder port map(r_L4_6(24), r_L4_7(24), r_L4_8(24), r_L3_5(24), r_L3_2(25));
--
FH_L3_25_1: full_adder port map(r_L4_0(25), r_L4_1(25), r_L4_2(25), r_L3_3(25), r_L3_0(26));
FH_L3_25_2: full_adder port map(r_L4_3(25), r_L4_4(25), r_L4_5(25), r_L3_4(25), r_L3_1(26));
FH_L3_25_3: full_adder port map(r_L4_6(25), r_L4_7(25), r_L4_8(25), r_L3_5(25), r_L3_2(26));
--
FH_L3_26_1: full_adder port map(r_L4_0(26), r_L4_1(26), r_L4_2(26), r_L3_3(26), r_L3_0(27));
FH_L3_26_2: full_adder port map(r_L4_3(26), r_L4_4(26), r_L4_5(26), r_L3_4(26), r_L3_1(27));
FH_L3_26_3: full_adder port map(r_L4_6(26), r_L4_7(26), r_L4_8(26), r_L3_5(26), r_L3_2(27));
--
FH_L3_27_1: full_adder port map(r_L4_0(27), r_L4_1(27), r_L4_2(27), r_L3_3(27), r_L3_0(28));
FH_L3_27_2: full_adder port map(r_L4_3(27), r_L4_4(27), r_L4_5(27), r_L3_4(27), r_L3_1(28));
FH_L3_27_3: full_adder port map(r_L4_6(27), r_L4_7(27), r_L4_8(27), r_L3_5(27), r_L3_2(28));
--
FH_L3_28_1: full_adder port map(r_L4_0(28), r_L4_1(28), r_L4_2(28), r_L3_3(28), r_L3_0(29));
FH_L3_28_2: full_adder port map(r_L4_3(28), r_L4_4(28), r_L4_5(28), r_L3_4(28), r_L3_1(29));
FH_L3_28_3: full_adder port map(r_L4_6(28), r_L4_7(28), r_L4_8(28), r_L3_5(28), r_L3_2(29));
--
FH_L3_29_1: full_adder port map(r_L4_0(29), r_L4_1(29), r_L4_2(29), r_L3_3(29), r_L3_0(30));
FH_L3_29_2: full_adder port map(r_L4_3(29), r_L4_4(29), r_L4_5(29), r_L3_4(29), r_L3_1(30));
FH_L3_29_3: full_adder port map(r_L4_6(29), r_L4_7(29), r_L4_8(29), r_L3_5(29), r_L3_2(30));
--
FH_L3_30_1: full_adder port map(r_L4_0(30), r_L4_1(30), r_L4_2(30), r_L3_3(30), r_L3_0(31));
FH_L3_30_2: full_adder port map(r_L4_3(30), r_L4_4(30), r_L4_5(30), r_L3_4(30), r_L3_1(31));
FH_L3_30_3: full_adder port map(r_L4_6(30), r_L4_7(30), r_L4_8(30), r_L3_5(30), r_L3_2(31));
--
FH_L3_31_1: full_adder port map(r_L4_0(31), r_L4_1(31), r_L4_2(31), r_L3_3(31), r_L3_0(32));
FH_L3_31_2: full_adder port map(r_L4_3(31), r_L4_4(31), r_L4_5(31), r_L3_4(31), r_L3_1(32));
FH_L3_31_3: full_adder port map(r_L4_6(31), r_L4_7(31), r_L4_8(31), r_L3_5(31), r_L3_2(32));
--
FH_L3_32_1: full_adder port map(r_L4_0(32), r_L4_1(32), r_L4_2(32), r_L3_3(32), r_L3_0(33));
FH_L3_32_2: full_adder port map(r_L4_3(32), r_L4_4(32), r_L4_5(32), r_L3_4(32), r_L3_1(33));
FH_L3_32_3: full_adder port map(r_L4_6(32), r_L4_7(32), r_L4_8(32), r_L3_5(32), r_L3_2(33));
--
FH_L3_33_1: full_adder port map(r_L4_0(33), r_L4_1(33), r_L4_2(33), r_L3_3(33), r_L3_0(34));
FH_L3_33_2: full_adder port map(r_L4_3(33), r_L4_4(33), r_L4_5(33), r_L3_4(33), r_L3_1(34));
FH_L3_33_3: full_adder port map(r_L4_6(33), r_L4_7(33), r_L4_8(33), r_L3_5(33), r_L3_2(34));
--
FH_L3_34_1: full_adder port map(r_L4_0(34), r_L4_1(34), r_L4_2(34), r_L3_3(34), r_L3_0(35));
FH_L3_34_2: full_adder port map(r_L4_3(34), r_L4_4(34), r_L4_5(34), r_L3_4(34), r_L3_1(35));
FH_L3_34_3: full_adder port map(r_L4_6(34), r_L4_7(34), r_L4_8(34), r_L3_5(34), r_L3_2(35));
--
FH_L3_35_1: full_adder port map(r_L4_0(35), r_L4_1(35), r_L4_2(35), r_L3_3(35), r_L3_0(36));
FH_L3_35_2: full_adder port map(r_L4_3(35), r_L4_4(35), r_L4_5(35), r_L3_4(35), r_L3_1(36));
FH_L3_35_3: full_adder port map(r_L4_6(35), r_L4_7(35), r_L4_8(35), r_L3_5(35), r_L3_2(36));
--
FH_L3_36_1: full_adder port map(r_L4_0(36), r_L4_1(36), r_L4_2(36), r_L3_3(36), r_L3_0(37));
FH_L3_36_2: full_adder port map(r_L4_3(36), r_L4_4(36), r_L4_5(36), r_L3_4(36), r_L3_1(37));
HA_L3_36: half_adder port map(r_L4_6(36), r_L4_7(36), r_L3_5(36), r_L3_2(37));
--
FH_L3_37_1: full_adder port map(r_L4_0(37), r_L4_1(37), r_L4_2(37), r_L3_3(37), r_L3_0(38));
FH_L3_37_2: full_adder port map(r_L4_3(37), r_L4_4(37), r_L4_5(37), r_L3_4(37), r_L3_1(38));
r_L3_5(37)<= r_L4_6(37);
--
FH_L3_38_1: full_adder port map(r_L4_0(38), r_L4_1(38), r_L4_2(38), r_L3_2(38), r_L3_0(39));
HA_L3_38: half_adder port map(r_L4_3(38), r_L4_4(38), r_L3_3(38), r_L3_1(39));
r_L3_4(38)<= r_L4_5(38);
r_L3_5(38)<= r_L4_6(38);
--
FH_L3_39_1: full_adder port map(r_L4_0(39), r_L4_1(39), r_L4_2(39), r_L3_2(39), r_L3_0(40));
r_L3_3(39)<= r_L4_3(39);
r_L3_4(39)<= r_L4_4(39);
r_L3_5(39)<= r_L4_5(39);
--
HA_L3_40: half_adder port map(r_L4_0(40), r_L4_1(40), r_L3_1(40), r_L3_0(41));
r_L3_2(40)<= r_L4_2(40);
r_L3_3(40)<= r_L4_3(40);
r_L3_4(40)<= r_L4_4(40);
r_L3_5(40)<= r_L4_5(40);
--
r_L3_1(41)<= r_L4_0(41);
r_L3_2(41)<= r_L4_1(41);
r_L3_3(41)<= r_L4_2(41);
r_L3_4(41)<= r_L4_3(41);
r_L3_5(41)<= r_L4_4(41);
--
r_L3_0(42)<= r_L4_0(42);
r_L3_1(42)<= r_L4_1(42);
r_L3_2(42)<= r_L4_2(42);
r_L3_3(42)<= r_L4_3(42);
r_L3_4(42)<= r_L4_4(42);
--
r_L3_0(43)<= r_L4_0(43);
r_L3_1(43)<= r_L4_1(43);
r_L3_2(43)<= r_L4_2(43);
r_L3_3(43)<= r_L4_3(43);
--
r_L3_0(44)<= r_L4_0(44);
r_L3_1(44)<= r_L4_1(44);
r_L3_2(44)<= r_L4_2(44);
r_L3_3(44)<= r_L4_3(44);
--
r_L3_0(45)<= r_L4_0(45);
r_L3_1(45)<= r_L4_1(45);
r_L3_2(45)<= r_L4_2(45);
--
r_L3_0(46)<= r_L4_0(46);
r_L3_1(46)<= r_L4_1(46);
r_L3_2(46)<= r_L4_2(46);
--
r_L3_0(47)<= r_L4_0(47);
r_L3_1(47)<= r_L4_1(47);
--

--STEP L2	d =4:
r_L2_0(0)<= r_L3_0(0);
r_L2_1(0)<= r_L3_1(0);
--
r_L2_0(1)<= r_L3_0(1);
r_L2_1(1)<= r_L3_1(1);
--
r_L2_0(2)<= r_L3_0(2);
r_L2_1(2)<= r_L3_1(2);
r_L2_2(2)<= r_L3_2(2);
--
r_L2_0(3)<= r_L3_0(3);
r_L2_1(3)<= r_L3_1(3);
r_L2_2(3)<= r_L3_2(3);
--
r_L2_0(4)<= r_L3_0(4);
r_L2_1(4)<= r_L3_1(4);
r_L2_2(4)<= r_L3_2(4);
r_L2_3(4)<= r_L3_3(4);
--
r_L2_0(5)<= r_L3_0(5);
r_L2_1(5)<= r_L3_1(5);
r_L2_2(5)<= r_L3_2(5);
r_L2_3(5)<= r_L3_3(5);
--
HA_L2_6: half_adder port map(r_L3_0(6), r_L3_1(6), r_L2_0(6), r_L2_0(7));
r_L2_1(6)<= r_L3_2(6);
r_L2_2(6)<= r_L3_3(6);
r_L2_3(6)<= r_L3_4(6);
--
FH_L2_7_1: full_adder port map(r_L3_0(7), r_L3_1(7), r_L3_2(7), r_L2_1(7), r_L2_0(8));
r_L2_2(7)<= r_L3_3(7);
r_L2_3(7)<= r_L3_4(7);
--
FH_L2_8_1: full_adder port map(r_L3_0(8), r_L3_1(8), r_L3_2(8), r_L2_1(8), r_L2_0(9));
HA_L2_8: half_adder port map(r_L3_3(8), r_L3_4(8), r_L2_2(8), r_L2_1(9));
r_L2_3(8)<= r_L3_5(8);
--
FH_L2_9_1: full_adder port map(r_L3_0(9), r_L3_1(9), r_L3_2(9), r_L2_2(9), r_L2_0(10));
FH_L2_9_2: full_adder port map(r_L3_3(9), r_L3_4(9), r_L3_5(9), r_L2_3(9), r_L2_1(10));
--
FH_L2_10_1: full_adder port map(r_L3_0(10), r_L3_1(10), r_L3_2(10), r_L2_2(10), r_L2_0(11));
FH_L2_10_2: full_adder port map(r_L3_3(10), r_L3_4(10), r_L3_5(10), r_L2_3(10), r_L2_1(11));
--
FH_L2_11_1: full_adder port map(r_L3_0(11), r_L3_1(11), r_L3_2(11), r_L2_2(11), r_L2_0(12));
FH_L2_11_2: full_adder port map(r_L3_3(11), r_L3_4(11), r_L3_5(11), r_L2_3(11), r_L2_1(12));
--
FH_L2_12_1: full_adder port map(r_L3_0(12), r_L3_1(12), r_L3_2(12), r_L2_2(12), r_L2_0(13));
FH_L2_12_2: full_adder port map(r_L3_3(12), r_L3_4(12), r_L3_5(12), r_L2_3(12), r_L2_1(13));
--
FH_L2_13_1: full_adder port map(r_L3_0(13), r_L3_1(13), r_L3_2(13), r_L2_2(13), r_L2_0(14));
FH_L2_13_2: full_adder port map(r_L3_3(13), r_L3_4(13), r_L3_5(13), r_L2_3(13), r_L2_1(14));
--
FH_L2_14_1: full_adder port map(r_L3_0(14), r_L3_1(14), r_L3_2(14), r_L2_2(14), r_L2_0(15));
FH_L2_14_2: full_adder port map(r_L3_3(14), r_L3_4(14), r_L3_5(14), r_L2_3(14), r_L2_1(15));
--
FH_L2_15_1: full_adder port map(r_L3_0(15), r_L3_1(15), r_L3_2(15), r_L2_2(15), r_L2_0(16));
FH_L2_15_2: full_adder port map(r_L3_3(15), r_L3_4(15), r_L3_5(15), r_L2_3(15), r_L2_1(16));
--
FH_L2_16_1: full_adder port map(r_L3_0(16), r_L3_1(16), r_L3_2(16), r_L2_2(16), r_L2_0(17));
FH_L2_16_2: full_adder port map(r_L3_3(16), r_L3_4(16), r_L3_5(16), r_L2_3(16), r_L2_1(17));
--
FH_L2_17_1: full_adder port map(r_L3_0(17), r_L3_1(17), r_L3_2(17), r_L2_2(17), r_L2_0(18));
FH_L2_17_2: full_adder port map(r_L3_3(17), r_L3_4(17), r_L3_5(17), r_L2_3(17), r_L2_1(18));
--
FH_L2_18_1: full_adder port map(r_L3_0(18), r_L3_1(18), r_L3_2(18), r_L2_2(18), r_L2_0(19));
FH_L2_18_2: full_adder port map(r_L3_3(18), r_L3_4(18), r_L3_5(18), r_L2_3(18), r_L2_1(19));
--
FH_L2_19_1: full_adder port map(r_L3_0(19), r_L3_1(19), r_L3_2(19), r_L2_2(19), r_L2_0(20));
FH_L2_19_2: full_adder port map(r_L3_3(19), r_L3_4(19), r_L3_5(19), r_L2_3(19), r_L2_1(20));
--
FH_L2_20_1: full_adder port map(r_L3_0(20), r_L3_1(20), r_L3_2(20), r_L2_2(20), r_L2_0(21));
FH_L2_20_2: full_adder port map(r_L3_3(20), r_L3_4(20), r_L3_5(20), r_L2_3(20), r_L2_1(21));
--
FH_L2_21_1: full_adder port map(r_L3_0(21), r_L3_1(21), r_L3_2(21), r_L2_2(21), r_L2_0(22));
FH_L2_21_2: full_adder port map(r_L3_3(21), r_L3_4(21), r_L3_5(21), r_L2_3(21), r_L2_1(22));
--
FH_L2_22_1: full_adder port map(r_L3_0(22), r_L3_1(22), r_L3_2(22), r_L2_2(22), r_L2_0(23));
FH_L2_22_2: full_adder port map(r_L3_3(22), r_L3_4(22), r_L3_5(22), r_L2_3(22), r_L2_1(23));
--
FH_L2_23_1: full_adder port map(r_L3_0(23), r_L3_1(23), r_L3_2(23), r_L2_2(23), r_L2_0(24));
FH_L2_23_2: full_adder port map(r_L3_3(23), r_L3_4(23), r_L3_5(23), r_L2_3(23), r_L2_1(24));
--
FH_L2_24_1: full_adder port map(r_L3_0(24), r_L3_1(24), r_L3_2(24), r_L2_2(24), r_L2_0(25));
FH_L2_24_2: full_adder port map(r_L3_3(24), r_L3_4(24), r_L3_5(24), r_L2_3(24), r_L2_1(25));
--
FH_L2_25_1: full_adder port map(r_L3_0(25), r_L3_1(25), r_L3_2(25), r_L2_2(25), r_L2_0(26));
FH_L2_25_2: full_adder port map(r_L3_3(25), r_L3_4(25), r_L3_5(25), r_L2_3(25), r_L2_1(26));
--
FH_L2_26_1: full_adder port map(r_L3_0(26), r_L3_1(26), r_L3_2(26), r_L2_2(26), r_L2_0(27));
FH_L2_26_2: full_adder port map(r_L3_3(26), r_L3_4(26), r_L3_5(26), r_L2_3(26), r_L2_1(27));
--
FH_L2_27_1: full_adder port map(r_L3_0(27), r_L3_1(27), r_L3_2(27), r_L2_2(27), r_L2_0(28));
FH_L2_27_2: full_adder port map(r_L3_3(27), r_L3_4(27), r_L3_5(27), r_L2_3(27), r_L2_1(28));
--
FH_L2_28_1: full_adder port map(r_L3_0(28), r_L3_1(28), r_L3_2(28), r_L2_2(28), r_L2_0(29));
FH_L2_28_2: full_adder port map(r_L3_3(28), r_L3_4(28), r_L3_5(28), r_L2_3(28), r_L2_1(29));
--
FH_L2_29_1: full_adder port map(r_L3_0(29), r_L3_1(29), r_L3_2(29), r_L2_2(29), r_L2_0(30));
FH_L2_29_2: full_adder port map(r_L3_3(29), r_L3_4(29), r_L3_5(29), r_L2_3(29), r_L2_1(30));
--
FH_L2_30_1: full_adder port map(r_L3_0(30), r_L3_1(30), r_L3_2(30), r_L2_2(30), r_L2_0(31));
FH_L2_30_2: full_adder port map(r_L3_3(30), r_L3_4(30), r_L3_5(30), r_L2_3(30), r_L2_1(31));
--
FH_L2_31_1: full_adder port map(r_L3_0(31), r_L3_1(31), r_L3_2(31), r_L2_2(31), r_L2_0(32));
FH_L2_31_2: full_adder port map(r_L3_3(31), r_L3_4(31), r_L3_5(31), r_L2_3(31), r_L2_1(32));
--
FH_L2_32_1: full_adder port map(r_L3_0(32), r_L3_1(32), r_L3_2(32), r_L2_2(32), r_L2_0(33));
FH_L2_32_2: full_adder port map(r_L3_3(32), r_L3_4(32), r_L3_5(32), r_L2_3(32), r_L2_1(33));
--
FH_L2_33_1: full_adder port map(r_L3_0(33), r_L3_1(33), r_L3_2(33), r_L2_2(33), r_L2_0(34));
FH_L2_33_2: full_adder port map(r_L3_3(33), r_L3_4(33), r_L3_5(33), r_L2_3(33), r_L2_1(34));
--
FH_L2_34_1: full_adder port map(r_L3_0(34), r_L3_1(34), r_L3_2(34), r_L2_2(34), r_L2_0(35));
FH_L2_34_2: full_adder port map(r_L3_3(34), r_L3_4(34), r_L3_5(34), r_L2_3(34), r_L2_1(35));
--
FH_L2_35_1: full_adder port map(r_L3_0(35), r_L3_1(35), r_L3_2(35), r_L2_2(35), r_L2_0(36));
FH_L2_35_2: full_adder port map(r_L3_3(35), r_L3_4(35), r_L3_5(35), r_L2_3(35), r_L2_1(36));
--
FH_L2_36_1: full_adder port map(r_L3_0(36), r_L3_1(36), r_L3_2(36), r_L2_2(36), r_L2_0(37));
FH_L2_36_2: full_adder port map(r_L3_3(36), r_L3_4(36), r_L3_5(36), r_L2_3(36), r_L2_1(37));
--
FH_L2_37_1: full_adder port map(r_L3_0(37), r_L3_1(37), r_L3_2(37), r_L2_2(37), r_L2_0(38));
FH_L2_37_2: full_adder port map(r_L3_3(37), r_L3_4(37), r_L3_5(37), r_L2_3(37), r_L2_1(38));
--
FH_L2_38_1: full_adder port map(r_L3_0(38), r_L3_1(38), r_L3_2(38), r_L2_2(38), r_L2_0(39));
FH_L2_38_2: full_adder port map(r_L3_3(38), r_L3_4(38), r_L3_5(38), r_L2_3(38), r_L2_1(39));
--
FH_L2_39_1: full_adder port map(r_L3_0(39), r_L3_1(39), r_L3_2(39), r_L2_2(39), r_L2_0(40));
FH_L2_39_2: full_adder port map(r_L3_3(39), r_L3_4(39), r_L3_5(39), r_L2_3(39), r_L2_1(40));
--
FH_L2_40_1: full_adder port map(r_L3_0(40), r_L3_1(40), r_L3_2(40), r_L2_2(40), r_L2_0(41));
FH_L2_40_2: full_adder port map(r_L3_3(40), r_L3_4(40), r_L3_5(40), r_L2_3(40), r_L2_1(41));
--
FH_L2_41_1: full_adder port map(r_L3_0(41), r_L3_1(41), r_L3_2(41), r_L2_2(41), r_L2_0(42));
FH_L2_41_2: full_adder port map(r_L3_3(41), r_L3_4(41), r_L3_5(41), r_L2_3(41), r_L2_1(42));
--
FH_L2_42_1: full_adder port map(r_L3_0(42), r_L3_1(42), r_L3_2(42), r_L2_2(42), r_L2_0(43));
HA_L2_42: half_adder port map(r_L3_3(42), r_L3_4(42), r_L2_3(42), r_L2_1(43));
--
FH_L2_43_1: full_adder port map(r_L3_0(43), r_L3_1(43), r_L3_2(43), r_L2_2(43), r_L2_0(44));
r_L2_3(43)<= r_L3_3(43);
--
HA_L2_44: half_adder port map(r_L3_0(44), r_L3_1(44), r_L2_1(44), r_L2_0(45));
r_L2_2(44)<= r_L3_2(44);
r_L2_3(44)<= r_L3_3(44);
--
r_L2_1(45)<= r_L3_0(45);
r_L2_2(45)<= r_L3_1(45);
r_L2_3(45)<= r_L3_2(45);
--
r_L2_0(46)<= r_L3_0(46);
r_L2_1(46)<= r_L3_1(46);
r_L2_2(46)<= r_L3_2(46);
--
r_L2_0(47)<= r_L3_0(47);
r_L2_1(47)<= r_L3_1(47);
--

--STEP L1	d =3:
r_L1_0(0)<= r_L2_0(0);
r_L1_1(0)<= r_L2_1(0);
--
r_L1_0(1)<= r_L2_0(1);
r_L1_1(1)<= r_L2_1(1);
--
r_L1_0(2)<= r_L2_0(2);
r_L1_1(2)<= r_L2_1(2);
r_L1_2(2)<= r_L2_2(2);
--
r_L1_0(3)<= r_L2_0(3);
r_L1_1(3)<= r_L2_1(3);
r_L1_2(3)<= r_L2_2(3);
--
HA_L1_4: half_adder port map(r_L2_0(4), r_L2_1(4), r_L1_0(4), r_L1_0(5));
r_L1_1(4)<= r_L2_2(4);
r_L1_2(4)<= r_L2_3(4);
--
FH_L1_5_1: full_adder port map(r_L2_0(5), r_L2_1(5), r_L2_2(5), r_L1_1(5), r_L1_0(6));
r_L1_2(5)<= r_L2_3(5);
--
FH_L1_6_1: full_adder port map(r_L2_0(6), r_L2_1(6), r_L2_2(6), r_L1_1(6), r_L1_0(7));
r_L1_2(6)<= r_L2_3(6);
--
FH_L1_7_1: full_adder port map(r_L2_0(7), r_L2_1(7), r_L2_2(7), r_L1_1(7), r_L1_0(8));
r_L1_2(7)<= r_L2_3(7);
--
FH_L1_8_1: full_adder port map(r_L2_0(8), r_L2_1(8), r_L2_2(8), r_L1_1(8), r_L1_0(9));
r_L1_2(8)<= r_L2_3(8);
--
FH_L1_9_1: full_adder port map(r_L2_0(9), r_L2_1(9), r_L2_2(9), r_L1_1(9), r_L1_0(10));
r_L1_2(9)<= r_L2_3(9);
--
FH_L1_10_1: full_adder port map(r_L2_0(10), r_L2_1(10), r_L2_2(10), r_L1_1(10), r_L1_0(11));
r_L1_2(10)<= r_L2_3(10);
--
FH_L1_11_1: full_adder port map(r_L2_0(11), r_L2_1(11), r_L2_2(11), r_L1_1(11), r_L1_0(12));
r_L1_2(11)<= r_L2_3(11);
--
FH_L1_12_1: full_adder port map(r_L2_0(12), r_L2_1(12), r_L2_2(12), r_L1_1(12), r_L1_0(13));
r_L1_2(12)<= r_L2_3(12);
--
FH_L1_13_1: full_adder port map(r_L2_0(13), r_L2_1(13), r_L2_2(13), r_L1_1(13), r_L1_0(14));
r_L1_2(13)<= r_L2_3(13);
--
FH_L1_14_1: full_adder port map(r_L2_0(14), r_L2_1(14), r_L2_2(14), r_L1_1(14), r_L1_0(15));
r_L1_2(14)<= r_L2_3(14);
--
FH_L1_15_1: full_adder port map(r_L2_0(15), r_L2_1(15), r_L2_2(15), r_L1_1(15), r_L1_0(16));
r_L1_2(15)<= r_L2_3(15);
--
FH_L1_16_1: full_adder port map(r_L2_0(16), r_L2_1(16), r_L2_2(16), r_L1_1(16), r_L1_0(17));
r_L1_2(16)<= r_L2_3(16);
--
FH_L1_17_1: full_adder port map(r_L2_0(17), r_L2_1(17), r_L2_2(17), r_L1_1(17), r_L1_0(18));
r_L1_2(17)<= r_L2_3(17);
--
FH_L1_18_1: full_adder port map(r_L2_0(18), r_L2_1(18), r_L2_2(18), r_L1_1(18), r_L1_0(19));
r_L1_2(18)<= r_L2_3(18);
--
FH_L1_19_1: full_adder port map(r_L2_0(19), r_L2_1(19), r_L2_2(19), r_L1_1(19), r_L1_0(20));
r_L1_2(19)<= r_L2_3(19);
--
FH_L1_20_1: full_adder port map(r_L2_0(20), r_L2_1(20), r_L2_2(20), r_L1_1(20), r_L1_0(21));
r_L1_2(20)<= r_L2_3(20);
--
FH_L1_21_1: full_adder port map(r_L2_0(21), r_L2_1(21), r_L2_2(21), r_L1_1(21), r_L1_0(22));
r_L1_2(21)<= r_L2_3(21);
--
FH_L1_22_1: full_adder port map(r_L2_0(22), r_L2_1(22), r_L2_2(22), r_L1_1(22), r_L1_0(23));
r_L1_2(22)<= r_L2_3(22);
--
FH_L1_23_1: full_adder port map(r_L2_0(23), r_L2_1(23), r_L2_2(23), r_L1_1(23), r_L1_0(24));
r_L1_2(23)<= r_L2_3(23);
--
FH_L1_24_1: full_adder port map(r_L2_0(24), r_L2_1(24), r_L2_2(24), r_L1_1(24), r_L1_0(25));
r_L1_2(24)<= r_L2_3(24);
--
FH_L1_25_1: full_adder port map(r_L2_0(25), r_L2_1(25), r_L2_2(25), r_L1_1(25), r_L1_0(26));
r_L1_2(25)<= r_L2_3(25);
--
FH_L1_26_1: full_adder port map(r_L2_0(26), r_L2_1(26), r_L2_2(26), r_L1_1(26), r_L1_0(27));
r_L1_2(26)<= r_L2_3(26);
--
FH_L1_27_1: full_adder port map(r_L2_0(27), r_L2_1(27), r_L2_2(27), r_L1_1(27), r_L1_0(28));
r_L1_2(27)<= r_L2_3(27);
--
FH_L1_28_1: full_adder port map(r_L2_0(28), r_L2_1(28), r_L2_2(28), r_L1_1(28), r_L1_0(29));
r_L1_2(28)<= r_L2_3(28);
--
FH_L1_29_1: full_adder port map(r_L2_0(29), r_L2_1(29), r_L2_2(29), r_L1_1(29), r_L1_0(30));
r_L1_2(29)<= r_L2_3(29);
--
FH_L1_30_1: full_adder port map(r_L2_0(30), r_L2_1(30), r_L2_2(30), r_L1_1(30), r_L1_0(31));
r_L1_2(30)<= r_L2_3(30);
--
FH_L1_31_1: full_adder port map(r_L2_0(31), r_L2_1(31), r_L2_2(31), r_L1_1(31), r_L1_0(32));
r_L1_2(31)<= r_L2_3(31);
--
FH_L1_32_1: full_adder port map(r_L2_0(32), r_L2_1(32), r_L2_2(32), r_L1_1(32), r_L1_0(33));
r_L1_2(32)<= r_L2_3(32);
--
FH_L1_33_1: full_adder port map(r_L2_0(33), r_L2_1(33), r_L2_2(33), r_L1_1(33), r_L1_0(34));
r_L1_2(33)<= r_L2_3(33);
--
FH_L1_34_1: full_adder port map(r_L2_0(34), r_L2_1(34), r_L2_2(34), r_L1_1(34), r_L1_0(35));
r_L1_2(34)<= r_L2_3(34);
--
FH_L1_35_1: full_adder port map(r_L2_0(35), r_L2_1(35), r_L2_2(35), r_L1_1(35), r_L1_0(36));
r_L1_2(35)<= r_L2_3(35);
--
FH_L1_36_1: full_adder port map(r_L2_0(36), r_L2_1(36), r_L2_2(36), r_L1_1(36), r_L1_0(37));
r_L1_2(36)<= r_L2_3(36);
--
FH_L1_37_1: full_adder port map(r_L2_0(37), r_L2_1(37), r_L2_2(37), r_L1_1(37), r_L1_0(38));
r_L1_2(37)<= r_L2_3(37);
--
FH_L1_38_1: full_adder port map(r_L2_0(38), r_L2_1(38), r_L2_2(38), r_L1_1(38), r_L1_0(39));
r_L1_2(38)<= r_L2_3(38);
--
FH_L1_39_1: full_adder port map(r_L2_0(39), r_L2_1(39), r_L2_2(39), r_L1_1(39), r_L1_0(40));
r_L1_2(39)<= r_L2_3(39);
--
FH_L1_40_1: full_adder port map(r_L2_0(40), r_L2_1(40), r_L2_2(40), r_L1_1(40), r_L1_0(41));
r_L1_2(40)<= r_L2_3(40);
--
FH_L1_41_1: full_adder port map(r_L2_0(41), r_L2_1(41), r_L2_2(41), r_L1_1(41), r_L1_0(42));
r_L1_2(41)<= r_L2_3(41);
--
FH_L1_42_1: full_adder port map(r_L2_0(42), r_L2_1(42), r_L2_2(42), r_L1_1(42), r_L1_0(43));
r_L1_2(42)<= r_L2_3(42);
--
FH_L1_43_1: full_adder port map(r_L2_0(43), r_L2_1(43), r_L2_2(43), r_L1_1(43), r_L1_0(44));
r_L1_2(43)<= r_L2_3(43);
--
FH_L1_44_1: full_adder port map(r_L2_0(44), r_L2_1(44), r_L2_2(44), r_L1_1(44), r_L1_0(45));
r_L1_2(44)<= r_L2_3(44);
--
FH_L1_45_1: full_adder port map(r_L2_0(45), r_L2_1(45), r_L2_2(45), r_L1_1(45), r_L1_0(46));
r_L1_2(45)<= r_L2_3(45);
--
HA_L1_46: half_adder port map(r_L2_0(46), r_L2_1(46), r_L1_1(46), r_L1_0(47));
r_L1_2(46)<= r_L2_2(46);
--
r_L1_1(47)<= r_L2_0(47);
r_L1_2(47)<= r_L2_1(47);
--

--STEP L0	d =2:
r_L0_0(0)<= r_L1_0(0);
r_L0_1(0)<= r_L1_1(0);
--
r_L0_0(1)<= r_L1_0(1);
r_L0_1(1)<= r_L1_1(1);
--
HA_L0_2: half_adder port map(r_L1_0(2), r_L1_1(2), r_L0_0(2), r_L0_0(3));
r_L0_1(2)<= r_L1_2(2);
--
FH_L0_3_1: full_adder port map(r_L1_0(3), r_L1_1(3), r_L1_2(3), r_L0_1(3), r_L0_0(4));
--
FH_L0_4_1: full_adder port map(r_L1_0(4), r_L1_1(4), r_L1_2(4), r_L0_1(4), r_L0_0(5));
--
FH_L0_5_1: full_adder port map(r_L1_0(5), r_L1_1(5), r_L1_2(5), r_L0_1(5), r_L0_0(6));
--
FH_L0_6_1: full_adder port map(r_L1_0(6), r_L1_1(6), r_L1_2(6), r_L0_1(6), r_L0_0(7));
--
FH_L0_7_1: full_adder port map(r_L1_0(7), r_L1_1(7), r_L1_2(7), r_L0_1(7), r_L0_0(8));
--
FH_L0_8_1: full_adder port map(r_L1_0(8), r_L1_1(8), r_L1_2(8), r_L0_1(8), r_L0_0(9));
--
FH_L0_9_1: full_adder port map(r_L1_0(9), r_L1_1(9), r_L1_2(9), r_L0_1(9), r_L0_0(10));
--
FH_L0_10_1: full_adder port map(r_L1_0(10), r_L1_1(10), r_L1_2(10), r_L0_1(10), r_L0_0(11));
--
FH_L0_11_1: full_adder port map(r_L1_0(11), r_L1_1(11), r_L1_2(11), r_L0_1(11), r_L0_0(12));
--
FH_L0_12_1: full_adder port map(r_L1_0(12), r_L1_1(12), r_L1_2(12), r_L0_1(12), r_L0_0(13));
--
FH_L0_13_1: full_adder port map(r_L1_0(13), r_L1_1(13), r_L1_2(13), r_L0_1(13), r_L0_0(14));
--
FH_L0_14_1: full_adder port map(r_L1_0(14), r_L1_1(14), r_L1_2(14), r_L0_1(14), r_L0_0(15));
--
FH_L0_15_1: full_adder port map(r_L1_0(15), r_L1_1(15), r_L1_2(15), r_L0_1(15), r_L0_0(16));
--
FH_L0_16_1: full_adder port map(r_L1_0(16), r_L1_1(16), r_L1_2(16), r_L0_1(16), r_L0_0(17));
--
FH_L0_17_1: full_adder port map(r_L1_0(17), r_L1_1(17), r_L1_2(17), r_L0_1(17), r_L0_0(18));
--
FH_L0_18_1: full_adder port map(r_L1_0(18), r_L1_1(18), r_L1_2(18), r_L0_1(18), r_L0_0(19));
--
FH_L0_19_1: full_adder port map(r_L1_0(19), r_L1_1(19), r_L1_2(19), r_L0_1(19), r_L0_0(20));
--
FH_L0_20_1: full_adder port map(r_L1_0(20), r_L1_1(20), r_L1_2(20), r_L0_1(20), r_L0_0(21));
--
FH_L0_21_1: full_adder port map(r_L1_0(21), r_L1_1(21), r_L1_2(21), r_L0_1(21), r_L0_0(22));
--
FH_L0_22_1: full_adder port map(r_L1_0(22), r_L1_1(22), r_L1_2(22), r_L0_1(22), r_L0_0(23));
--
FH_L0_23_1: full_adder port map(r_L1_0(23), r_L1_1(23), r_L1_2(23), r_L0_1(23), r_L0_0(24));
--
FH_L0_24_1: full_adder port map(r_L1_0(24), r_L1_1(24), r_L1_2(24), r_L0_1(24), r_L0_0(25));
--
FH_L0_25_1: full_adder port map(r_L1_0(25), r_L1_1(25), r_L1_2(25), r_L0_1(25), r_L0_0(26));
--
FH_L0_26_1: full_adder port map(r_L1_0(26), r_L1_1(26), r_L1_2(26), r_L0_1(26), r_L0_0(27));
--
FH_L0_27_1: full_adder port map(r_L1_0(27), r_L1_1(27), r_L1_2(27), r_L0_1(27), r_L0_0(28));
--
FH_L0_28_1: full_adder port map(r_L1_0(28), r_L1_1(28), r_L1_2(28), r_L0_1(28), r_L0_0(29));
--
FH_L0_29_1: full_adder port map(r_L1_0(29), r_L1_1(29), r_L1_2(29), r_L0_1(29), r_L0_0(30));
--
FH_L0_30_1: full_adder port map(r_L1_0(30), r_L1_1(30), r_L1_2(30), r_L0_1(30), r_L0_0(31));
--
FH_L0_31_1: full_adder port map(r_L1_0(31), r_L1_1(31), r_L1_2(31), r_L0_1(31), r_L0_0(32));
--
FH_L0_32_1: full_adder port map(r_L1_0(32), r_L1_1(32), r_L1_2(32), r_L0_1(32), r_L0_0(33));
--
FH_L0_33_1: full_adder port map(r_L1_0(33), r_L1_1(33), r_L1_2(33), r_L0_1(33), r_L0_0(34));
--
FH_L0_34_1: full_adder port map(r_L1_0(34), r_L1_1(34), r_L1_2(34), r_L0_1(34), r_L0_0(35));
--
FH_L0_35_1: full_adder port map(r_L1_0(35), r_L1_1(35), r_L1_2(35), r_L0_1(35), r_L0_0(36));
--
FH_L0_36_1: full_adder port map(r_L1_0(36), r_L1_1(36), r_L1_2(36), r_L0_1(36), r_L0_0(37));
--
FH_L0_37_1: full_adder port map(r_L1_0(37), r_L1_1(37), r_L1_2(37), r_L0_1(37), r_L0_0(38));
--
FH_L0_38_1: full_adder port map(r_L1_0(38), r_L1_1(38), r_L1_2(38), r_L0_1(38), r_L0_0(39));
--
FH_L0_39_1: full_adder port map(r_L1_0(39), r_L1_1(39), r_L1_2(39), r_L0_1(39), r_L0_0(40));
--
FH_L0_40_1: full_adder port map(r_L1_0(40), r_L1_1(40), r_L1_2(40), r_L0_1(40), r_L0_0(41));
--
FH_L0_41_1: full_adder port map(r_L1_0(41), r_L1_1(41), r_L1_2(41), r_L0_1(41), r_L0_0(42));
--
FH_L0_42_1: full_adder port map(r_L1_0(42), r_L1_1(42), r_L1_2(42), r_L0_1(42), r_L0_0(43));
--
FH_L0_43_1: full_adder port map(r_L1_0(43), r_L1_1(43), r_L1_2(43), r_L0_1(43), r_L0_0(44));
--
FH_L0_44_1: full_adder port map(r_L1_0(44), r_L1_1(44), r_L1_2(44), r_L0_1(44), r_L0_0(45));
--
FH_L0_45_1: full_adder port map(r_L1_0(45), r_L1_1(45), r_L1_2(45), r_L0_1(45), r_L0_0(46));
--
FH_L0_46_1: full_adder port map(r_L1_0(46), r_L1_1(46), r_L1_2(46), r_L0_1(46), r_L0_0(47));
--
FH_L0_47_1: full_adder port map(r_L1_0(47), r_L1_1(47), r_L1_2(47), r_L0_1(47));
--
Z <=  std_logic_vector(unsigned(r_L0_0) + unsigned(r_L0_1));

end architecture arch;