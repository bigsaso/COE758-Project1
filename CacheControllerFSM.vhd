----------------------------------------------------------------------------------
-- Company: TMU
-- Engineer: Salvatore Logozzo and Alexander Zwegers
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
           CACHE_DIN_MUX : out  STD_LOGIC;
           CACHE_DOUT_MUX : out  STD_LOGIC;
           WEN_SDRAM : out  STD_LOGIC;
           MEMSTRB : out  STD_LOGIC;
           RDY : out  STD_LOGIC;
		   DEBUG : out STD_LOGIC_VECTOR(31 DOWNTO 0));
end CacheControllerFSM;

architecture Behavioral of CacheControllerFSM is
	-- Array of 8 blocks of dirty and valid bits
	type dirty_bits is array (7 downto 0) of STD_LOGIC;
	signal dbits: dirty_bits := (others => '0');
	type valid_bits is array (7 downto 0) of STD_LOGIC;
	signal vbits: valid_bits := (others => '0');
	-- CPU signals
	signal cpu_tag : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal cpu_index : STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal cpu_offset : STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal index_and_offset : STD_LOGIC_VECTOR(7 DOWNTO 0);
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
	-- FSM state signal
	type state_type is (s0,s1,s2,s3,s4,s5);
	signal yfsm : state_type;
--	-- SRAM component
--	COMPONENT sram
--	  PORT (
--		 clka : IN STD_LOGIC;
--		 wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--		 addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--		 dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--		 douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
--	  );
--	END COMPONENT;
	-- SRAM signals
	--signal sram_add: STD_LOGIC_VECTOR(7 DOWNTO 0);
--	signal sram_din, sram_dout: STD_LOGIC_VECTOR(7 DOWNTO 0);
	--signal sram_wen: STD_LOGIC_VECTOR(0 DOWNTO 0);
--	-- VIO component
--	component vio
--	PORT (
--		CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
--		ASYNC_OUT : OUT STD_LOGIC_VECTOR(17 DOWNTO 0));
--	end component;
--	-- VIO signals
--	signal control_vio: STD_LOGIC_VECTOR(35 DOWNTO 0);
--	signal vio_out: STD_LOGIC_VECTOR(17 DOWNTO 0);
	
begin
--	sys_vio : vio
--	  port map (
--       CONTROL => control_vio,
--       ASYNC_OUT => vio_out);
	-- Continuous assignment of CPU signals
	cpu_tag <= CPU_ADD(15 DOWNTO 8);
	cpu_index <= CPU_ADD(7 DOWNTO 5);
	cpu_offset <= CPU_ADD(4 DOWNTO 0);
	index_and_offset <= CPU_ADD(7 DOWNTO 0);
	sys_tag_compare: TagCompareDirectMapping PORT MAP(
		CPU_ADD => CPU_ADD,
		clk => clk,
		HIT_MISS => hit_miss_signal
	);
--	local_sram : sram
--	  PORT MAP (
--		 clka => clk,
--		 wea => CACHE_WEN,
--		 addra => CACHE_ADD,
--		 dina => sram_din,
--		 douta => sram_dout
--	  );
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
					elsif(hit_miss_signal='0' AND dbits(to_integer(unsigned(cpu_index)))='0') then
						yfsm <= s4;
						DEBUG(2 DOWNTO 0) <= "100";
					elsif(hit_miss_signal='0' AND dbits(to_integer(unsigned(cpu_index)))='1') then
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
				RDY <= '1';--control_vio(0) AND 
			-- Generating outputs for s1
			when s1 =>
				RDY <= '0';--control_vio(0) AND 
			-- Generating outputs for s2
			when s2 =>
				CACHE_ADD <= index_and_offset;
				CACHE_WEN <= '1';
				CACHE_DIN_MUX <= '0';
				dbits(to_integer(unsigned(cpu_index))) <= '1'; --dirty bit
				vbits(to_integer(unsigned(cpu_index))) <= '1'; --valid bit
				-- RDY <= '1'; -- This should happen when going back to s0
			-- Generating outputs for s3
			when s3 =>
				CACHE_ADD <= index_and_offset;
				CACHE_WEN <= '0';
				CACHE_DOUT_MUX <= '1';
				-- RDY <= '1'; -- This should happen when going back to s0
			-- Generating outputs for s4
			when s4 =>
				SDRAM_ADD <= (cpu_add AND "1111111111100000");
				WEN_SDRAM <= '0';
				CACHE_DIN_MUX <= '1';
				CACHE_WEN <= '1';
				vbits(to_integer(unsigned(cpu_index))) <= '1'; --valid bit
			-- Generating outputs for s5
			when s5 =>
				SDRAM_ADD <= (cpu_add AND "1111111111100000");
				WEN_SDRAM <= '1';
				CACHE_DOUT_MUX <= '0';
				MEMSTRB <= '1';
		end case;
	end process;
	
	DEBUG(3) <= dbits(to_integer(unsigned(cpu_index)));
	DEBUG(4) <= vbits(to_integer(unsigned(cpu_index)));
	DEBUG(5) <= hit_miss_signal;

end Behavioral;

