library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( oe : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           a_in : in  STD_LOGIC_VECTOR (7 downto 0);
           b_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  carry_out : out  STD_LOGIC;
			  zero_flag : out  STD_LOGIC;
           data_out: out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

signal result : STD_LOGIC_VECTOR (8 downto 0);

begin

process(a_in,b_in,op)

begin
	
	case op is
	
		when "000" => result <= ext(a_in,9) + ext(b_in,9);
		when "001" => result <= ext(a_in,9) - ext(b_in,9);
		when "010" => result <= ext(a_in,9) and ext(b_in,9);
		when "011" => result <= ext(a_in,9) or ext(b_in,9);
		when "100" => result <=  result;
		when "101" => result <=  result;
		when "110" => result <=  result;
		when "111" => result <=  result;
		when others => result <= result;

	end case;

end process;

carry_out <= result(8)when oe='1' else 'Z';

zero_flag <= '1' when result(7 downto 0)= "00000000" else '0';

data_out <= result(7 downto 0)when oe='1';

end Behavioral;

