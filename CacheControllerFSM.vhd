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

entity CacheControllerFSM is
    Port ( clk : in  STD_LOGIC;
           WR_RD : in  STD_LOGIC;
           CS : in  STD_LOGIC;
			  HIT_MISS : in STD_LOGIC;
           CPU_ADD : in  STD_LOGIC_VECTOR (15 downto 0);
           WEN_CACHE : out  STD_LOGIC;
           CACHE_DIN_EN : out  STD_LOGIC;
           CACHE_DOUT_EN : out  STD_LOGIC;
           WEN_SDRAM : out  STD_LOGIC;
           MSTRB : out  STD_LOGIC;
           RDY : out  STD_LOGIC);
end CacheControllerFSM;

architecture Behavioral of CacheControllerFSM is
	-- FSM state signal
	type state_type is (s0,s1,s2,s3,s4,s5);
	signal yfsm : state_type;
	-- Compare signals
	signal hit_miss : STD_LOGIC;
	-- CPU signals
	signal cpu_add : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal cpu_tag : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal cpu_index : STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal cpu_offset : STD_LOGIC_VECTOR(4 DOWNTO 0);
	signal cpu_wr_rd, cs, rdy : STD_LOGIC;
	signal tag_and_index : STD_LOGIC_VECTOR(10 DOWNTO 0);
	-- Cache SRAM signals
	signal dirty_bit : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	signal valid_bit : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	signal cache_wen : STD_LOGIC;
	-- SDRAM controller signals
	signal sdram_wen : STD_LOGIC;
	signal mstrb : STD_LOGIC;
	-- Multiplexers signals
	signal cache_din_en : STD_LOGIC;
	signal cache_dout_end : STD_LOGIC;
	
begin
	process(clk)
	begin
		if(clk'Event AND clk='1') then
			case ysfm is
				-- Processing s0 - Idle
				when s0 =>
					if(cs = '1') then
						yfsm <= s1;
					else
						yfsm <= s0;
					end if;
				-- Processing s1 - Operating
				when s1 =>
					if(hit_miss='1' AND cpu_wr_rd='1') then
						yfsm <= s2;
					elsif(hit_miss='1' AND cpu_wr_rd='0') then
						yfsm <= s3;
					elsif(hit_miss='0' AND dirty_bit='0') then
						yfsm <= s4;
					elsif(hit_miss='0' AND dirty_bit='1') then
						yfsm <= s5;
					end if;
				-- Processing s2 - Cache hit and write
				when s2 =>
					if(rdy='1') then
						yfsm <= s0;
					else
						yfsm <= s2;
					end if;
				-- Processing s3 - Cache hit and read
				when s3 =>
					if(rdy='1') then
						yfsm <= s0;
					else
						yfsm <= s3;
					end if;
				-- Processing s4 - Cache miss and dirty bit=0
				when s4 =>
					if(mstrb='1' AND cpu_wr_rd='0') then
						yfsm <= s3;
					elsif(mstrb='1' AND cpu_wr_rd='1') then
						yfsm <= s2;
					elsif(mstrb='0') then
						yfsm <= s4;
					end if;
				-- Processing s5 - Cache miss and dirty bit=1
				when s5 =>
				if(mstrb='1') then
					yfsm <= s4;
				else
					yfsm <= s5;
				end if;
			end case;
		end if;
	end process;
	process(yfsm)
	begin
		case yfsm is
			-- Generating outputs for s0
			when s0 =>
				rdy <= '1';
			-- Generating outputs for s1
			when s1 =>
				rdy <= '0';
			-- Generating outputs for s2
			when s2 =>
				cache_wen <= '1';
				cache_din_en <= '0';
				dirty_bit <= '1'; --dirty bit
				valid_bit <= '1'; --valid bit
				rdy <= '1';
			-- Generating outputs for s3
			when s3 =>
				cache_wen <= '0';
				cache_dout_en <= '1';
				rdy <= '1';
			-- Generating outputs for s4
			when s4 =>
				sdram_wen <= '0';
				cache_din_en <= '1';
				cache_wen <= '1';
				valid_bit <= '1'; --valid bit
			-- Generating outputs for s5
			when s5 =>
				sdram_wen <= '1';
				cache_dout_en <= '0';
		end case;
	end process;

end Behavioral;

