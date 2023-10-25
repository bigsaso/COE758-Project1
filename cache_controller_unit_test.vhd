--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:06:56 10/19/2023
-- Design Name:   
-- Module Name:   /home/student2/slogozzo/COE758/Project1/COE758-Project1/cache_controller_unit_test.vhd
-- Project Name:  Project1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CacheControllerFSM
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
 
ENTITY cache_controller_unit_test IS
END cache_controller_unit_test;
 
ARCHITECTURE behavior OF cache_controller_unit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CacheControllerFSM
    PORT(
         clk : IN  std_logic;
         WR_RD : IN  std_logic;
         CS : IN  std_logic;
         CPU_ADD : IN  std_logic_vector(15 downto 0);
         SDRAM_ADD : OUT  std_logic_vector(15 downto 0);
         CACHE_ADD : OUT  std_logic_vector(7 downto 0);
         CACHE_WEN : OUT  std_logic;
         CACHE_DIN_MUX : OUT  std_logic;
         CACHE_DOUT_MUX : OUT  std_logic;
         WEN_SDRAM : OUT  std_logic;
         MEMSTRB : OUT  std_logic;
         RDY : OUT  std_logic;
         DEBUG : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal WR_RD : std_logic := '0';
   signal CS : std_logic := '0';
   signal CPU_ADD : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal SDRAM_ADD : std_logic_vector(15 downto 0);
   signal CACHE_ADD : std_logic_vector(7 downto 0);
   signal CACHE_WEN : std_logic;
   signal CACHE_DIN_MUX : std_logic;
   signal CACHE_DOUT_MUX : std_logic;
   signal WEN_SDRAM : std_logic;
   signal MEMSTRB : std_logic;
   signal RDY : std_logic;
   signal DEBUG : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CacheControllerFSM PORT MAP (
          clk => clk,
          WR_RD => WR_RD,
          CS => CS,
          CPU_ADD => CPU_ADD,
          SDRAM_ADD => SDRAM_ADD,
          CACHE_ADD => CACHE_ADD,
          CACHE_WEN => CACHE_WEN,
          CACHE_DIN_MUX => CACHE_DIN_MUX,
          CACHE_DOUT_MUX => CACHE_DOUT_MUX,
          WEN_SDRAM => WEN_SDRAM,
          MEMSTRB => MEMSTRB,
          RDY => RDY,
          DEBUG => DEBUG
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
--		-- Cache Hit and Write
--		CS <= '1';
--		CPU_ADD <= "0000000100000000";
--		WR_RD <= '1';
--		-- Cache Hit and Read
--		CS <= '1';
--		CPU_ADD <= "0000000100000000";
--		WR_RD <= '0';
--		-- Cache Miss, Dirty bit not set and write
--		CS <= '1';
--		CPU_ADD <= "1000000000000000";
--		WR_RD <= '0';
		-- Cache Miss, Dirty bit set and write
		CS <= '1';
		CPU_ADD <= "0000000100000000";
		WR_RD <= '1';
		wait for clk_period * 10;
		CPU_ADD <= "1000000000000000";
		WR_RD <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
