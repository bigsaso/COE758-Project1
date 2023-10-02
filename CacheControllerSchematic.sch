<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3(15:0)" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_20" />
        <blockdef name="TagCompareDirectMapping">
            <timestamp>2023-10-2T17:18:25</timestamp>
            <rect width="304" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
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
        <blockdef name="CPU_gen">
            <timestamp>2023-10-2T16:20:55</timestamp>
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
        <blockdef name="CacheControllerFSM">
            <timestamp>2023-10-2T17:36:10</timestamp>
            <rect width="384" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="512" y1="-352" y2="-352" x1="448" />
            <line x2="512" y1="-288" y2="-288" x1="448" />
            <line x2="512" y1="-224" y2="-224" x1="448" />
            <line x2="512" y1="-160" y2="-160" x1="448" />
            <line x2="512" y1="-96" y2="-96" x1="448" />
            <line x2="512" y1="-32" y2="-32" x1="448" />
        </blockdef>
        <block symbolname="TagCompareDirectMapping" name="XLXI_1">
            <blockpin name="clk" />
            <blockpin signalname="XLXN_3(15:0)" name="CPU_ADD(15:0)" />
            <blockpin signalname="XLXN_12" name="HIT_MISS" />
        </block>
        <block symbolname="m2_1" name="XLXI_2">
            <blockpin signalname="XLXN_20" name="D0" />
            <blockpin name="D1" />
            <blockpin signalname="XLXN_12" name="S0" />
            <blockpin name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_3">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin signalname="XLXN_12" name="S0" />
            <blockpin name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_4">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="CPU_gen" name="XLXI_5">
            <blockpin name="clk" />
            <blockpin name="rst" />
            <blockpin name="trig" />
            <blockpin signalname="XLXN_14" name="wr_rd" />
            <blockpin signalname="XLXN_13" name="cs" />
            <blockpin signalname="XLXN_3(15:0)" name="Address(15:0)" />
            <blockpin name="DOut(7:0)" />
        </block>
        <block symbolname="CacheControllerFSM" name="XLXI_6">
            <blockpin name="clk" />
            <blockpin signalname="XLXN_14" name="WR_RD" />
            <blockpin signalname="XLXN_13" name="CS" />
            <blockpin signalname="XLXN_12" name="HIT_MISS" />
            <blockpin signalname="XLXN_3(15:0)" name="CPU_ADD(15:0)" />
            <blockpin name="WEN_CACHE" />
            <blockpin name="CACHE_DIN_EN" />
            <blockpin name="CACHE_DOUT_EN" />
            <blockpin name="WEN_SDRAM" />
            <blockpin name="MSTRB" />
            <blockpin name="RDY" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2560" y="1504" name="XLXI_2" orien="R0" />
        <instance x="1472" y="1248" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2560" y="1872" name="XLXI_3" orien="R0" />
        <instance x="768" y="1216" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_3(15:0)">
            <wire x2="1312" y1="1120" y2="1120" x1="1152" />
            <wire x2="1312" y1="1120" y2="1216" x1="1312" />
            <wire x2="1328" y1="1216" y2="1216" x1="1312" />
            <wire x2="1472" y1="1216" y2="1216" x1="1328" />
            <wire x2="1328" y1="1216" y2="1984" x1="1328" />
            <wire x2="1456" y1="1984" y2="1984" x1="1328" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1296" y1="992" y2="992" x1="1152" />
            <wire x2="1296" y1="992" y2="1744" x1="1296" />
            <wire x2="1456" y1="1744" y2="1744" x1="1296" />
        </branch>
        <instance x="1456" y="2016" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_13">
            <wire x2="1168" y1="1056" y2="1056" x1="1152" />
            <wire x2="1168" y1="1056" y2="1824" x1="1168" />
            <wire x2="1456" y1="1824" y2="1824" x1="1168" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1424" y1="1472" y2="1904" x1="1424" />
            <wire x2="1456" y1="1904" y2="1904" x1="1424" />
            <wire x2="2224" y1="1472" y2="1472" x1="1424" />
            <wire x2="2560" y1="1472" y2="1472" x1="2224" />
            <wire x2="2224" y1="1472" y2="1840" x1="2224" />
            <wire x2="2560" y1="1840" y2="1840" x1="2224" />
            <wire x2="2224" y1="1152" y2="1152" x1="1904" />
            <wire x2="2224" y1="1152" y2="1472" x1="2224" />
        </branch>
        <instance x="1840" y="1472" name="XLXI_4" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="2560" y1="1344" y2="1344" x1="2160" />
        </branch>
    </sheet>
</drawing>