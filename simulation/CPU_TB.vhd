--------------------------------------------------------------------------------
-- Engineer: Aditya Arvind Mane
-- Create Date:   16:00:37 08/11/2024
-- Design Name:   8-Bit Microcontroller-FPGA Design
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY cpu_tb IS
END cpu_tb;
 
ARCHITECTURE behavior OF cpu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT CPU
   port(
		  clk: in std_logic;
		  rst: in std_logic;
		  P0 : inout std_logic_vector(7 downto 0);
		  P1 : inout std_logic_vector(7 downto 0)
		 );

END COMPONENT;
    


signal clk_sig : STD_LOGIC;
signal rst_sig : STD_LOGIC;


	--BiDirs
   signal P0 : std_logic_vector(7 downto 0);
   signal P1 : std_logic_vector(7 downto 0);
	
   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          clk => clk_sig,
          rst => rst_sig,
          P0 => P0,
          P1 => P1
        );
		  

   -- Clock process definitions
   clk_process :process
   begin
		clk_sig<= '1';
		wait for clk_period/2;
		clk_sig <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
      rst_sig <= '1';
		wait for clk_period/2;
		rst_sig <= '0';
		
	
		P0 <= "00000011";
      wait;
   end process;

END behavior;

