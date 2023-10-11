
-- VHDL Instantiation Created from source file TagCompareDirectMapping.vhd -- 11:52:25 10/11/2023
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT TagCompareDirectMapping
	PORT(
		CPU_ADD : IN std_logic_vector(15 downto 0);
		clk : IN std_logic;          
		HIT_MISS : OUT std_logic
		);
	END COMPONENT;

	Inst_TagCompareDirectMapping: TagCompareDirectMapping PORT MAP(
		CPU_ADD => ,
		clk => ,
		HIT_MISS => 
	);


