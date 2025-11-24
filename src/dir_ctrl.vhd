----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:09:46 08/17/2024 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dir_cntl is

    Port (
			  dir0: in std_logic;
			  dir1: in std_logic;
			  input0: out  std_logic_vector(7 downto 0);
			  input1: out std_logic_vector(7 downto 0);
			  output0: in std_logic_vector(7 downto 0);
			  output1: in std_logic_vector(7 downto 0);
           port0 : inout  STD_LOGIC_VECTOR (7 downto 0);
           port1 : inout  STD_LOGIC_VECTOR (7 downto 0)
			  
			 );
			 
end Dir_cntl;

architecture Behavioral of Dir_cntl is

begin

	port0<=output0 when dir0='0'else (others=>'Z');

	port1<=output1 when dir1='0'else (others=>'Z');

	input0<=port0 when dir0='1'else (others=>'Z');

	input1<=port1 when dir1='1'else (others=>'Z');

end Behavioral;

