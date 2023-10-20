<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3(15:0)" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5(15:0)" />
        <signal name="XLXN_6" />
        <signal name="XLXN_8(7:0)" />
        <signal name="XLXN_9(0:0)" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12(7:0)" />
        <signal name="XLXN_13(7:0)" />
        <signal name="XLXN_14(7:0)" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_18(7:0)" />
        <signal name="XLXN_19(7:0)" />
        <signal name="XLXN_20" />
        <signal name="XLXN_22(7:0)" />
        <blockdef name="CacheControllerFSM">
            <timestamp>2023-10-20T2:31:15</timestamp>
            <line x2="512" y1="352" y2="352" x1="448" />
            <rect width="64" x="448" y="404" height="24" />
            <line x2="512" y1="416" y2="416" x1="448" />
            <line x2="512" y1="160" y2="160" x1="448" />
            <line x2="512" y1="224" y2="224" x1="448" />
            <line x2="512" y1="288" y2="288" x1="448" />
            <rect width="64" x="448" y="20" height="24" />
            <line x2="512" y1="32" y2="32" x1="448" />
            <rect width="64" x="448" y="84" height="24" />
            <line x2="512" y1="96" y2="96" x1="448" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
            <rect width="384" x="64" y="-384" height="832" />
        </blockdef>
        <blockdef name="SDRAMController">
            <timestamp>2023-10-20T2:31:21</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="CPU_gen">
            <timestamp>2023-10-19T23:31:37</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="sram">
            <timestamp>2023-10-19T23:31:39</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" style="linewidth:W" x1="0" />
            <line x2="32" y1="208" y2="208" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <block symbolname="CPU_gen" name="XLXI_4">
            <blockpin name="clk" />
            <blockpin name="rst" />
            <blockpin signalname="XLXN_6" name="trig" />
            <blockpin signalname="XLXN_1" name="wr_rd" />
            <blockpin signalname="XLXN_2" name="cs" />
            <blockpin signalname="XLXN_3(15:0)" name="Address(15:0)" />
            <blockpin signalname="XLXN_13(7:0)" name="DOut(7:0)" />
        </block>
        <block symbolname="CacheControllerFSM" name="XLXI_5">
            <blockpin name="clk" />
            <blockpin signalname="XLXN_1" name="WR_RD" />
            <blockpin signalname="XLXN_2" name="CS" />
            <blockpin signalname="XLXN_3(15:0)" name="CPU_ADD(15:0)" />
            <blockpin signalname="XLXN_9(0:0)" name="CACHE_WEN" />
            <blockpin signalname="XLXN_15" name="CACHE_DIN_WEN" />
            <blockpin signalname="XLXN_16" name="CACHE_DOUT_WEN" />
            <blockpin signalname="XLXN_4" name="WEN_SDRAM" />
            <blockpin signalname="XLXN_6" name="RDY" />
            <blockpin signalname="XLXN_5(15:0)" name="SDRAM_ADD(15:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="CACHE_ADD(7:0)" />
            <blockpin signalname="XLXN_20" name="MEMSTRB" />
            <blockpin name="DEBUG(31:0)" />
        </block>
        <block symbolname="SDRAMController" name="XLXI_6">
            <blockpin signalname="XLXN_4" name="WR_RD" />
            <blockpin signalname="XLXN_20" name="MSTRB" />
            <blockpin name="Clk" />
            <blockpin signalname="XLXN_5(15:0)" name="ADD(15:0)" />
            <blockpin signalname="XLXN_19(7:0)" name="DIN(7:0)" />
            <blockpin signalname="XLXN_14(7:0)" name="DOUT(7:0)" />
        </block>
        <block symbolname="sram" name="XLXI_7">
            <blockpin signalname="XLXN_8(7:0)" name="addra(7:0)" />
            <blockpin signalname="XLXN_12(7:0)" name="dina(7:0)" />
            <blockpin signalname="XLXN_9(0:0)" name="wea(0:0)" />
            <blockpin name="clka" />
            <blockpin signalname="XLXN_18(7:0)" name="douta(7:0)" />
        </block>
        <block symbolname="m2_1" name="XLXI_11">
            <blockpin signalname="XLXN_13(7:0)" name="D0" />
            <blockpin signalname="XLXN_14(7:0)" name="D1" />
            <blockpin signalname="XLXN_15" name="S0" />
            <blockpin signalname="XLXN_12(7:0)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_12">
            <blockpin signalname="XLXN_19(7:0)" name="D0" />
            <blockpin name="D1" />
            <blockpin signalname="XLXN_16" name="S0" />
            <blockpin signalname="XLXN_18(7:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1504" y="768" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1504" y1="496" y2="496" x1="1200" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1488" y1="560" y2="560" x1="1200" />
            <wire x2="1488" y1="560" y2="576" x1="1488" />
            <wire x2="1504" y1="576" y2="576" x1="1488" />
        </branch>
        <branch name="XLXN_3(15:0)">
            <wire x2="1488" y1="624" y2="624" x1="1200" />
            <wire x2="1488" y1="624" y2="736" x1="1488" />
            <wire x2="1504" y1="736" y2="736" x1="1488" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2272" y1="608" y2="608" x1="2016" />
        </branch>
        <branch name="XLXN_5(15:0)">
            <wire x2="2272" y1="800" y2="800" x1="2016" />
        </branch>
        <instance x="1472" y="1248" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_8(7:0)">
            <wire x2="1392" y1="1232" y2="1328" x1="1392" />
            <wire x2="1472" y1="1328" y2="1328" x1="1392" />
            <wire x2="2096" y1="1232" y2="1232" x1="1392" />
            <wire x2="2096" y1="864" y2="864" x1="2016" />
            <wire x2="2096" y1="864" y2="1232" x1="2096" />
        </branch>
        <branch name="XLXN_9(0:0)">
            <wire x2="1408" y1="1248" y2="1456" x1="1408" />
            <wire x2="1472" y1="1456" y2="1456" x1="1408" />
            <wire x2="2080" y1="1248" y2="1248" x1="1408" />
            <wire x2="2080" y1="928" y2="928" x1="2016" />
            <wire x2="2080" y1="928" y2="1248" x1="2080" />
        </branch>
        <instance x="912" y="1488" name="XLXI_11" orien="R0" />
        <branch name="XLXN_12(7:0)">
            <wire x2="1472" y1="1360" y2="1360" x1="1232" />
        </branch>
        <branch name="XLXN_13(7:0)">
            <wire x2="896" y1="1232" y2="1328" x1="896" />
            <wire x2="912" y1="1328" y2="1328" x1="896" />
            <wire x2="1248" y1="1232" y2="1232" x1="896" />
            <wire x2="1248" y1="688" y2="688" x1="1200" />
            <wire x2="1248" y1="688" y2="1232" x1="1248" />
        </branch>
        <branch name="XLXN_14(7:0)">
            <wire x2="672" y1="192" y2="1392" x1="672" />
            <wire x2="912" y1="1392" y2="1392" x1="672" />
            <wire x2="2736" y1="192" y2="192" x1="672" />
            <wire x2="2736" y1="192" y2="608" x1="2736" />
            <wire x2="2736" y1="608" y2="608" x1="2656" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="592" y1="128" y2="1456" x1="592" />
            <wire x2="912" y1="1456" y2="1456" x1="592" />
            <wire x2="2160" y1="128" y2="128" x1="592" />
            <wire x2="2160" y1="128" y2="992" x1="2160" />
            <wire x2="2160" y1="992" y2="992" x1="2016" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="2128" y1="1056" y2="1056" x1="2016" />
            <wire x2="2128" y1="1056" y2="1568" x1="2128" />
            <wire x2="2240" y1="1568" y2="1568" x1="2128" />
        </branch>
        <instance x="2240" y="1600" name="XLXI_12" orien="R0" />
        <branch name="XLXN_18(7:0)">
            <wire x2="2592" y1="1328" y2="1328" x1="2048" />
            <wire x2="2592" y1="1328" y2="1472" x1="2592" />
            <wire x2="2592" y1="1472" y2="1472" x1="2560" />
        </branch>
        <branch name="XLXN_19(7:0)">
            <wire x2="2272" y1="864" y2="864" x1="2224" />
            <wire x2="2224" y1="864" y2="1440" x1="2224" />
            <wire x2="2240" y1="1440" y2="1440" x1="2224" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="2176" y1="1120" y2="1120" x1="2016" />
            <wire x2="2176" y1="672" y2="1120" x1="2176" />
            <wire x2="2272" y1="672" y2="672" x1="2176" />
        </branch>
        <instance x="816" y="720" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_6">
            <wire x2="2032" y1="272" y2="272" x1="736" />
            <wire x2="2032" y1="272" y2="736" x1="2032" />
            <wire x2="736" y1="272" y2="688" x1="736" />
            <wire x2="816" y1="688" y2="688" x1="736" />
            <wire x2="2032" y1="736" y2="736" x1="2016" />
        </branch>
        <instance x="2272" y="896" name="XLXI_6" orien="R0">
        </instance>
    </sheet>
</drawing>