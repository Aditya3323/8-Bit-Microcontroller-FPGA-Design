
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



entity CU is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           inst : in  STD_LOGIC_VECTOR (3 downto 0);
           do : out  STD_LOGIC_VECTOR (20 downto 0));
end CU;

architecture Behavioral of CU is

signal counter: STD_LOGIC_VECTOR (3 downto 0):="0000";
signal count: STD_LOGIC_VECTOR (3 downto 0):="0000";

begin

process (clk,rst)

begin

if rst='1'then	
		counter<="0000";
elsif rising_edge(clk) then
		if (counter="1000") then
			counter<="0000";
		else
			counter <= STD_LOGIC_VECTOR (unsigned(counter+1));
		end if;
end if;
		
end process;

do <= "000000000000000000000" when counter = "0000" else 
	  "000000000000000000101" when counter = "0001" else 
      "000000000000000001000" when counter = "0010" else 
      
      
      --LDA
      "000000000000000010000" when (counter = "0011" and inst="0000") else  
      "000000000000000000010" when (counter = "0100" and inst="0000") else  
      "000000000000000000000" when (counter = "0101" and inst="0000") else  
      
		--LDR
	  "000000000000000000100" when (counter = "0011" and inst="0001") else  
      "000000001000000001000" when (counter = "0100" and inst="0001") else  
      "000000000000000000010" when (counter = "0101" and inst="0001") else  
      "000000000000000000000" when (counter = "0110" and inst="0001") else  
      
      --LDB
      "000000000000001000000" when (counter = "0011" and inst="0010") else  
      "000000000000000000010" when (counter = "0100" and inst="0010") else  
      "000000000000000000000" when (counter = "0101" and inst="0010") else  
      
      --LP0
      "010000000000100100000" when (counter = "0011" and inst="0011") else  
      "010000000001000100000" when (counter = "0100" and inst="0011") else  
      "000000000000000000010" when (counter = "0101" and inst="0011") else  
      "000000000000000000000" when (counter = "0110" and inst="0011") else  
      
      --LP1
      "100000000010000100000" when (counter = "0011" and inst="0100") else  
      "100000000100000100000" when (counter = "0100" and inst="0100") else  
      "000000000000000000010" when (counter = "0101" and inst="0100") else  
      "000000000000000000000" when (counter = "0110" and inst="0100") else  
      
      --RDB
      "000000000000010001000" when (counter = "0011" and inst="0101") else  
      "000000001000000001000" when (counter = "0100" and inst="0101") else  
      "000000000000000000010" when (counter = "0101" and inst="0101") else  
      "000000000000000000000" when (counter = "0110" and inst="0101") else  
      
      --RDA
      "000000000000000000100" when (counter = "0011" and inst="0110") else  
	  "000000000000000101000" when (counter = "0100" and inst="0110") else  
      "000000001000000101000" when (counter = "0101" and inst="0110") else  
      "000000000000000000010" when (counter = "0110" and inst="0110") else  
      "000000000000000000000" when (counter = "0111" and inst="0110") else  
      
		 --RRA
      "000000000000000000100" when (counter = "0011" and inst="0111") else  
      "000000010000000011000" when (counter = "0100" and inst="0111") else  
	  "000000000000000110000" when (counter = "0101" and inst="0111") else  
      "000000000000000000010" when (counter = "0110" and inst="0111") else  
      "000000000000000000000" when (counter = "0111" and inst="0111") else  
      
		 --RP0
      "010000000000100000000" when (counter = "0011" and inst="1000") else  
	  "010000000001000000000" when (counter = "0100" and inst="1000") else  
      "000000000000000010000" when (counter = "0101" and inst="1000") else  
      "000000000000000000010" when (counter = "0110" and inst="1000") else  
      "000000000000000000000" when (counter = "0111" and inst="1000") else  
      
		 --RP1
      "100000000100000000000" when (counter = "0011" and inst="1001") else  
	  "100000001000000000000" when (counter = "0100" and inst="1001") else  
      "000000000000000010000" when (counter = "0101" and inst="1001") else  
      "000000000000000000010" when (counter = "0110" and inst="1001") else  
      "000000000000000000000" when (counter = "0111" and inst="1001") else  
      
		 --RRB
      "000000010000000000100" when (counter = "0011" and inst="1010") else  
      "000000000000001001000" when (counter = "0100" and inst="1010") else  
	  "000000000000011000000" when (counter = "0101" and inst="1010") else  
      "000000000000000000010" when (counter = "0110" and inst="1010") else  
      "000000000000000000000" when (counter = "0111" and inst="1010") else  
      
		 --ADD
      "000000000000000000000" when (counter = "0011" and inst="1011") else  
      "000000100000000000000" when (counter = "0100" and inst="1011") else  
      "000000000000000010000" when (counter = "0101" and inst="1011") else  
      "000000000000000000010" when (counter = "0110" and inst="1011") else  
      "000000000000000000000" when (counter = "0111" and inst="1011") else 
      
		 --SUB
      "000001000000000000000" when (counter = "0011" and inst="1100") else  
      "000001100000000000000" when (counter = "0100" and inst="1100") else  
      "000001000000000010000" when (counter = "0101" and inst="1100") else  
      "000000000000000000010" when (counter = "0110" and inst="1100") else  
      "000000000000000000000" when (counter = "0111" and inst="1100") else 
      
		 --AND
      "000010000000000000000" when (counter = "0011" and inst="1101") else  
      "000010100000000000000" when (counter = "0100" and inst="1101") else  
      "000010000000000010000" when (counter = "0101" and inst="1101") else  
      "000000000000000000010" when (counter = "0110" and inst="1101") else  
      "000000000000000000000" when (counter = "0111" and inst="1101") else 
      
		 --ORR
      "000011000000000000000" when (counter = "0011" and inst="1110") else  
      "000011100000000000000" when (counter = "0100" and inst="1110") else  
      "000011000000000010000" when (counter = "0101" and inst="1110") else  
      "000000000000000000010" when (counter = "0110" and inst="1110") else  
      "000000000000000000000" when (counter = "0111" and inst="1110") else 
      
		 --JMP
      "001000000000000000000" when (counter = "0011" and inst="1111") else  
      "000000000000000000001" when (counter = "0100" and inst="1111") else  
      "000000000000000000000" when (counter = "0101" and inst="1111") ;

end Behavioral;