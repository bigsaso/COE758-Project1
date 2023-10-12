
-- VHDL Instantiation Created from source file SDRAMController.vhd -- 16:15:23 10/12/2023
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_SDRAMController: SDRAMController PORT MAP(
		ADD => ,
		WR_RD => ,
		MSTRB => ,
		Clk => ,
		DIN => ,
		DOUT => 
	);


