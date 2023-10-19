
-- VHDL Instantiation Created from source file CacheControllerFSM.vhd -- 19:41:59 10/19/2023
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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
		DEBUG : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_CacheControllerFSM: CacheControllerFSM PORT MAP(
		clk => ,
		WR_RD => ,
		CS => ,
		CPU_ADD => ,
		SDRAM_ADD => ,
		CACHE_ADD => ,
		CACHE_WEN => ,
		CACHE_DIN_WEN => ,
		CACHE_DOUT_WEN => ,
		WEN_SDRAM => ,
		MEMSTRB => ,
		RDY => ,
		DEBUG => 
	);


