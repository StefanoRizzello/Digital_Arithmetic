-- VHDL Entity HAVOC.FPmul.symbol
--
-- Created by
-- Guillermo Marcus, gmarcus@ieee.org
-- using Mentor Graphics FPGA Advantage tools.
--
-- Visit "http://fpga.mty.itesm.mx" for more info.
--
-- 2003-2004. V1.0
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity FPmul is
  port(
    FP_A  : in  std_logic_vector (31 downto 0);
    FP_B  : in  std_logic_vector (31 downto 0);
    en    : in  std_logic;
    rst_n : in  std_logic;
    clk   : in  std_logic;
    FP_Z  : out std_logic_vector (31 downto 0)
    );

-- Declarations

end FPmul;

--
-- VHDL Architecture HAVOC.FPmul.pipeline
--
-- Created by
-- Guillermo Marcus, gmarcus@ieee.org
-- using Mentor Graphics FPGA Advantage tools.
--
-- Visit "http://fpga.mty.itesm.mx" for more info.
--
-- Copyright 2003-2004. V1.0
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

architecture pipeline of FPmul is

  -- Architecture declarations

  -- Internal signal declarations
  signal FP_A_reg_out    : std_logic_vector(31 downto 0);
  signal FP_B_reg_out    : std_logic_vector(31 downto 0);
  signal A_EXP           : std_logic_vector(7 downto 0);
  signal A_SIG           : std_logic_vector(31 downto 0);
  signal B_EXP           : std_logic_vector(7 downto 0);
  signal B_SIG           : std_logic_vector(31 downto 0);
  signal EXP_in          : std_logic_vector(7 downto 0);
  signal EXP_neg         : std_logic;
  signal EXP_neg_stage2  : std_logic;
  signal EXP_out_round   : std_logic_vector(7 downto 0);
  signal EXP_pos         : std_logic;
  signal EXP_pos_stage2  : std_logic;
  signal SIGN_out        : std_logic;
  signal SIGN_out_stage1 : std_logic;
  signal SIGN_out_stage2 : std_logic;
  signal SIG_in          : std_logic_vector(27 downto 0);
  signal SIG_out_round   : std_logic_vector(27 downto 0);
  signal isINF_stage1    : std_logic;
  signal isINF_stage2    : std_logic;
  signal isINF_tab       : std_logic;
  signal isNaN           : std_logic;
  signal isNaN_stage1    : std_logic;
  signal isNaN_stage2    : std_logic;
  signal isZ_tab         : std_logic;
  signal isZ_tab_stage1  : std_logic;
  signal isZ_tab_stage2  : std_logic;


  -- Component Declarations
  component FPmul_stage1
    port (
      FP_A            : in  std_logic_vector (31 downto 0);
      FP_B            : in  std_logic_vector (31 downto 0);
      clk             : in  std_logic;
      A_EXP           : out std_logic_vector (7 downto 0);
      A_SIG           : out std_logic_vector (31 downto 0);
      B_EXP           : out std_logic_vector (7 downto 0);
      B_SIG           : out std_logic_vector (31 downto 0);
      SIGN_out_stage1 : out std_logic;
      isINF_stage1    : out std_logic;
      isNaN_stage1    : out std_logic;
      isZ_tab_stage1  : out std_logic
      );
  end component;
  component FPmul_stage2
    port (
      A_EXP           : in  std_logic_vector (7 downto 0);
      A_SIG           : in  std_logic_vector (31 downto 0);
      B_EXP           : in  std_logic_vector (7 downto 0);
      B_SIG           : in  std_logic_vector (31 downto 0);
      SIGN_out_stage1 : in  std_logic;
      clk             : in  std_logic;
      isINF_stage1    : in  std_logic;
      isNaN_stage1    : in  std_logic;
      isZ_tab_stage1  : in  std_logic;
      EXP_in          : out std_logic_vector (7 downto 0);
      EXP_neg_stage2  : out std_logic;
      EXP_pos_stage2  : out std_logic;
      SIGN_out_stage2 : out std_logic;
      SIG_in          : out std_logic_vector (27 downto 0);
      isINF_stage2    : out std_logic;
      isNaN_stage2    : out std_logic;
      isZ_tab_stage2  : out std_logic
      );
  end component;
  component FPmul_stage3
    port (
      EXP_in          : in  std_logic_vector (7 downto 0);
      EXP_neg_stage2  : in  std_logic;
      EXP_pos_stage2  : in  std_logic;
      SIGN_out_stage2 : in  std_logic;
      SIG_in          : in  std_logic_vector (27 downto 0);
      clk             : in  std_logic;
      isINF_stage2    : in  std_logic;
      isNaN_stage2    : in  std_logic;
      isZ_tab_stage2  : in  std_logic;
      EXP_neg         : out std_logic;
      EXP_out_round   : out std_logic_vector (7 downto 0);
      EXP_pos         : out std_logic;
      SIGN_out        : out std_logic;
      SIG_out_round   : out std_logic_vector (27 downto 0);
      isINF_tab       : out std_logic;
      isNaN           : out std_logic;
      isZ_tab         : out std_logic
      );
  end component;
  component FPmul_stage4
    port (
      EXP_neg       : in  std_logic;
      EXP_out_round : in  std_logic_vector (7 downto 0);
      EXP_pos       : in  std_logic;
      SIGN_out      : in  std_logic;
      SIG_out_round : in  std_logic_vector (27 downto 0);
      clk           : in  std_logic;
      isINF_tab     : in  std_logic;
      isNaN         : in  std_logic;
      isZ_tab       : in  std_logic;
      FP_Z          : out std_logic_vector (31 downto 0)
      );
  end component;

  -- Optional embedded configurations
  -- pragma synthesis_off
  for all : FPmul_stage1 use entity work.FPmul_stage1;
  for all : FPmul_stage2 use entity work.FPmul_stage2;
  for all : FPmul_stage3 use entity work.FPmul_stage3;
  for all : FPmul_stage4 use entity work.FPmul_stage4;
  -- pragma synthesis_on


