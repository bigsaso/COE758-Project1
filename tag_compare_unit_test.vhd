--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:49:38 10/19/2023
-- Design Name:   
-- Module Name:   /home/student2/slogozzo/COE758/Project1/COE758-Project1/tag_compare_unit_test.vhd
-- Project Name:  Project1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TagCompareDirectMapping
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tag_compare_unit_test IS
END tag_compare_unit_test;
 
ARCHITECTURE behavior OF tag_compare_unit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TagCompareDirectMapping
    PORT(
         CPU_ADD : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         HIT_MISS : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CPU_ADD : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal HIT_MISS : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TagCompareDirectMapping PORT MAP (
          CPU_ADD => CPU_ADD,
          clk => clk,
          HIT_MISS => HIT_MISS
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CPU_ADD <= "0000000100000000";
      wait for clk_period*10;
		CPU_ADD <= "0000001000000000";
      -- insert stimulus here 

      wait;
   end process;

END;
