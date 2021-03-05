-------------------------------------------------------------------------------
-- microblaze_0_bram_block_elaborate.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity microblaze_0_bram_block_elaborate is
  generic (
    C_MEMSIZE : integer;
    C_PORT_DWIDTH : integer;
    C_PORT_AWIDTH : integer;
    C_NUM_WE : integer;
    C_FAMILY : string
    );
  port (
    BRAM_Rst_A : in std_logic;
    BRAM_Clk_A : in std_logic;
    BRAM_EN_A : in std_logic;
    BRAM_WEN_A : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_A : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_A : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_A : in std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Rst_B : in std_logic;
    BRAM_Clk_B : in std_logic;
    BRAM_EN_B : in std_logic;
    BRAM_WEN_B : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_B : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_B : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_B : in std_logic_vector(0 to C_PORT_DWIDTH-1)
  );

  attribute keep_hierarchy : STRING;
  attribute keep_hierarchy of microblaze_0_bram_block_elaborate : entity is "yes";

end microblaze_0_bram_block_elaborate;

architecture STRUCTURE of microblaze_0_bram_block_elaborate is

  component RAMB36E1 is
    generic (
      WRITE_MODE_A : string;
      WRITE_MODE_B : string;
      INIT_FILE : string;
      READ_WIDTH_A : integer;
      READ_WIDTH_B : integer;
      WRITE_WIDTH_A : integer;
      WRITE_WIDTH_B : integer;
      RAM_EXTENSION_A : string;
      RAM_EXTENSION_B : string
    );
    port (
      DBITERR : out std_logic;
      ECCPARITY : out std_logic_vector(7 downto 0);
      INJECTDBITERR : in std_logic;
      INJECTSBITERR : in std_logic;
      RDADDRECC : out std_logic_vector(8 downto 0);
      SBITERR : out std_logic;
      ADDRARDADDR : in std_logic_vector(15 downto 0);
      CASCADEINA : in std_logic;
      CASCADEOUTA : out std_logic;
      CLKARDCLK : in std_logic;
      DIADI : in std_logic_vector(31 downto 0);
      DIPADIP : in std_logic_vector(3 downto 0);
      DOADO : out std_logic_vector(31 downto 0);
      DOPADOP : out std_logic_vector(3 downto 0);
      ENARDEN : in std_logic;
      REGCEAREGCE : in std_logic;
      RSTRAMARSTRAM : in std_logic;
      RSTREGARSTREG : in std_logic;
      WEA : in std_logic_vector(3 downto 0);
      ADDRBWRADDR : in std_logic_vector(15 downto 0);
      CASCADEINB : in std_logic;
      CASCADEOUTB : out std_logic;
      CLKBWRCLK : in std_logic;
      DIBDI : in std_logic_vector(31 downto 0);
      DIPBDIP : in std_logic_vector(3 downto 0);
      DOBDO : out std_logic_vector(31 downto 0);
      DOPBDOP : out std_logic_vector(3 downto 0);
      ENBWREN : in std_logic;
      REGCEB : in std_logic;
      RSTRAMB : in std_logic;
      RSTREGB : in std_logic;
      WEBWE : in std_logic_vector(7 downto 0)
    );
  end component;

  attribute BMM_INFO : STRING;

  attribute BMM_INFO of ramb36e1_0: label is " ";
  attribute BMM_INFO of ramb36e1_1: label is " ";
  attribute BMM_INFO of ramb36e1_2: label is " ";
  attribute BMM_INFO of ramb36e1_3: label is " ";
  attribute BMM_INFO of ramb36e1_4: label is " ";
  attribute BMM_INFO of ramb36e1_5: label is " ";
  attribute BMM_INFO of ramb36e1_6: label is " ";
  attribute BMM_INFO of ramb36e1_7: label is " ";
  -- Internal signals

  signal net_gnd0 : std_logic;
  signal net_gnd4 : std_logic_vector(3 downto 0);
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 1);
  signal pgassign3 : std_logic_vector(0 to 27);
  signal pgassign4 : std_logic_vector(0 to 3);
  signal pgassign5 : std_logic_vector(15 downto 0);
  signal pgassign6 : std_logic_vector(31 downto 0);
  signal pgassign7 : std_logic_vector(31 downto 0);
  signal pgassign8 : std_logic_vector(3 downto 0);
  signal pgassign9 : std_logic_vector(15 downto 0);
  signal pgassign10 : std_logic_vector(31 downto 0);
  signal pgassign11 : std_logic_vector(31 downto 0);
  signal pgassign12 : std_logic_vector(7 downto 0);
  signal pgassign13 : std_logic_vector(15 downto 0);
  signal pgassign14 : std_logic_vector(31 downto 0);
  signal pgassign15 : std_logic_vector(31 downto 0);
  signal pgassign16 : std_logic_vector(3 downto 0);
  signal pgassign17 : std_logic_vector(15 downto 0);
  signal pgassign18 : std_logic_vector(31 downto 0);
  signal pgassign19 : std_logic_vector(31 downto 0);
  signal pgassign20 : std_logic_vector(7 downto 0);
  signal pgassign21 : std_logic_vector(15 downto 0);
  signal pgassign22 : std_logic_vector(31 downto 0);
  signal pgassign23 : std_logic_vector(31 downto 0);
  signal pgassign24 : std_logic_vector(3 downto 0);
  signal pgassign25 : std_logic_vector(15 downto 0);
  signal pgassign26 : std_logic_vector(31 downto 0);
  signal pgassign27 : std_logic_vector(31 downto 0);
  signal pgassign28 : std_logic_vector(7 downto 0);
  signal pgassign29 : std_logic_vector(15 downto 0);
  signal pgassign30 : std_logic_vector(31 downto 0);
  signal pgassign31 : std_logic_vector(31 downto 0);
  signal pgassign32 : std_logic_vector(3 downto 0);
  signal pgassign33 : std_logic_vector(15 downto 0);
  signal pgassign34 : std_logic_vector(31 downto 0);
  signal pgassign35 : std_logic_vector(31 downto 0);
  signal pgassign36 : std_logic_vector(7 downto 0);
  signal pgassign37 : std_logic_vector(15 downto 0);
  signal pgassign38 : std_logic_vector(31 downto 0);
  signal pgassign39 : std_logic_vector(31 downto 0);
  signal pgassign40 : std_logic_vector(3 downto 0);
  signal pgassign41 : std_logic_vector(15 downto 0);
  signal pgassign42 : std_logic_vector(31 downto 0);
  signal pgassign43 : std_logic_vector(31 downto 0);
  signal pgassign44 : std_logic_vector(7 downto 0);
  signal pgassign45 : std_logic_vector(15 downto 0);
  signal pgassign46 : std_logic_vector(31 downto 0);
  signal pgassign47 : std_logic_vector(31 downto 0);
  signal pgassign48 : std_logic_vector(3 downto 0);
  signal pgassign49 : std_logic_vector(15 downto 0);
  signal pgassign50 : std_logic_vector(31 downto 0);
  signal pgassign51 : std_logic_vector(31 downto 0);
  signal pgassign52 : std_logic_vector(7 downto 0);
  signal pgassign53 : std_logic_vector(15 downto 0);
  signal pgassign54 : std_logic_vector(31 downto 0);
  signal pgassign55 : std_logic_vector(31 downto 0);
  signal pgassign56 : std_logic_vector(3 downto 0);
  signal pgassign57 : std_logic_vector(15 downto 0);
  signal pgassign58 : std_logic_vector(31 downto 0);
  signal pgassign59 : std_logic_vector(31 downto 0);
  signal pgassign60 : std_logic_vector(7 downto 0);
  signal pgassign61 : std_logic_vector(15 downto 0);
  signal pgassign62 : std_logic_vector(31 downto 0);
  signal pgassign63 : std_logic_vector(31 downto 0);
  signal pgassign64 : std_logic_vector(3 downto 0);
  signal pgassign65 : std_logic_vector(15 downto 0);
  signal pgassign66 : std_logic_vector(31 downto 0);
  signal pgassign67 : std_logic_vector(31 downto 0);
  signal pgassign68 : std_logic_vector(7 downto 0);

