----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:13 10/11/2023 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
	Port ( clk : in  STD_LOGIC);
end main;

architecture Behavioral of main is
	-- CPU component
	COMPONENT CPU_gen
		PORT(
			clk : IN std_logic;
			rst : IN std_logic;
			trig : IN std_logic;          
			Address : OUT std_logic_vector(15 downto 0);
			wr_rd : OUT std_logic;
			cs : OUT std_logic;
			DOut : OUT std_logic_vector(7 downto 0)
			);
		END COMPONENT;
	-- CPU signals
	signal cpu_reset: STD_LOGIC;
	signal cpu_address: std_logic_vector(15 downto 0);
	signal cpu_wr_rd: STD_LOGIC;
	signal cpu_cs: STD_LOGIC;
	signal cpu_dout: std_logic_vector(7 downto 0);
	signal cpu_tag : STD_LOGIC_VECTOR(7 DOWNTO 0) := cpu_address(15 DOWNTO 8);
	signal cpu_index : STD_LOGIC_VECTOR(2 DOWNTO 0) := cpu_address(7 DOWNTO 5);
	signal cpu_offset : STD_LOGIC_VECTOR(4 DOWNTO 0) := cpu_address(4 DOWNTO 0);
	signal index_and_offset : STD_LOGIC_VECTOR(7 DOWNTO 0) := cpu_address(7 DOWNTO 0);
	-- Cache controller component
	COMPONENT CacheController
	PORT(
		clk : IN std_logic;
		WR_RD : IN std_logic;
		CS : IN std_logic;
		CPU_ADD : IN std_logic_vector(15 downto 0);          
		SDRAM_ADD : OUT std_logic_vector(15 downto 0);
		CACHE_ADD : OUT std_logic_vector(7 downto 0);
		WEN_CACHE : OUT std_logic;
		CACHE_DIN_EN : OUT std_logic;
		CACHE_DOUT_EN : OUT std_logic;
		WEN_SDRAM : OUT std_logic;
		MSTRB : OUT std_logic;
		RDY : OUT std_logic
		);
	END COMPONENT;
	-- Cache controller signals
	signal sdram_address: std_logic_vector(15 downto 0);
	signal cache_address: std_logic_vector(7 downto 0);
	signal cache_wen: std_logic;
	signal sdram_wen: std_logic;
	signal cache_din_wen: std_logic;
	signal cache_dout_wen: std_logic;
	signal memstrb: std_logic;
	signal rdy: std_logic;
	-- ICON component
	component icon
	  PORT (
		 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
	end component;
	-- ILA component
	component ila
	  PORT (
		 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		 CLK : IN STD_LOGIC;
		 DATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));
	end component;
	--ICON and ILA signals
	signal control0: STD_LOGIC_VECTOR(35 DOWNTO 0);
	signal ila_data: STD_LOGIC_VECTOR(63 DOWNTO 0);
	signal ila_trig0: STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
	sys_cpu: CPU_gen PORT MAP(
		clk => clk,
		rst => cpu_reset,
		trig => rdy,
		Address => cpu_address,
		wr_rd => cpu_wr_rd,
		cs => cpu_cs,
		DOut => cpu_dout
	);
	sys_cache_controller: CacheController PORT MAP(
		clk => clk,
		WR_RD => cpu_wr_rd,
		CS => cpu_cs,
		CPU_ADD => cpu_address,
		SDRAM_ADD => sdram_address,
		CACHE_ADD => cache_address,
		WEN_CACHE => cache_wen,
		CACHE_DIN_EN => cache_din_wen,
		CACHE_DOUT_EN => cache_dout_wen,
		WEN_SDRAM => sdram_wen,
		MSTRB => memstrb,
		RDY => rdy
	);
	sys_icon : icon
	  port map (
		 CONTROL0 => control0);
	sys_ila : ila
	  port map (
		 CONTROL => control0,
		 CLK => clk,
		 DATA => ila_data,
		 TRIG0 => ila_trig0);


end Behavioral;

