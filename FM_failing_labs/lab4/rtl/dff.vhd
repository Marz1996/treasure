library ieee;
use ieee.std_logic_1164.all;
use work.e1_package;

entity DFF is 
port (d   : IN STD_LOGIC;
      clk : IN STD_LOGIC;
      clrn: IN STD_LOGIC;
      prn : IN STD_LOGIC;
      q   : OUT STD_LOGIC );
end DFF;

architecture rtl of DFF is
begin
process (clk,clrn,prn)
begin
if (clk'event and clk = '1') then
  if (prn = '0') then
     q <= '1';
  elsif (clrn = '0') then
     q <= '0';
  else 
     q <= d;
  end if;
end if;
end process;
end rtl;

