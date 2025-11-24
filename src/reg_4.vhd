library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_4 is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           lod : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
          
end reg_4;

architecture Behavioral of reg_4 is

signal stored_value : STD_LOGIC_VECTOR (3 downto 0):=(others=>'0');

begin

process(clk,rst)
begin

	if rst='1' then
		stored_value <= (others=>'0');
	elsif rising_edge(clk) then
		
		if lod='1' then
			stored_value <= input;
		end if;
	
	end if;
end process;

output <= stored_value when oe='1';

end Behavioral;

