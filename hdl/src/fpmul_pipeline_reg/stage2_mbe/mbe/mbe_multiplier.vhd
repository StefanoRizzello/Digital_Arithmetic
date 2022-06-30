-- Generated .vhd for MBE 24x24multiplication

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MBE_multiplier is

	port (
		A	: in  std_logic_vector(24-1 downto 0);	-- input A
		B	: in  std_logic_vector(24-1 downto 0);	-- input B
		Z	: out  std_logic_vector(48-1 downto 0));	-- output Z

end entity MBE_multiplier;

architecture arch of MBE_multiplier is

-- SIGNALS
signal B_ext : std_logic_vector(24-1+3 downto 0);

signal par_pro_0, par_pro_1, par_pro_2, par_pro_3, par_pro_4, par_pro_5, par_pro_6, par_pro_7, par_pro_8, par_pro_9, par_pro_10, par_pro_11, par_pro_12 : std_logic_vector(24 downto 0);

signal par_pro_EXT_0 : std_logic_vector(27 downto 0);
signal par_pro_EXT_1, par_pro_EXT_2, par_pro_EXT_3, par_pro_EXT_4, par_pro_EXT_5, par_pro_EXT_6, par_pro_EXT_7, par_pro_EXT_8, par_pro_EXT_9, par_pro_EXT_10 : std_logic_vector(28 downto 0);
signal par_pro_EXT_11 : std_logic_vector(27 downto 0);
signal par_pro_EXT_12 : std_logic_vector(26 downto 0);

signal triplet_0, triplet_1, triplet_2, triplet_3, triplet_4, triplet_5, triplet_6, triplet_7, triplet_8, triplet_9, triplet_10, triplet_11, triplet_12 : std_logic_vector(2 downto 0);

-- COMPONENTS
component MBE_encoder is
generic (
N : integer);
port (
triplet : in  std_logic_vector(2 downto 0);
A       : in  std_logic_vector(N-1 downto 0);
P       : out std_logic_vector(N downto 0));
end component MBE_encoder;

component dadda_tree is
	port (
	Pp_0 : std_logic_vector(27 downto 0);
	Pp_1, Pp_2, Pp_3, Pp_4, Pp_5, Pp_6, Pp_7, Pp_8, Pp_9, Pp_10 : in std_logic_vector(28 downto 0);
	Pp_11 : in std_logic_vector(27 downto 0);
	Pp_12 : in std_logic_vector(26 downto 0);
	Z		: out std_logic_vector(48-1 downto 0));	-- output Z

end component dadda_tree;

begin
mbe_enc0:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_0,A=>A,P=>par_pro_0);
mbe_enc1:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_1,A=>A,P=>par_pro_1);
mbe_enc2:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_2,A=>A,P=>par_pro_2);
mbe_enc3:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_3,A=>A,P=>par_pro_3);
mbe_enc4:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_4,A=>A,P=>par_pro_4);
mbe_enc5:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_5,A=>A,P=>par_pro_5);
mbe_enc6:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_6,A=>A,P=>par_pro_6);
mbe_enc7:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_7,A=>A,P=>par_pro_7);
mbe_enc8:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_8,A=>A,P=>par_pro_8);
mbe_enc9:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_9,A=>A,P=>par_pro_9);
mbe_enc10:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_10,A=>A,P=>par_pro_10);
mbe_enc11:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_11,A=>A,P=>par_pro_11);
mbe_enc12:	 mbe_encoder generic map(N => 24) port map (triplet=>triplet_12,A=>A,P=>par_pro_12);

dadda_tree_imp:	 dadda_tree port map( Par_pro_EXT_0, Par_pro_EXT_1, Par_pro_EXT_2, Par_pro_EXT_3, Par_pro_EXT_4, Par_pro_EXT_5, Par_pro_EXT_6, Par_pro_EXT_7, Par_pro_EXT_8, Par_pro_EXT_9, Par_pro_EXT_10, Par_pro_EXT_11, Par_pro_EXT_12, Z);

-- SIGNAL ASSOCIATIONS
B_ext <= "00"&B&'0';

triplet_0<=B_ext(2)&B_ext(1)&B_ext(0);
triplet_1<=B_ext(4)&B_ext(3)&B_ext(2);
triplet_2<=B_ext(6)&B_ext(5)&B_ext(4);
triplet_3<=B_ext(8)&B_ext(7)&B_ext(6);
triplet_4<=B_ext(10)&B_ext(9)&B_ext(8);
triplet_5<=B_ext(12)&B_ext(11)&B_ext(10);
triplet_6<=B_ext(14)&B_ext(13)&B_ext(12);
triplet_7<=B_ext(16)&B_ext(15)&B_ext(14);
triplet_8<=B_ext(18)&B_ext(17)&B_ext(16);
triplet_9<=B_ext(20)&B_ext(19)&B_ext(18);
triplet_10<=B_ext(22)&B_ext(21)&B_ext(20);
triplet_11<=B_ext(24)&B_ext(23)&B_ext(22);
triplet_12<=B_ext(26)&B_ext(25)&B_ext(24);


Par_pro_EXT_0<=not(triplet_0(2))&triplet_0(2)&triplet_0(2)&Par_pro_0;
Par_pro_EXT_1<='1'&not(triplet_1(2))&Par_pro_1&'0'&triplet_0(2);
Par_pro_EXT_2<='1'&not(triplet_2(2))&Par_pro_2&'0'&triplet_1(2);
Par_pro_EXT_3<='1'&not(triplet_3(2))&Par_pro_3&'0'&triplet_2(2);
Par_pro_EXT_4<='1'&not(triplet_4(2))&Par_pro_4&'0'&triplet_3(2);
Par_pro_EXT_5<='1'&not(triplet_5(2))&Par_pro_5&'0'&triplet_4(2);
Par_pro_EXT_6<='1'&not(triplet_6(2))&Par_pro_6&'0'&triplet_5(2);
Par_pro_EXT_7<='1'&not(triplet_7(2))&Par_pro_7&'0'&triplet_6(2);
Par_pro_EXT_8<='1'&not(triplet_8(2))&Par_pro_8&'0'&triplet_7(2);
Par_pro_EXT_9<='1'&not(triplet_9(2))&Par_pro_9&'0'&triplet_8(2);
Par_pro_EXT_10<='1'&not(triplet_10(2))&Par_pro_10&'0'&triplet_9(2);
Par_pro_EXT_11<=not(triplet_11(2))&Par_pro_11&'0'&triplet_10(2);
Par_pro_EXT_12<=Par_pro_12&'0'&triplet_11(2);

end architecture arch;