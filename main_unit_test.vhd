--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:04:40 10/25/2023
-- Design Name:   
-- Module Name:   /home/student2/slogozzo/COE758/Project1/COE758-Project1/main_unit_test.vhd
-- Project Name:  Project1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY main_unit_test IS
END main_unit_test;
 
ARCHITECTURE behavior OF main_unit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : in  STD_LOGIC;
			CPU_ADDRESS_DEBUG : out STD_LOGIC_VECTOR(15 downto 0);
			WR_RD_DEBUG : out STD_LOGIC;
			RDY_DEBUG : out STD_LOGIC;
			CS_DEBUG : out STD_LOGIC;
			CACHE_ADDRESS_DEBUG : out STD_LOGIC_VECTOR(7 downto 0);
			SRAM_DIN_DEBUG : out STD_LOGIC_VECTOR(7 downto 0);
			SRAM_DOUT_DEBUG : out STD_LOGIC_VECTOR(7 downto 0);
			SDRAM_ADDRESS_DEBUG : out STD_LOGIC_VECTOR(15 downto 0);
			SDRAM_DIN_DEBUG : out STD_LOGIC_VECTOR(7 downto 0);
			SDRAM_DOUT_DEBUG : out STD_LOGIC_VECTOR(7 downto 0);
			CPU_DOUT_DEBUG : out STD_LOGIC_VECTOR(7 downto 0);
			STATE_DEBUG : out STD_LOGIC_VECTOR(2 downto 0);
			HIT_MISS_DEBUG : out STD_LOGIC;
			D_BIT_DEBUG : out STD_LOGIC;
			V_BIT_DEBUG : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	
	--Outputs
	signal cpu_address_debug : STD_LOGIC_VECTOR(15 downto 0);
	signal wr_rd_debug : STD_LOGIC;
	signal rdy_debug : STD_LOGIC;
	signal cs_debug : STD_LOGIC;
	signal cache_address_debug : STD_LOGIC_VECTOR(7 downto 0);
	signal sram_din_debug : STD_LOGIC_VECTOR(7 downto 0);
	signal sram_dout_debug : STD_LOGIC_VECTOR(7 downto 0);
	signal sdram_address_debug : STD_LOGIC_VECTOR(15 downto 0);
	signal sdram_din_debug : STD_LOGIC_VECTOR(7 downto 0);
	signal sdram_dout_debug : STD_LOGIC_VECTOR(7 downto 0);
	signal cpu_dout_debug : STD_LOGIC_VECTOR(7 downto 0);
	signal state_debug : STD_LOGIC_VECTOR(2 downto 0);
	signal hit_miss_debug : STD_LOGIC;
	signal d_bit_debug : STD_LOGIC;
	signal v_bit_debug : STD_LOGIC;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
			 CPU_ADDRESS_DEBUG => cpu_address_debug,
			 WR_RD_DEBUG => wr_rd_debug,
			 RDY_DEBUG => rdy_debug,
			 CS_DEBUG => cs_debug,
			 CACHE_ADDRESS_DEBUG => cache_address_debug,
			 SRAM_DIN_DEBUG => sram_din_debug,
			 SRAM_DOUT_DEBUG => sram_dout_debug,
			 SDRAM_ADDRESS_DEBUG => sdram_address_debug,
			 SDRAM_DIN_DEBUG => sdram_din_debug,
			 SDRAM_DOUT_DEBUG => sdram_dout_debug,
			 CPU_DOUT_DEBUG => cpu_dout_debug,
			 STATE_DEBUG => state_debug,
			 HIT_MISS_DEBUG => hit_miss_debug,
			 D_BIT_DEBUG => d_bit_debug,
			 V_BIT_DEBUG => v_bit_debug
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

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
