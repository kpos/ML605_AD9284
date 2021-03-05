-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    ddr_memory_we_n : out std_logic;
    ddr_memory_ras_n : out std_logic;
    ddr_memory_odt : out std_logic;
    ddr_memory_dqs_n : inout std_logic_vector(0 to 0);
    ddr_memory_dqs : inout std_logic_vector(0 to 0);
    ddr_memory_dq : inout std_logic_vector(7 downto 0);
    ddr_memory_dm : out std_logic_vector(0 to 0);
    ddr_memory_ddr3_rst : out std_logic;
    ddr_memory_cs_n : out std_logic;
    ddr_memory_clk_n : out std_logic;
    ddr_memory_clk : out std_logic;
    ddr_memory_cke : out std_logic;
    ddr_memory_cas_n : out std_logic;
    ddr_memory_ba : out std_logic_vector(2 downto 0);
    ddr_memory_addr : out std_logic_vector(12 downto 0);
    RS232_Uart_1_sout : out std_logic;
    RS232_Uart_1_sin : in std_logic;
    RESET : in std_logic;
    Push_Buttons_5Bits_TRI_I : in std_logic_vector(4 downto 0);
    LEDs_Positions_TRI_O : out std_logic_vector(4 downto 0);
    LEDs_8Bits_TRI_O : out std_logic_vector(7 downto 0);
    Ethernet_Lite_TX_EN : out std_logic;
    Ethernet_Lite_TX_CLK : in std_logic;
    Ethernet_Lite_TXD : out std_logic_vector(3 downto 0);
    Ethernet_Lite_RX_ER : in std_logic;
    Ethernet_Lite_RX_DV : in std_logic;
    Ethernet_Lite_RX_CLK : in std_logic;
    Ethernet_Lite_RXD : in std_logic_vector(3 downto 0);
    Ethernet_Lite_PHY_RST_N : out std_logic;
    Ethernet_Lite_MDIO : inout std_logic;
    Ethernet_Lite_MDC : out std_logic;
    Ethernet_Lite_CRS : in std_logic;
    Ethernet_Lite_COL : in std_logic;
    CLK_P : in std_logic;
    CLK_N : in std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      ddr_memory_we_n : out std_logic;
      ddr_memory_ras_n : out std_logic;
      ddr_memory_odt : out std_logic;
      ddr_memory_dqs_n : inout std_logic_vector(0 to 0);
      ddr_memory_dqs : inout std_logic_vector(0 to 0);
      ddr_memory_dq : inout std_logic_vector(7 downto 0);
      ddr_memory_dm : out std_logic_vector(0 to 0);
      ddr_memory_ddr3_rst : out std_logic;
      ddr_memory_cs_n : out std_logic;
      ddr_memory_clk_n : out std_logic;
      ddr_memory_clk : out std_logic;
      ddr_memory_cke : out std_logic;
      ddr_memory_cas_n : out std_logic;
      ddr_memory_ba : out std_logic_vector(2 downto 0);
      ddr_memory_addr : out std_logic_vector(12 downto 0);
      RS232_Uart_1_sout : out std_logic;
      RS232_Uart_1_sin : in std_logic;
      RESET : in std_logic;
      Push_Buttons_5Bits_TRI_I : in std_logic_vector(4 downto 0);
      LEDs_Positions_TRI_O : out std_logic_vector(4 downto 0);
      LEDs_8Bits_TRI_O : out std_logic_vector(7 downto 0);
      Ethernet_Lite_TX_EN : out std_logic;
      Ethernet_Lite_TX_CLK : in std_logic;
      Ethernet_Lite_TXD : out std_logic_vector(3 downto 0);
      Ethernet_Lite_RX_ER : in std_logic;
      Ethernet_Lite_RX_DV : in std_logic;
      Ethernet_Lite_RX_CLK : in std_logic;
      Ethernet_Lite_RXD : in std_logic_vector(3 downto 0);
      Ethernet_Lite_PHY_RST_N : out std_logic;
      Ethernet_Lite_MDIO : inout std_logic;
      Ethernet_Lite_MDC : out std_logic;
      Ethernet_Lite_CRS : in std_logic;
      Ethernet_Lite_COL : in std_logic;
      CLK_P : in std_logic;
      CLK_N : in std_logic
    );
  end component;

  attribute BUFFER_TYPE : STRING;
  attribute BOX_TYPE : STRING;
  attribute BUFFER_TYPE of Ethernet_Lite_TX_CLK : signal is "IBUF";
  attribute BUFFER_TYPE of Ethernet_Lite_RX_CLK : signal is "IBUF";
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      ddr_memory_we_n => ddr_memory_we_n,
      ddr_memory_ras_n => ddr_memory_ras_n,
      ddr_memory_odt => ddr_memory_odt,
      ddr_memory_dqs_n => ddr_memory_dqs_n(0 to 0),
      ddr_memory_dqs => ddr_memory_dqs(0 to 0),
      ddr_memory_dq => ddr_memory_dq,
      ddr_memory_dm => ddr_memory_dm(0 to 0),
      ddr_memory_ddr3_rst => ddr_memory_ddr3_rst,
      ddr_memory_cs_n => ddr_memory_cs_n,
      ddr_memory_clk_n => ddr_memory_clk_n,
      ddr_memory_clk => ddr_memory_clk,
      ddr_memory_cke => ddr_memory_cke,
      ddr_memory_cas_n => ddr_memory_cas_n,
      ddr_memory_ba => ddr_memory_ba,
      ddr_memory_addr => ddr_memory_addr,
      RS232_Uart_1_sout => RS232_Uart_1_sout,
      RS232_Uart_1_sin => RS232_Uart_1_sin,
      RESET => RESET,
      Push_Buttons_5Bits_TRI_I => Push_Buttons_5Bits_TRI_I,
      LEDs_Positions_TRI_O => LEDs_Positions_TRI_O,
      LEDs_8Bits_TRI_O => LEDs_8Bits_TRI_O,
      Ethernet_Lite_TX_EN => Ethernet_Lite_TX_EN,
      Ethernet_Lite_TX_CLK => Ethernet_Lite_TX_CLK,
      Ethernet_Lite_TXD => Ethernet_Lite_TXD,
      Ethernet_Lite_RX_ER => Ethernet_Lite_RX_ER,
      Ethernet_Lite_RX_DV => Ethernet_Lite_RX_DV,
      Ethernet_Lite_RX_CLK => Ethernet_Lite_RX_CLK,
      Ethernet_Lite_RXD => Ethernet_Lite_RXD,
      Ethernet_Lite_PHY_RST_N => Ethernet_Lite_PHY_RST_N,
      Ethernet_Lite_MDIO => Ethernet_Lite_MDIO,
      Ethernet_Lite_MDC => Ethernet_Lite_MDC,
      Ethernet_Lite_CRS => Ethernet_Lite_CRS,
      Ethernet_Lite_COL => Ethernet_Lite_COL,
      CLK_P => CLK_P,
      CLK_N => CLK_N
    );

end architecture STRUCTURE;

