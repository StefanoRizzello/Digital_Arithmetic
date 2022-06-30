-- VHDL Entity HAVOC.FPmul_stage2.interface
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

entity FPmul_stage2 is
  port(
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

-- Declarations

end FPmul_stage2;

--
-- VHDL Architecture HAVOC.FPmul_stage2.struct
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


architecture struct of FPmul_stage2 is

  -- Architecture declarations

  -- Internal signal declarations
  signal EXP_in_int          : std_logic_vector(7 downto 0);
  signal EXP_neg_int         : std_logic;
  signal EXP_pos_int         : std_logic;
  signal SIG_in_int          : std_logic_vector(27 downto 0);
  signal EXP_in_int_tmp      : std_logic_vector(7 downto 0);
  signal EXP_neg_int_tmp     : std_logic;
  signal EXP_pos_int_tmp     : std_logic;
  signal SIG_in_int_tmp      : std_logic_vector(27 downto 0);
  signal isINF_stage1_tmp    : std_logic;
  signal isNaN_stage1_tmp    : std_logic;
  signal isZ_tab_stage1_tmp  : std_logic;
  signal SIGN_out_stage1_tmp : std_logic;
  signal dout                : std_logic;
  signal dout1               : std_logic_vector(7 downto 0);
  signal prod                : std_logic_vector(63 downto 0);

  component reg is
    generic (
      N : integer);
    port (
      D                    : in  std_logic_vector(N - 1 downto 0);
      clock, reset, enable : in  std_logic;
      Q                    : out std_logic_vector(N - 1 downto 0));
  end component reg;

  component ff is
    port (
      D                    : in  std_logic;
      clock, reset, enable : in  std_logic;
      Q                    : out std_logic);
  end component ff;

begin
  -- Architecture concurrent statements
  -- HDL Embedded Text Block 1 sig
  -- eb1 1
  SIG_in_int <= prod(47 downto 20);

  -- HDL Embedded Text Block 2 inv
  -- eb5 5
  EXP_in_int <= (not dout1(7)) & dout1(6 downto 0);

  -- HDL Embedded Text Block 3 latch
  -- eb2 2

  process(clk)
  begin
    if RISING_EDGE(clk) then
      EXP_in         <= EXP_in_int_tmp;
      SIG_in         <= SIG_in_int_tmp;
      EXP_pos_stage2 <= EXP_pos_int_tmp;
      EXP_neg_stage2 <= EXP_neg_int_tmp;
    end if;
  end process;

  -- HDL Embedded Text Block 4 latch2
  -- latch2 4
  process(clk)
  begin
    if RISING_EDGE(clk) then
      isINF_stage2    <= isINF_stage1_tmp;
      isNaN_stage2    <= isNaN_stage1_tmp;
      isZ_tab_stage2  <= isZ_tab_stage1_tmp;
      SIGN_out_stage2 <= SIGN_out_stage1_tmp;
    end if;
  end process;

  -- HDL Embedded Text Block 5 eb1
  -- exp_pos 5
  EXP_pos_int <= A_EXP(7) and B_EXP(7);
--   EXP_neg_int <= NOT(A_EXP(7) OR B_EXP(7));
  EXP_neg_int <= '1' when ((A_EXP(7) = '0' and not (A_EXP = X"7F")) and (B_EXP(7) = '0' and not (B_EXP = X"7F"))) else '0';


  -- ModuleWare code(v1.1) for instance 'I4' of 'add'
  I4combo : process (A_EXP, B_EXP, dout)
    variable mw_I4t0    : std_logic_vector(8 downto 0);
    variable mw_I4t1    : std_logic_vector(8 downto 0);
    variable mw_I4sum   : unsigned(8 downto 0);
    variable mw_I4carry : std_logic;
  begin
    mw_I4t0    := '0' & A_EXP;
    mw_I4t1    := '0' & B_EXP;
    mw_I4carry := dout;
    mw_I4sum   := unsigned(mw_I4t0) + unsigned(mw_I4t1) + mw_I4carry;
    dout1      <= conv_std_logic_vector(mw_I4sum(7 downto 0), 8);
  end process I4combo;

  -- ModuleWare code(v1.1) for instance 'I2' of 'mult'
  I2combo : process (A_SIG, B_SIG)
    variable dtemp : unsigned(63 downto 0);
  begin
    dtemp := (unsigned(A_SIG) * unsigned(B_SIG));
    prod  <= std_logic_vector(dtemp);
  end process I2combo;

  -- ModuleWare code(v1.1) for instance 'I6' of 'vdd'
  dout <= '1';

  -- Instance port mappings.

  -- instance "ff_1"
  ff_sign : entity work.ff
    port map (
      D      => SIGN_out_stage1,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => SIGN_out_stage1_tmp);

  -- instance "ff_tmp"
  ff_exp_neg : entity work.ff
    port map (
      D      => EXP_neg_int,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => EXP_neg_int_tmp);

  -- instance "ff_3"
  ff_exp_pos : entity work.ff
    port map (
      D      => EXP_pos_int,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => EXP_pos_int_tmp);

  -- instance "ff_4"
  ff_inf : entity work.ff
    port map (
      D      => isINF_stage1,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => isINF_stage1_tmp);

  -- instance "ff_5"
  ff_nan : entity work.ff
    port map (
      D      => isNaN_stage1,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => isNaN_stage1_tmp);

  -- instance "ff_6"
  ff_z_tab : entity work.ff
    port map (
      D      => isZ_tab_stage1,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => isZ_tab_stage1_tmp);

  -- instance "reg_1"
  reg_out_mul : entity work.reg
    generic map (
      N => 28)
    port map (
      D      => SIG_in_int,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => SIG_in_int_tmp);

  -- instance "reg_2"
  reg_out_add: entity work.reg
    generic map (
      N => 8)
    port map (
      D      => EXP_in_int,
      clock  => clk,
      reset  => '1',
      enable => '1',
      Q      => EXP_in_int_tmp);

end struct;
