-------------------------------------------------------------------------------
-- Title      : Testbench for design "MBE_encoder"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : MBE_encoder_tb.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2021-11-25
-- Last update: 2021-11-29
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-11-25  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-------------------------------------------------------------------------------

entity MBE_encoder_tb is

end entity MBE_encoder_tb;

-------------------------------------------------------------------------------

architecture str of MBE_encoder_tb is

  -- component ports
  signal triplet : std_logic_vector(2 downto 0) := "111";
  signal EOF     : std_logic                    := '0';
  signal clk     : std_logic                    := '0';
  signal A       : std_logic_vector(7 downto 0);
  signal P       : std_logic_vector(8 downto 0);
  signal P_int   : integer;             -- integer to print
  signal A_int   : integer;             -- integer to print
begin

  DUT : entity work.MBE_encoder
    generic map (
      N => 8)
    port map (
      triplet => triplet,
      A       => A,
      P       => P);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- P,A integer gen
  -- read file
  READ_Proc : process(clk)
    file fp      : text open read_mode is "../tb/data/MBE_encoder_input.dat";
    variable ptr : line;
    variable val : std_logic_vector(7 downto 0);
  begin
    if(Clk'event and clk = '1') then
      if(not(endfile(fp))) then
        readline(fp, ptr);
        read(ptr, val);
        A <= val;
      else
        EOF <= '1';
      end if;
    end if;
  end process READ_Proc;

  WRITE_Proc : process(clk)
    file res_fp       : text open write_mode is "../tb/data/MBE_encoder_output_111.dat";
    variable line_out : line;
  begin  -- process
    if CLK'event and CLK = '1' and EOF = '0' then  -- rising clock edge
      write(line_out, P);
      writeline(res_fp, line_out);
    end if;
  end process WRITE_Proc;

end architecture str;

-------------------------------------------------------------------------------

configuration MBE_encoder_tb_str_cfg of MBE_encoder_tb is
  for str
  end for;
end MBE_encoder_tb_str_cfg;

-------------------------------------------------------------------------------