begin

  -- Internal assignments

  pgassign1(0 to 0) <= B"1";
  pgassign2(0 to 1) <= B"00";
  pgassign3(0 to 27) <= B"0000000000000000000000000000";
  pgassign4(0 to 3) <= B"0000";
  pgassign5(15 downto 15) <= B"1";
  pgassign5(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign5(1 downto 0) <= B"00";
  pgassign6(31 downto 4) <= B"0000000000000000000000000000";
  pgassign6(3 downto 0) <= BRAM_Dout_A(0 to 3);
  BRAM_Din_A(0 to 3) <= pgassign7(3 downto 0);
  pgassign8(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign8(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign8(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign8(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign9(15 downto 15) <= B"1";
  pgassign9(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign9(1 downto 0) <= B"00";
  pgassign10(31 downto 4) <= B"0000000000000000000000000000";
  pgassign10(3 downto 0) <= BRAM_Dout_B(0 to 3);
  BRAM_Din_B(0 to 3) <= pgassign11(3 downto 0);
  pgassign12(7 downto 4) <= B"0000";
  pgassign12(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign12(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign12(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign12(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign13(15 downto 15) <= B"1";
  pgassign13(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign13(1 downto 0) <= B"00";
  pgassign14(31 downto 4) <= B"0000000000000000000000000000";
  pgassign14(3 downto 0) <= BRAM_Dout_A(4 to 7);
  BRAM_Din_A(4 to 7) <= pgassign15(3 downto 0);
  pgassign16(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign16(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign16(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign16(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign17(15 downto 15) <= B"1";
  pgassign17(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign17(1 downto 0) <= B"00";
  pgassign18(31 downto 4) <= B"0000000000000000000000000000";
  pgassign18(3 downto 0) <= BRAM_Dout_B(4 to 7);
  BRAM_Din_B(4 to 7) <= pgassign19(3 downto 0);
  pgassign20(7 downto 4) <= B"0000";
  pgassign20(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign20(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign20(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign20(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign21(15 downto 15) <= B"1";
  pgassign21(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign21(1 downto 0) <= B"00";
  pgassign22(31 downto 4) <= B"0000000000000000000000000000";
  pgassign22(3 downto 0) <= BRAM_Dout_A(8 to 11);
  BRAM_Din_A(8 to 11) <= pgassign23(3 downto 0);
  pgassign24(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign24(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign24(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign24(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign25(15 downto 15) <= B"1";
  pgassign25(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign25(1 downto 0) <= B"00";
  pgassign26(31 downto 4) <= B"0000000000000000000000000000";
  pgassign26(3 downto 0) <= BRAM_Dout_B(8 to 11);
  BRAM_Din_B(8 to 11) <= pgassign27(3 downto 0);
  pgassign28(7 downto 4) <= B"0000";
  pgassign28(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign28(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign28(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign28(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign29(15 downto 15) <= B"1";
  pgassign29(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign29(1 downto 0) <= B"00";
  pgassign30(31 downto 4) <= B"0000000000000000000000000000";
  pgassign30(3 downto 0) <= BRAM_Dout_A(12 to 15);
  BRAM_Din_A(12 to 15) <= pgassign31(3 downto 0);
  pgassign32(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign32(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign32(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign32(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign33(15 downto 15) <= B"1";
  pgassign33(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign33(1 downto 0) <= B"00";
  pgassign34(31 downto 4) <= B"0000000000000000000000000000";
  pgassign34(3 downto 0) <= BRAM_Dout_B(12 to 15);
  BRAM_Din_B(12 to 15) <= pgassign35(3 downto 0);
  pgassign36(7 downto 4) <= B"0000";
  pgassign36(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign36(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign36(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign36(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign37(15 downto 15) <= B"1";
  pgassign37(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign37(1 downto 0) <= B"00";
  pgassign38(31 downto 4) <= B"0000000000000000000000000000";
  pgassign38(3 downto 0) <= BRAM_Dout_A(16 to 19);
  BRAM_Din_A(16 to 19) <= pgassign39(3 downto 0);
  pgassign40(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign40(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign40(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign40(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign41(15 downto 15) <= B"1";
  pgassign41(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign41(1 downto 0) <= B"00";
  pgassign42(31 downto 4) <= B"0000000000000000000000000000";
  pgassign42(3 downto 0) <= BRAM_Dout_B(16 to 19);
  BRAM_Din_B(16 to 19) <= pgassign43(3 downto 0);
  pgassign44(7 downto 4) <= B"0000";
  pgassign44(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign44(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign44(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign44(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign45(15 downto 15) <= B"1";
  pgassign45(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign45(1 downto 0) <= B"00";
  pgassign46(31 downto 4) <= B"0000000000000000000000000000";
  pgassign46(3 downto 0) <= BRAM_Dout_A(20 to 23);
  BRAM_Din_A(20 to 23) <= pgassign47(3 downto 0);
  pgassign48(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign48(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign48(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign48(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign49(15 downto 15) <= B"1";
  pgassign49(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign49(1 downto 0) <= B"00";
  pgassign50(31 downto 4) <= B"0000000000000000000000000000";
  pgassign50(3 downto 0) <= BRAM_Dout_B(20 to 23);
  BRAM_Din_B(20 to 23) <= pgassign51(3 downto 0);
  pgassign52(7 downto 4) <= B"0000";
  pgassign52(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign52(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign52(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign52(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign53(15 downto 15) <= B"1";
  pgassign53(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign53(1 downto 0) <= B"00";
  pgassign54(31 downto 4) <= B"0000000000000000000000000000";
  pgassign54(3 downto 0) <= BRAM_Dout_A(24 to 27);
  BRAM_Din_A(24 to 27) <= pgassign55(3 downto 0);
  pgassign56(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign56(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign56(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign56(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign57(15 downto 15) <= B"1";
  pgassign57(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign57(1 downto 0) <= B"00";
  pgassign58(31 downto 4) <= B"0000000000000000000000000000";
  pgassign58(3 downto 0) <= BRAM_Dout_B(24 to 27);
  BRAM_Din_B(24 to 27) <= pgassign59(3 downto 0);
  pgassign60(7 downto 4) <= B"0000";
  pgassign60(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign60(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign60(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign60(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign61(15 downto 15) <= B"1";
  pgassign61(14 downto 2) <= BRAM_Addr_A(17 to 29);
  pgassign61(1 downto 0) <= B"00";
  pgassign62(31 downto 4) <= B"0000000000000000000000000000";
  pgassign62(3 downto 0) <= BRAM_Dout_A(28 to 31);
  BRAM_Din_A(28 to 31) <= pgassign63(3 downto 0);
  pgassign64(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign64(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign64(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign64(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign65(15 downto 15) <= B"1";
  pgassign65(14 downto 2) <= BRAM_Addr_B(17 to 29);
  pgassign65(1 downto 0) <= B"00";
  pgassign66(31 downto 4) <= B"0000000000000000000000000000";
  pgassign66(3 downto 0) <= BRAM_Dout_B(28 to 31);
  BRAM_Din_B(28 to 31) <= pgassign67(3 downto 0);
  pgassign68(7 downto 4) <= B"0000";
  pgassign68(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign68(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign68(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign68(0 downto 0) <= BRAM_WEN_B(3 to 3);
  net_gnd0 <= '0';
  net_gnd4(3 downto 0) <= B"0000";

  ramb36e1_0 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_0.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign5,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign6,
      DIPADIP => net_gnd4,
      DOADO => pgassign7,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign8,
      ADDRBWRADDR => pgassign9,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign10,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign11,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign12
    );

  ramb36e1_1 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_1.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign13,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign14,
      DIPADIP => net_gnd4,
      DOADO => pgassign15,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign16,
      ADDRBWRADDR => pgassign17,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign18,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign19,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign20
    );

  ramb36e1_2 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_2.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign21,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign22,
      DIPADIP => net_gnd4,
      DOADO => pgassign23,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign24,
      ADDRBWRADDR => pgassign25,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign26,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign27,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign28
    );

  ramb36e1_3 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_3.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign29,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign30,
      DIPADIP => net_gnd4,
      DOADO => pgassign31,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign32,
      ADDRBWRADDR => pgassign33,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign34,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign35,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign36
    );

  ramb36e1_4 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_4.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign37,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign38,
      DIPADIP => net_gnd4,
      DOADO => pgassign39,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign40,
      ADDRBWRADDR => pgassign41,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign42,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign43,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign44
    );

  ramb36e1_5 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_5.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign45,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign46,
      DIPADIP => net_gnd4,
      DOADO => pgassign47,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign48,
      ADDRBWRADDR => pgassign49,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign50,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign51,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign52
    );

  ramb36e1_6 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_6.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign53,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign54,
      DIPADIP => net_gnd4,
      DOADO => pgassign55,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign56,
      ADDRBWRADDR => pgassign57,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign58,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign59,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign60
    );

  ramb36e1_7 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_7.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => pgassign61,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign62,
      DIPADIP => net_gnd4,
      DOADO => pgassign63,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign64,
      ADDRBWRADDR => pgassign65,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign66,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign67,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign68
    );

end architecture STRUCTURE;

