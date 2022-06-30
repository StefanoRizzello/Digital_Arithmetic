-------------------------------------------------------------------------------
-- Title      : Testbench for design "MBE_multiplier"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : MBE_multiplier_tb.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2021-12-01
-- Last update: 2021-12-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-12-01  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity MBE_multiplier_tb is

end entity MBE_multiplier_tb;

-------------------------------------------------------------------------------

architecture arch of MBE_multiplier_tb is

  -- component ports
  signal A : std_logic_vector(32-1 downto 0);
  signal B : std_logic_vector(32-1 downto 0);
  signal Z : std_logic_vector(64-1 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture arch

  -- component instantiation
  DUT : entity work.MBE_multiplier
    port map (
      A => A,
      B => B,
      Z => Z);

  -- clock generation

  -- waveform generation
    A <= std_logic_vector(to_unsigned(8678393, A'length));
    B <= std_logic_vector(to_unsigned(8632129,B'length));



end architecture arch;

-------------------------------------------------------------------------------

configuration MBE_multiplier_tb_arch_cfg of MBE_multiplier_tb is
  for arch
  end for;
end MBE_multiplier_tb_arch_cfg;

-------------------------------------------------------------------------------