begin

  -- Instance port mappings.
  I1 : FPmul_stage1
    port map (
      FP_A            => FP_A_reg_out,
      FP_B            => FP_B_reg_out,
      clk             => clk,
      A_EXP           => A_EXP,
      A_SIG           => A_SIG,
      B_EXP           => B_EXP,
      B_SIG           => B_SIG,
      SIGN_out_stage1 => SIGN_out_stage1,
      isINF_stage1    => isINF_stage1,
      isNaN_stage1    => isNaN_stage1,
      isZ_tab_stage1  => isZ_tab_stage1
      );
  I2 : FPmul_stage2
    port map (
      A_EXP           => A_EXP,
      A_SIG           => A_SIG,
      B_EXP           => B_EXP,
      B_SIG           => B_SIG,
      SIGN_out_stage1 => SIGN_out_stage1,
      clk             => clk,
      isINF_stage1    => isINF_stage1,
      isNaN_stage1    => isNaN_stage1,
      isZ_tab_stage1  => isZ_tab_stage1,
      EXP_in          => EXP_in,
      EXP_neg_stage2  => EXP_neg_stage2,
      EXP_pos_stage2  => EXP_pos_stage2,
      SIGN_out_stage2 => SIGN_out_stage2,
      SIG_in          => SIG_in,
      isINF_stage2    => isINF_stage2,
      isNaN_stage2    => isNaN_stage2,
      isZ_tab_stage2  => isZ_tab_stage2
      );
  I3 : FPmul_stage3
    port map (
      EXP_in          => EXP_in,
      EXP_neg_stage2  => EXP_neg_stage2,
      EXP_pos_stage2  => EXP_pos_stage2,
      SIGN_out_stage2 => SIGN_out_stage2,
      SIG_in          => SIG_in,
      clk             => clk,
      isINF_stage2    => isINF_stage2,
      isNaN_stage2    => isNaN_stage2,
      isZ_tab_stage2  => isZ_tab_stage2,
      EXP_neg         => EXP_neg,
      EXP_out_round   => EXP_out_round,
      EXP_pos         => EXP_pos,
      SIGN_out        => SIGN_out,
      SIG_out_round   => SIG_out_round,
      isINF_tab       => isINF_tab,
      isNaN           => isNaN,
      isZ_tab         => isZ_tab
      );
  I4 : FPmul_stage4
    port map (
      EXP_neg       => EXP_neg,
      EXP_out_round => EXP_out_round,
      EXP_pos       => EXP_pos,
      SIGN_out      => SIGN_out,
      SIG_out_round => SIG_out_round,
      clk           => clk,
      isINF_tab     => isINF_tab,
      isNaN         => isNaN,
      isZ_tab       => isZ_tab,
      FP_Z          => FP_Z
      );

  -- instance "reg_1"
  reg_A : entity work.reg
    generic map (
      N => 32)
    port map (
      D      => FP_A,
      clock  => clk,
      reset  => rst_n,
      enable => '1',
      Q      => FP_A_reg_out);

  -- instance "reg_2"
  reg_B : entity work.reg
    generic map (
      N => 32)
    port map (
      D      => FP_B,
      clock  => clk,
      reset  => rst_n,
      enable => '1',
      Q      => FP_B_reg_out);

end pipeline;
