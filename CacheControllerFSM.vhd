----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:25:54 10/02/2023 
-- Design Name: 
-- Module Name:    CacheControllerFSM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CacheControllerFSM is
    Port ( clk : in  STD_LOGIC;
           WR_RD : in  STD_LOGIC;
           CS : in  STD_LOGIC;
           CPU_ADD : in  STD_LOGIC_VECTOR (15 downto 0);
		   SDRAM_ADD : out STD_LOGIC_VECTOR(15 DOWNTO 0);
		   CACHE_ADD : out STD_LOGIC_VECTOR(7 DOWNTO 0);
           CACHE_WEN : out  STD_LOGIC;
           CACHE_DIN_WEN : out  STD_LOGIC;
           CACHE_DOUT_WEN : out  STD_LOGIC;
           WEN_SDRAM : out  STD_LOGIC;
           MEMSTRB : out  STD_LOGIC;
           RDY : out  STD_LOGIC;
		   DEBUG : out STD_LOGIC_VECTOR(15 DOWNTO 0));
end CacheControllerFSM;

architecture Behavioral of CacheControllerFSM is
	-- -- CPU component
	-- COMPONENT CPU_gen
	-- 	PORT(
	-- 		clk : IN std_logic;
	-- 		rst : IN std_logic;
	-- 		trig : IN std_logic;          
	-- 		Address : OUT std_logic_vector(15 downto 0);
	-- 		wr_rd : OUT std_logic;
	-- 		cs : OUT std_logic;
	-- 		DOut : OUT std_logic_vector(7 downto 0)
	-- 		);
	-- 	END COMPONENT;
	-- -- CPU signals
	-- signal cpu_reset: STD_LOGIC;
	-- signal cpu_rdy: STD_LOGIC;
	-- signal cpu_address: std_logic_vector(15 downto 0);
	-- signal cpu_wr_rd: STD_LOGIC;
	-- signal cpu_cs: STD_LOGIC;
	-- signal cpu_dout: std_logic_vector(7 downto 0);
	signal cpu_tag : STD_LOGIC_VECTOR(7 DOWNTO 0) := CPU_ADD(15 DOWNTO 8);
	signal cpu_index : STD_LOGIC_VECTOR(2 DOWNTO 0) := CPU_ADD(7 DOWNTO 5);
	signal cpu_offset : STD_LOGIC_VECTOR(4 DOWNTO 0) := CPU_ADD(4 DOWNTO 0);
	signal index_and_offset : STD_LOGIC_VECTOR(7 DOWNTO 0) := CPU_ADD(7 DOWNTO 0);
	-- Tag compare component
	COMPONENT TagCompareDirectMapping
	PORT(
		CPU_ADD : IN std_logic_vector(15 downto 0);
		clk : IN std_logic;          
		HIT_MISS : OUT std_logic
		);
	END COMPONENT;
	-- Tag compare signals
	signal hit_miss_signal: STD_LOGIC;
	-- -- ICON component
	-- component icon
	--   PORT (
	-- 	 CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
	-- end component;
	-- -- ILA component
	-- component ila
	--   PORT (
	-- 	 CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
	-- 	 CLK : IN STD_LOGIC;
	-- 	 DATA : IN STD_LOGIC_VECTOR(84 DOWNTO 0);
	-- 	 TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));
	-- end component;
	-- --ICON and ILA signals
	-- signal control0: STD_LOGIC_VECTOR(35 DOWNTO 0);
	-- signal ila_data: STD_LOGIC_VECTOR(84 DOWNTO 0);
	-- signal ila_trig0: STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- FSM state signal
	type state_type is (s0,s1,s2,s3,s4,s5);
	signal yfsm : state_type;
	-- SRAM component
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
	signal sram_add: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal sram_din, sram_dout: STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal sram_wen: STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal dirty_bit : STD_LOGIC:=sram_add(7);
   signal valid_bit : STD_LOGIC:=sram_add(6);
	-- -- SDRAM signals
	-- signal sdram_din, sdram_dout: STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- signal sdram_wen: STD_LOGIC;
	
