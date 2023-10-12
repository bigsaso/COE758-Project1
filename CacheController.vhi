
-- VHDL Instantiation Created from source file CacheController.vhd -- 16:15:52 10/12/2023
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_CacheController: CacheController PORT MAP(
		clk => ,
		WR_RD => ,
		CS => ,
		CPU_ADD => ,
		SDRAM_ADD => ,
		CACHE_ADD => ,
		WEN_CACHE => ,
		CACHE_DIN_EN => ,
		CACHE_DOUT_EN => ,
		WEN_SDRAM => ,
		MSTRB => ,
		RDY => 
	);


