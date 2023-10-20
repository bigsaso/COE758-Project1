----------------------------------------------------------------------------------
-- Company: TMU
-- Engineer: Salvatore Logozzo and Alexander Zwegers
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

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
	COMPONENT CacheControllerFSM
	PORT(
		clk : IN std_logic;
		WR_RD : IN std_logic;
		CS : IN std_logic;
		CPU_ADD : IN std_logic_vector(15 downto 0);          
		SDRAM_ADD : OUT std_logic_vector(15 downto 0);
		CACHE_ADD : OUT std_logic_vector(7 downto 0);
		CACHE_WEN : OUT std_logic;
		CACHE_DIN_WEN : OUT std_logic;
		CACHE_DOUT_WEN : OUT std_logic;
		WEN_SDRAM : OUT std_logic;
		MEMSTRB : OUT std_logic;
		RDY : OUT std_logic;
		DEBUG : OUT std_logic_vector(31 downto 0)
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
	signal debug : std_logic_vector(31 downto 0);
--	-- SRAM component
	COMPONENT sram
	  PORT (
		 clka : IN STD_LOGIC;
		 wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
	END COMPONENT;
	-- SRAM signals
	--signal sram_add: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal sram_din, sram_dout: STD_LOGIC_VECTOR(7 DOWNTO 0);
	--signal sram_wen: STD_LOGIC_VECTOR(0 DOWNTO 0);
	-- SDRAM controller component
	COMPONENT SDRAMController
	PORT(
		ADD : IN std_logic_vector(15 downto 0);
		WR_RD : IN std_logic;
		MSTRB : IN std_logic;
		Clk : IN std_logic;
		DIN : IN std_logic_vector(7 downto 0);          
		DOUT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	-- SDRAM controller signals
	signal sdram_wr_rd: std_logic;
	signal sdram_mstrb: std_logic;
	signal sdram_din: std_logic_vector(7 downto 0);
	signal sdram_dout: std_logic_vector(7 downto 0);
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
		DATA : IN STD_LOGIC_VECTOR(98 DOWNTO 0);
		TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));
	end component;
	--ICON and ILA signals
	signal control0: STD_LOGIC_VECTOR(35 DOWNTO 0);
	signal ila_data: STD_LOGIC_VECTOR(98 DOWNTO 0);
	signal ila_trig0: STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- VIO component
	component vio
	PORT (
		CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
		ASYNC_OUT : OUT STD_LOGIC_VECTOR(17 DOWNTO 0));
	end component;
	-- VIO signals
	signal vio_out: STD_LOGIC_VECTOR(17 DOWNTO 0);

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
	sys_cache_controller: CacheControllerFSM PORT MAP(
		clk => clk,
		WR_RD => cpu_wr_rd,
		CS => cpu_cs,
		CPU_ADD => cpu_address,
		SDRAM_ADD => sdram_address,
		CACHE_ADD => cache_address,
		CACHE_WEN => cache_wen,
		CACHE_DIN_WEN => cache_din_wen,
		CACHE_DOUT_WEN => cache_dout_wen,
		WEN_SDRAM => sdram_wen,
		MEMSTRB => memstrb,
		RDY => rdy,
		DEBUG => debug
	);
	local_sram : sram
	  PORT MAP (
		 clka => clk,
		 wea(0) => cache_wen,
		 addra => cache_address,
		 dina => sram_din,
		 douta => sram_dout
	);
	sys_sdram_controller: SDRAMController PORT MAP(
		ADD => sdram_address,
		WR_RD => sdram_wr_rd,
		MSTRB => sdram_mstrb,
		Clk => clk,
		DIN => sdram_din,
		DOUT => sdram_dout
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
	sys_vio : vio
	  port map (
       CONTROL => control0,
       ASYNC_OUT => vio_out);
	process(clk,cache_din_wen,cache_dout_wen)
	begin
		if(clk'Event AND clk='1') then
			if(cache_din_wen='0') then
				sram_din <= cpu_dout;
			else
				sram_din <= sdram_dout;
			end if;
			if(cache_dout_wen='0') then
				sdram_din <= sram_dout;
			--else it should go to cpu_din, but our CPU does not have DIN.
			end if;
		end if;
	end process;
	ila_data(15 DOWNTO 0) <= cpu_address;
	ila_data(16) <= cpu_wr_rd;
	ila_data(17) <= rdy;
	ila_data(18) <= cpu_cs;
	ila_data(19) <= debug(3); -- dirty bit
	ila_data(20) <= debug(4); -- valid bit
	ila_data(28 DOWNTO 21) <= cache_address;
	ila_data(36 DOWNTO 29) <= sram_din;
	ila_data(44 DOWNTO 37) <= sram_dout;
	ila_data(60 DOWNTO 45) <= sdram_address;
	ila_data(68 DOWNTO 61) <= sdram_din;
	ila_data(76 DOWNTO 69) <= sdram_dout;
	ila_data(84 DOWNTO 77) <= cpu_dout;
	ila_data(87 DOWNTO 85) <= debug(2 DOWNTO 0); -- current state

end Behavioral;

