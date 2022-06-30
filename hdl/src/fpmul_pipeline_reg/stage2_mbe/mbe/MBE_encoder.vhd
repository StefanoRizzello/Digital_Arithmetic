-------------------------------------------------------------------------------
-- Title      : MBE encoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : MBE_encoder.vhd
-- Author     : wackoz  <wackoz@wT14>
-- Company    : 
-- Created    : 2021-11-25
-- Last update: 2021-12-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Encoder for MBE multiplier
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-11-25  1.0      wackoz  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------------

entity MBE_encoder is
  generic(N : integer := 16);
  port (
    triplet : in  std_logic_vector(2 downto 0);
    A       : in  std_logic_vector(N-1 downto 0);  -- input A
    P       : out std_logic_vector(N downto 0);    -- Partialproduct output
    sign    : out std_logic);
end entity MBE_encoder;

-------------------------------------------------------------------------------
-- Table of conversion for triplets:
-- 000:0
-- 001:+a
-- 010:+a
-- 011:+2a
-- 100:-2a
-- 101:-a
-- 110:-a
-- 111:0
-------------------------------------------------------------------------------
architecture str of MBE_encoder is
  signal Q                                   : std_logic_vector(N downto 0);  --|P|
  signal MSB_triplet_ext, zeros : std_logic_vector(N downto 0);

begin  -- architecture str

  MSB_triplet_ext <= (others => triplet(2));
  zeros           <= (others => '0');

  Q <= zeros when (not((triplet(1) xor triplet(0)) or (triplet(2) xor triplet(1)))) = '1' else
       ('0'&A) when (triplet(1) xor triplet(0)) = '1' else
       (A&'0') when (not(triplet(1) xor triplet(0)) and (triplet(2) xor triplet(1))) = '1' else
       (others => 'X');

  P    <= std_logic_vector(Q xor MSB_triplet_ext);
  sign <= triplet(2);

end architecture str;

-------------------------------------------------------------------------------
