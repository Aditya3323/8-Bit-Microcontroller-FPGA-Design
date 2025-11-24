
-- Company: 
-- Engineer: Aditya Arvind Mane
--
-- Create Date:   16:00:37 08/11/2024
-- Design Name:   
-- Module Name:   C:/Xilinx/PROJECTS/B82C/cpu_tb.vhd
-- Project Name:  B82C
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CPU is 
port(
	clk: in std_logic;
	rst: in std_logic;
	P0 : inout std_logic_vector(7 downto 0);
	P1 : inout std_logic_vector(7 downto 0)
 
);
end CPU;

architecture Behavioral of CPU is

component CU is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           inst : in  STD_LOGIC_VECTOR (3 downto 0);
           do : out  STD_LOGIC_VECTOR (20 downto 0)
			 );
			 
end component;

component ALU is

    Port ( oe : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           a_in : in  STD_LOGIC_VECTOR (7 downto 0);
           b_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  carry_out : out  STD_LOGIC;
			  zero_flag : out  STD_LOGIC;
           data_out: out  STD_LOGIC_VECTOR (7 downto 0)
			 );
			 
end component;

component PORT_P is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           lod : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
          
end component;

component RAM is

    Port ( clk : in  STD_LOGIC;
           load : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           addr_in : in  STD_LOGIC_VECTOR (3 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
			 
end component;

component ROM is

    Port ( clk : in  STD_LOGIC;
           addr_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  code_out : out  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
			 
end component;

component program_counter is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  lod : in  STD_LOGIC;
			  oe : in STD_LOGIC;
           input : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           output : out  STD_LOGIC_VECTOR(7 DOWNTO 0)
			  );
			  
end component;

component reg_4 is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           lod : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
          
end component;
          

component main_reg is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           oe : in  STD_LOGIC;
           lod : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (7 downto 0);
			  reg_out : out  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
          
end component;

component Dir_cntl is

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
			 
end component;

signal clk_sig : STD_LOGIC;
signal rst_sig : STD_LOGIC;

signal main_bus : STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";

signal CU_out :  STD_LOGIC_VECTOR (20 downto 0);

signal ALU_oe :  STD_LOGIC;
signal ALU_op :  STD_LOGIC_VECTOR (2 downto 0):="000";
signal ALU_out : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal PC_en :  STD_LOGIC;
signal PC_lod :  STD_LOGIC;
signal PC_oe :  STD_LOGIC;
signal PC_output :  STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000000";

signal Ram_reg_oe : STD_LOGIC;
signal Ram_reg_lod :  STD_LOGIC;
signal Ram_reg_output :  STD_LOGIC_VECTOR (3 downto 0):= "0000";

signal PORT_P0_oe :  STD_LOGIC;
signal PORT_P0_lod :  STD_LOGIC;
signal PORT_P0_output :  STD_LOGIC_VECTOR (7 downto 0):="11111111";
signal PORT_P0_in :  STD_LOGIC_VECTOR (7 downto 0);
signal Dir_ctrl0 : STD_LOGIC :='0';


signal PORT_P1_oe :  STD_LOGIC;
signal PORT_P1_lod :  STD_LOGIC;
signal PORT_P1_output :  STD_LOGIC_VECTOR (7 downto 0):="11111111";
signal PORT_P1_in :  STD_LOGIC_VECTOR (7 downto 0);
signal Dir_ctrl1 : STD_LOGIC :='0';


signal ACC_oe :  STD_LOGIC;
signal ACC_lod :  STD_LOGIC;
signal ACC_reg_out :  STD_LOGIC_VECTOR (7 downto 0):="00000000";
signal ACC_in :  STD_LOGIC_VECTOR (7 downto 0);
signal ACC_out :  STD_LOGIC_VECTOR (7 downto 0):="00000000";


signal B_reg_oe :  STD_LOGIC;
signal B_reg_lod :  STD_LOGIC;
signal B_reg_reg_out :  STD_LOGIC_VECTOR (7 downto 0):="00000000";
signal B_reg_out :  STD_LOGIC_VECTOR (7 downto 0):="00000000";
signal B_reg_in :  STD_LOGIC_VECTOR (7 downto 0);


signal RAM_load :  STD_LOGIC;
signal RAM_oe : STD_LOGIC;
signal RAM_out :  STD_LOGIC_VECTOR (7 downto 0);
signal RAM_in :  STD_LOGIC_VECTOR (7 downto 0);

signal input0: std_logic_vector(7 downto 0);
signal input1: std_logic_vector(7 downto 0);
signal output0: std_logic_vector(7 downto 0);
signal output1: std_logic_vector(7 downto 0);
signal dir0 : STD_LOGIC;
signal dir1 : STD_LOGIC;



begin

CU_model: CU port map(
	clk => clk_sig,
	rst => rst_sig, 
	inst => main_bus(15 downto 12),
   do => CU_out
 
);

ALU_model : ALU Port map ( 
		oe => ALU_oe,
      op => ALU_op,
      a_in => ACC_reg_out,
      b_in => B_reg_reg_out,
		carry_out => open,
		zero_flag => open,
      data_out => ALU_out
);

PORT_P0 : PORT_P Port map ( 
			  clk => clk_sig, 
           rst => rst_sig,
           oe => PORT_P0_oe,
           lod => PORT_P0_lod,
           input => PORT_P0_in,
           output => PORT_P0_output
);

PORT_P1 : PORT_P Port map ( 
			  clk => clk_sig, 
           rst => rst_sig,
           oe => PORT_P1_oe,
           lod => PORT_P1_lod,
           input => PORT_P1_in,
           output => PORT_P1_output
);

RAM_model : RAM Port map ( 
			  clk => clk_sig, 
           load => RAM_load,
           oe => RAM_oe,
           data_in => RAM_in,
           addr_in => Ram_reg_output,
           data_out => RAM_out
);

ROM_model : ROM Port map ( 
			  clk => clk_sig, 
           addr_in => PC_output,
			  code_out => main_bus(15 downto 8),
           data_out => main_bus(7 downto 0)
);

program_counter_model : program_counter Port map ( 
			  clk => clk_sig, 
           rst => rst_sig, 
           en => PC_en,
			  lod => PC_lod,
			  oe => PC_oe,
           input => main_bus(7 downto 0),
           output => PC_output
);


Ram_reg : reg_4 Port map( 
			  clk => clk_sig,
           rst => rst_sig, 
           oe => Ram_reg_oe,
           lod => Ram_reg_lod,
           input => main_bus(11 downto 8),
           output => Ram_reg_output
);

ACC : main_reg Port map ( 
			  clk => clk_sig, 
           rst => rst_sig,
           oe => ACC_oe,
           lod => ACC_lod,
           input => ACC_in,
			  reg_out => ACC_reg_out,
           output => ACC_out
);

B_reg : main_reg Port map ( 
			  clk => clk_sig,
           rst => rst_sig,
           oe => B_reg_oe,
           lod => B_reg_lod,
           input => B_reg_in,
			  reg_out => B_reg_reg_out,
           output => B_reg_out
);


Dir_cntl_unit : Dir_cntl port map (
			  dir0 => dir0,
			  dir1 => dir1,
			  input0 => input0,
			  input1 => input1,
			  output0 => output0,
			  output1 => output1,
           port0 => P0,
           port1 => P1

);

clk_sig <= clk;
rst_sig <= rst;


PC_oe <= CU_out(0);
PC_en <= CU_out(1);

Ram_reg_lod <= CU_out(2);
Ram_reg_oe <= CU_out(3);

ACC_lod <= CU_out(4);
ACC_oe <= CU_out(5);

B_reg_lod <= CU_out(6);
B_reg_oe <= CU_out(7);

PORT_P0_lod <= CU_out(8);
PORT_P0_oe <= CU_out(9);

PORT_P1_lod <= CU_out(10);
PORT_P1_oe <= CU_out(11);

RAM_load <= CU_out(12);
RAM_oe <= CU_out(13);

ALU_oe <= CU_out(14);
 
ALU_op(0) <= CU_out(15);
ALU_op(1) <= CU_out(16);
ALU_op(2) <= CU_out(17);
 
PC_lod <= CU_out(18);

Dir_ctrl0 <= CU_out(19);
Dir_ctrl1 <= CU_out(20);

 
Data_handling : process (clk,main_bus(15 downto 12))

begin

	case main_bus(15 downto 12) is
	
	when "0000" => ACC_in <= main_bus(7 downto 0);
	when "0010" => B_reg_in <= main_bus(7 downto 0);
	when "0001" => RAM_in  <= main_bus(7 downto 0);
	when "0111" => ACC_in <= RAM_out;
	when "1000" => ACC_in <= PORT_P0_output;
						PORT_P0_in <= input0;
	when "1001" => ACC_in <= PORT_P1_output;
						PORT_P1_in <= input1;
	when "1010" => B_reg_in <= RAM_out;
	when "0110" => RAM_in <= ACC_out;
	when "0101" => RAM_in <= B_reg_out;
	when "0011" => PORT_P0_in <= ACC_out;
						output0 <= PORT_P0_output;
	when "0100" => PORT_P1_in <= ACC_out;
						output1 <= PORT_P1_output;
	when "1011" => ACC_in <= ALU_out;
	when "1100" => ACC_in <= ALU_out;
	when "1101" => ACC_in <= ALU_out;
	when "1110" => ACC_in <= ALU_out;
	when others => null;

	end case;
	
end process;

dir_signalling : process (Dir_ctrl0,Dir_ctrl1,main_bus(15 downto 12))

begin

if ((main_bus(15 downto 12) = "1000") or (main_bus(15 downto 12) = "1001")) then
	if Dir_ctrl0 ='1' then 
		dir0 <= '1';
	end if;
	
	if Dir_ctrl1 = '1' then
		dir1 <= '1';
	end if;
	
elsif ((main_bus(15 downto 12) = "0011") or (main_bus(15 downto 12) = "0100")) then

	if Dir_ctrl0 ='1' then 
		dir0 <= '0';
	end if;
	
	if Dir_ctrl1 = '1' then
		dir1 <= '0';
	end if;

end if;

end process;

end Behavioral;