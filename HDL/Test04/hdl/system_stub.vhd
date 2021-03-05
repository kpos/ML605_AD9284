-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    RS232_Uart_1_sout : out std_logic;
    RS232_Uart_1_sin : in std_logic;
    RESET : in std_logic;
    Push_Buttons_5Bits_TRI_I : in std_logic_vector(4 downto 0);
    LEDs_Positions_TRI_O : out std_logic_vector(4 downto 0);
    LEDs_8Bits_TRI_O : out std_logic_vector(7 downto 0);
    IIC_FMC_SDA : inout std_logic;
    IIC_FMC_SCL : inout std_logic;
    DIP_Switches_8Bits_TRI_I : in std_logic_vector(7 downto 0);
    CLK_P : in std_logic;
    CLK_N : in std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      RS232_Uart_1_sout : out std_logic;
      RS232_Uart_1_sin : in std_logic;
      RESET : in std_logic;
      Push_Buttons_5Bits_TRI_I : in std_logic_vector(4 downto 0);
      LEDs_Positions_TRI_O : out std_logic_vector(4 downto 0);
      LEDs_8Bits_TRI_O : out std_logic_vector(7 downto 0);
      IIC_FMC_SDA : inout std_logic;
      IIC_FMC_SCL : inout std_logic;
      DIP_Switches_8Bits_TRI_I : in std_logic_vector(7 downto 0);
      CLK_P : in std_logic;
      CLK_N : in std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      RS232_Uart_1_sout => RS232_Uart_1_sout,
      RS232_Uart_1_sin => RS232_Uart_1_sin,
      RESET => RESET,
      Push_Buttons_5Bits_TRI_I => Push_Buttons_5Bits_TRI_I,
      LEDs_Positions_TRI_O => LEDs_Positions_TRI_O,
      LEDs_8Bits_TRI_O => LEDs_8Bits_TRI_O,
      IIC_FMC_SDA => IIC_FMC_SDA,
      IIC_FMC_SCL => IIC_FMC_SCL,
      DIP_Switches_8Bits_TRI_I => DIP_Switches_8Bits_TRI_I,
      CLK_P => CLK_P,
      CLK_N => CLK_N
    );

end architecture STRUCTURE;

