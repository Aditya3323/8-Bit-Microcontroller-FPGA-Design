library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main_reg is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           lod : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (7 downto 0);
			  reg_out : out  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
          
end main_reg;

architecture Behavioral of main_reg is

signal stored_value : STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');

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
reg_out <= stored_value ;

end Behavioral;

