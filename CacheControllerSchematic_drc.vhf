--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.4
--  \   \         Application : sch2hdl
--  /   /         Filename : CacheControllerSchematic_drc.vhf
-- /___/   /\     Timestamp : 10/11/2023 11:44:44
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /CMC/tools/xilinx/13.4/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -sympath /home/student2/slogozzo/COE758/Project1/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl CacheControllerSchematic_drc.vhf -w /home/student2/slogozzo/COE758/Project1/CacheControllerSchematic.sch
--Design Name: CacheControllerSchematic
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CacheControllerSchematic is
   port ( );
end CacheControllerSchematic;

architecture BEHAVIORAL of CacheControllerSchematic is
   signal XLXN_26                   : std_logic;
   signal XLXI_1_clk_openSignal     : std_logic;
   signal XLXI_1_CPU_ADD_openSignal : std_logic_vector (15 downto 0);
   signal XLXI_6_clk_openSignal     : std_logic;
   signal XLXI_6_CPU_ADD_openSignal : std_logic_vector (15 downto 0);
   signal XLXI_6_CS_openSignal      : std_logic;
   signal XLXI_6_WR_RD_openSignal   : std_logic;
   component TagCompareDirectMapping
      port ( clk      : in    std_logic; 
             CPU_ADD  : in    std_logic_vector (15 downto 0); 
             HIT_MISS : out   std_logic);
   end component;
   
   component CacheControllerFSM
      port ( clk           : in    std_logic; 
             WR_RD         : in    std_logic; 
             CS            : in    std_logic; 
             HIT_MISS      : in    std_logic; 
             CPU_ADD       : in    std_logic_vector (15 downto 0); 
             WEN_CACHE     : out   std_logic; 
             CACHE_DIN_EN  : out   std_logic; 
             CACHE_DOUT_EN : out   std_logic; 
             WEN_SDRAM     : out   std_logic; 
             MSTRB         : out   std_logic; 
             RDY           : out   std_logic; 
             SDRAM_ADD     : out   std_logic_vector (15 downto 0); 
             CACHE_ADD     : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXI_1 : TagCompareDirectMapping
      port map (clk=>XLXI_1_clk_openSignal,
                CPU_ADD(15 downto 0)=>XLXI_1_CPU_ADD_openSignal(15 downto 0),
                HIT_MISS=>XLXN_26);
   
   XLXI_6 : CacheControllerFSM
      port map (clk=>XLXI_6_clk_openSignal,
                CPU_ADD(15 downto 0)=>XLXI_6_CPU_ADD_openSignal(15 downto 0),
                CS=>XLXI_6_CS_openSignal,
                HIT_MISS=>XLXN_26,
                WR_RD=>XLXI_6_WR_RD_openSignal,
                CACHE_ADD=>open,
                CACHE_DIN_EN=>open,
                CACHE_DOUT_EN=>open,
                MSTRB=>open,
                RDY=>open,
                SDRAM_ADD=>open,
                WEN_CACHE=>open,
                WEN_SDRAM=>open);
   
end BEHAVIORAL;


