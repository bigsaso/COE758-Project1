----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:53 10/02/2023 
-- Design Name: 
-- Module Name:    TagCompareDirectMapping - Behavioral 
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

entity TagCompareDirectMapping is
    Port ( CPU_ADD : in  STD_LOGIC_VECTOR (15 downto 0);
		   clk: in STD_LOGIC;
           HIT_MISS : out  STD_LOGIC);
end TagCompareDirectMapping;

architecture Behavioral of TagCompareDirectMapping is
	-- Array of 8 blocks of Cache Memory
	type cachememory is array (7 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal memtag: cachememory := ((others=> (others=>'0')));
	-- CPU signals
	--signal cpu_address : STD_LOGIC_VECTOR (15 downto 0);
	signal cpu_tag : STD_LOGIC_VECTOR(7 DOWNTO 0);-- := CPU_ADD(15 DOWNTO 8);
	signal cpu_index : STD_LOGIC_VECTOR(2 DOWNTO 0);-- := CPU_ADD(7 DOWNTO 5);
	signal cpu_offset : STD_LOGIC_VECTOR(4 DOWNTO 0);-- := CPU_ADD(4 DOWNTO 0);
	-- Hit/Miss signal
	signal is_cache_hit : STD_LOGIC;
	-- Functional simulation signal
	signal trial : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10000000";
begin
	-- Continuous assignment of CPU signals
	cpu_tag <= CPU_ADD(15 DOWNTO 8);
	cpu_index <= CPU_ADD(7 DOWNTO 5);
	cpu_offset <= CPU_ADD(4 DOWNTO 0);
	process(clk)
	begin
		if(clk'Event AND clk='1') then
			-- if(memtag(to_integer(unsigned(cpu_index))) = cpu_tag) then
			if(trial = cpu_tag) then
				HIT_MISS <= '1';
			else
				-- Should a miss add this tag to our array for next time?
				HIT_MISS <= '0';
			end if;
		end if;
	end process;

end Behavioral;

