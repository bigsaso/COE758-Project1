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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CacheController is
    Port ( clk : in  STD_LOGIC;
           WR_RD : in  STD_LOGIC;
           CS : in  STD_LOGIC;
           CPU_ADD : in  STD_LOGIC_VECTOR (15 downto 0);
			  SDRAM_ADD : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  CACHE_ADD : out STD_LOGIC_VECTOR(7 DOWNTO 0);
           WEN_CACHE : out  STD_LOGIC;
           CACHE_DIN_EN : out  STD_LOGIC;
           CACHE_DOUT_EN : out  STD_LOGIC;
           WEN_SDRAM : out  STD_LOGIC;
           MSTRB : out  STD_LOGIC;
           RDY : out  STD_LOGIC);
end CacheController;

architecture Behavioral of CacheController is
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
	
	-- Various signals
	signal index_and_offset : STD_LOGIC_VECTOR(7 DOWNTO 0) := CPU_ADD(7 DOWNTO 0);
	signal dirty_bit: STD_LOGIC := CPU_ADD(15);
	signal valid_bit: STD_LOGIC := CPU_ADD(14);
	
begin
	sys_tag_compare: TagCompareDirectMapping PORT MAP(
		CPU_ADD => CPU_ADD,
		clk => clk,
		HIT_MISS => hit_miss_signal
	);
	process(clk)
	begin
		if(clk'Event AND clk='1') then
			case yfsm is
				-- Processing s0 - Idle
				when s0 =>
					if(CS = '1') then
						yfsm <= s1;
					else
						yfsm <= s0;
					end if;
				-- Processing s1 - Operating
				when s1 =>
					if(hit_miss_signal='1' AND WR_RD='1') then
						yfsm <= s2;
					elsif(hit_miss_signal='1' AND WR_RD='0') then
						yfsm <= s3;
					elsif(hit_miss_signal='0' AND dirty_bit='0') then
						yfsm <= s4;
					elsif(hit_miss_signal='0' AND dirty_bit='1') then
						yfsm <= s5;
					end if;
				-- Processing s2 - Cache hit and write
				when s2 =>
--					if(RDY='1') then
					yfsm <= s0;
--					else
--						yfsm <= s2;
--					end if;
				-- Processing s3 - Cache hit and read
				when s3 =>
--					if(RDY='1') then
					yfsm <= s0;
--					else
--						yfsm <= s3;
--					end if;
				-- Processing s4 - Cache miss and dirty bit=0
				when s4 =>
--					if(MSTRB='1' AND WR_RD='0') then
--						yfsm <= s3;
--					elsif(MSTRB='1' AND WR_RD='1') then
--						yfsm <= s2;
--					elsif(MSTRB='0') then
--						yfsm <= s4;
--					end if;
					if(WR_RD='0') then
						yfsm <= s3;
					elsif(WR_RD='1') then
						yfsm <= s2;
					end if;
				-- Processing s5 - Cache miss and dirty bit=1
				when s5 =>
--				if(MSTRB='1') then
					yfsm <= s4;
--				else
--					yfsm <= s5;
--				end if;
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
				WEN_CACHE <= '1';
				CACHE_DIN_EN <= '0';
				dirty_bit <= '1'; --dirty bit
				valid_bit <= '1'; --valid bit
				RDY <= '1';
			-- Generating outputs for s3
			when s3 =>
				CACHE_ADD <= index_and_offset;
				WEN_CACHE <= '0';
				CACHE_DOUT_EN <= '1';
				RDY <= '1';
			-- Generating outputs for s4
			when s4 =>
				SDRAM_ADD <= (CPU_ADD AND "1111111111100000");
				WEN_SDRAM <= '0';
				CACHE_DIN_EN <= '1';
				WEN_CACHE <= '1';
				valid_bit <= '1'; --valid bit
			-- Generating outputs for s5
			when s5 =>
				SDRAM_ADD <= (CPU_ADD AND "1111111111100000");
				WEN_SDRAM <= '1';
				CACHE_DOUT_EN <= '0';
		end case;
	end process;

end Behavioral;

