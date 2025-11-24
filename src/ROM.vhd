library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ROM is

    Port ( clk : in  STD_LOGIC;
           addr_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  code_out : out  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end ROM;

architecture Behavioral of ROM is

signal out_data : STD_LOGIC_VECTOR (15 downto 0);

type mem_type is array (0 to 10) of STD_LOGIC_VECTOR (15 downto 0);  --an custome data type
	
signal mem_obj : mem_type := (x"8000", 
							  x"6000",
							  x"0004",
					   		  x"6100",
							  x"A100",
							  x"7000",
							  x"B000",
							  x"4000",
							  x"E000",
							  x"4000",
							  x"F000"
							  );

begin

process(clk)


	begin

	if rising_edge(clk) then
			out_data <= mem_obj(conv_integer(addr_in));
	end if;

end process;

code_out <= out_data(15 downto 8);
data_out <= out_data(7 downto 0);

end Behavioral;

