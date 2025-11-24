library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity RAM is
    Port ( clk : in  STD_LOGIC;
           load : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           addr_in : in  STD_LOGIC_VECTOR (3 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end RAM;

architecture Behavioral of RAM is

type mem_type is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0);  --an custome data type
	
	

signal mem_obj : mem_type;

begin

process(clk)

	begin

	
	if rising_edge(clk) then
		if load='1' then
			mem_obj(conv_integer(addr_in)) <= data_in;
		end if;
		
		if oe='1' then
			data_out <= mem_obj(conv_integer(addr_in));
		end if;
		
	end if;

end process;

end Behavioral;

