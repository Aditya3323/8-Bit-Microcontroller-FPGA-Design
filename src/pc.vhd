library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity program_counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  lod : in  STD_LOGIC;
			  oe : in STD_LOGIC;
           input : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           output : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end program_counter;

architecture Behavioral of program_counter is

signal count : std_logic_vector(7 downto 0) :="00000000";

begin
process(clk,rst)
	begin
		
		if rst='1' then
			count<=(others=>'0');
		elsif rising_edge(clk) then
			
			if lod='1' then
				count<=input;
			elsif en='1' then
				count<=count+1;
			end if;

		end if;

end process;

output<=count when oe='1';		

end Behavioral;