begin
	-- sys_cpu: CPU_gen PORT MAP(
	-- 	clk => clk,
	-- 	rst => cpu_reset,
	-- 	trig => rdy,
	-- 	Address => cpu_address,
	-- 	wr_rd => cpu_wr_rd,
	-- 	cs => cpu_cs,
	-- 	DOut => cpu_dout
	-- );
	sys_tag_compare: TagCompareDirectMapping PORT MAP(
		CPU_ADD => CPU_ADD,
		clk => clk,
		HIT_MISS => hit_miss_signal
	);
	-- sys_icon : icon
	--   port map (
	-- 	 CONTROL0 => control0);
	-- sys_ila : ila
	--   port map (
	-- 	 CONTROL => control0,
	-- 	 CLK => clk,
	-- 	 DATA => ila_data,
	-- 	 TRIG0 => ila_trig0);
	local_sram : sram
	  PORT MAP (
		 clka => clk,
		 wea => sram_wen,
		 addra => sram_add,
		 dina => sram_din,
		 douta => sram_dout
	  );
	process(clk)
	begin
		if(clk'Event AND clk='1') then
			case yfsm is
				-- Processing s0 - Idle
				when s0 =>
					if(CS = '1') then
						yfsm <= s1;
						DEBUG(2 DOWNTO 0) <= "001";
					else
						yfsm <= s0;
						DEBUG(2 DOWNTO 0) <= "000";
					end if;
				-- Processing s1 - Operating
				when s1 =>
					if(hit_miss_signal='1' AND WR_RD='1') then
						yfsm <= s2;
						DEBUG(2 DOWNTO 0) <= "010";
					elsif(hit_miss_signal='1' AND WR_RD='0') then
						yfsm <= s3;
						DEBUG(2 DOWNTO 0) <= "011";
					elsif(hit_miss_signal='0' AND dirty_bit='0') then
						yfsm <= s4;
						DEBUG(2 DOWNTO 0) <= "100";
					elsif(hit_miss_signal='0' AND dirty_bit='1') then
						yfsm <= s5;
						DEBUG(2 DOWNTO 0) <= "101";
					end if;
				-- Processing s2 - Cache hit and write
				when s2 =>
					-- if(cpu_rdy='1') then
					-- 	yfsm <= s0;
					-- else
					-- 	yfsm <= s2;
					-- end if;
					yfsm <= s0;
					DEBUG(2 DOWNTO 0) <= "000";
				-- Processing s3 - Cache hit and read
				when s3 =>
					-- if(cpu_rdy='1') then
					-- 	yfsm <= s0;
					-- else
					-- 	yfsm <= s3;
					-- end if;
					yfsm <= s0;
					DEBUG(2 DOWNTO 0) <= "000";
				-- Processing s4 - Cache miss and dirty bit=0
				when s4 =>
					if(WR_RD='0') then
						yfsm <= s3;
						DEBUG(2 DOWNTO 0) <= "011";
					elsif(WR_RD='1') then
						yfsm <= s2;
						DEBUG(2 DOWNTO 0) <= "010";
					-- elsif(memstrb='0') then
					-- 	yfsm <= s4;
					end if;
				-- Processing s5 - Cache miss and dirty bit=1
				when s5 =>
					-- if(memstrb='1') then
					-- 	yfsm <= s4;
					-- else
					-- 	yfsm <= s5;
					-- end if;
					yfsm <= s4;
					DEBUG(2 DOWNTO 0) <= "100";
			end case;
		end if;
	end process;
	process(yfsm)
	begin
		case yfsm is
			-- Generating outputs for s0
			when s0 =>
				RDY <= '1';
			-- Generating outputs for s1
			when s1 =>
				RDY <= '0';
			-- Generating outputs for s2
			when s2 =>
				CACHE_ADD <= index_and_offset;
				CACHE_WEN <= '1';
				CACHE_DIN_WEN <= '0';
				dirty_bit <= '1'; --dirty bit
				valid_bit <= '1'; --valid bit
				-- RDY <= '1'; -- This should happen when going back to s0
			-- Generating outputs for s3
			when s3 =>
				CACHE_ADD <= index_and_offset;
				CACHE_WEN <= '0';
				CACHE_DOUT_WEN <= '1';
				-- RDY <= '1'; -- This should happen when going back to s0
			-- Generating outputs for s4
			when s4 =>
				SDRAM_ADD <= (cpu_add AND "1111111111100000");
				WEN_SDRAM <= '0';
				CACHE_DIN_WEN <= '1';
				CACHE_WEN <= '1';
				valid_bit <= '1'; --valid bit
			-- Generating outputs for s5
			when s5 =>
				SDRAM_ADD <= (cpu_add AND "1111111111100000");
				WEN_SDRAM <= '1';
				CACHE_DOUT_WEN <= '0';
				MEMSTRB <= '1';
		end case;
	end process;
	
--	-- Mapping signals back into ports
--	WR_RD <= cpu_wr_rd;
--	CS <= cpu_cs;
--	HIT_MISS <= hit_miss_signal;
--	CPU_ADD <= cpu_address;
--	SDRAM_ADD <= sdram_address;
--	CACHE_ADD <= cache_address;
--	WEN_CACHE <= cache_wen;
--	CACHE_DIN_EN <= cache_din_wen;
--	CACHE_DOUT_EN <= cache_dout_wen;
--	WEN_SDRAM <= sdram_wen;
--	MSTRB <= memstrb;
--	RDY <= cpu_rdy;
--	
--	-- Mapping ILA ports
--	ila_data(15 DOWNTO 0) <= CPU_ADD;
--	ila_data(16) <= WR_RD;
--	ila_data(17) <= RDY;
--	ila_data(18) <= CS;
--	ila_data(26 DOWNTO 19) <= CACHE_ADD;
--	ila_data(27) <= HIT_MISS;
--	ila_data(28) <= MSTRB;
--	ila_data(44 DOWNTO 29) <= SDRAM_ADD;

end Behavioral;

