<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3(15:0)" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <blockdef name="TagCompareDirectMapping">
            <timestamp>2023-10-2T17:18:25</timestamp>
            <rect width="304" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
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
            <timestamp>2023-10-4T14:47:25</timestamp>
            <rect width="64" x="448" y="20" height="24" />
            <line x2="512" y1="32" y2="32" x1="448" />
            <rect width="64" x="448" y="84" height="24" />
            <line x2="512" y1="96" y2="96" x1="448" />
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
            <rect width="384" x="64" y="-384" height="512" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="TagCompareDirectMapping" name="XLXI_1">
            <blockpin name="clk" />
            <blockpin signalname="XLXN_3(15:0)" name="CPU_ADD(15:0)" />
            <blockpin signalname="XLXN_26" name="HIT_MISS" />
        </block>
        <block symbolname="CPU_gen" name="XLXI_5">
            <blockpin name="clk" />
            <blockpin name="rst" />
            <blockpin signalname="XLXN_27" name="trig" />
            <blockpin signalname="XLXN_14" name="wr_rd" />
            <blockpin signalname="XLXN_13" name="cs" />
            <blockpin signalname="XLXN_3(15:0)" name="Address(15:0)" />
            <blockpin name="DOut(7:0)" />
        </block>
        <block symbolname="CacheControllerFSM" name="XLXI_6">
            <blockpin name="clk" />
            <blockpin signalname="XLXN_14" name="WR_RD" />
            <blockpin signalname="XLXN_13" name="CS" />
            <blockpin signalname="XLXN_26" name="HIT_MISS" />
            <blockpin signalname="XLXN_3(15:0)" name="CPU_ADD(15:0)" />
            <blockpin name="WEN_CACHE" />
            <blockpin name="CACHE_DIN_EN" />
            <blockpin name="CACHE_DOUT_EN" />
            <blockpin name="WEN_SDRAM" />
            <blockpin name="MSTRB" />
            <blockpin signalname="XLXN_28" name="RDY" />
            <blockpin name="SDRAM_ADD(15:0)" />
            <blockpin name="CACHE_ADD(7:0)" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="XLXN_28" name="I0" />
            <blockpin name="I1" />
            <blockpin signalname="XLXN_27" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1472" y="1248" name="XLXI_1" orien="R0">
        </instance>
        <instance x="768" y="1216" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_3(15:0)">
            <wire x2="1312" y1="1120" y2="1120" x1="1152" />
            <wire x2="1312" y1="1120" y2="1216" x1="1312" />
            <wire x2="1328" y1="1216" y2="1216" x1="1312" />
            <wire x2="1472" y1="1216" y2="1216" x1="1328" />
            <wire x2="1328" y1="1216" y2="1984" x1="1328" />
            <wire x2="1472" y1="1984" y2="1984" x1="1328" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1296" y1="992" y2="992" x1="1152" />
            <wire x2="1296" y1="992" y2="1744" x1="1296" />
            <wire x2="1472" y1="1744" y2="1744" x1="1296" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1168" y1="1056" y2="1056" x1="1152" />
            <wire x2="1168" y1="1056" y2="1824" x1="1168" />
            <wire x2="1472" y1="1824" y2="1824" x1="1168" />
        </branch>
        <instance x="1472" y="2016" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_26">
            <wire x2="1392" y1="1488" y2="1904" x1="1392" />
            <wire x2="1472" y1="1904" y2="1904" x1="1392" />
            <wire x2="1920" y1="1488" y2="1488" x1="1392" />
            <wire x2="1920" y1="1152" y2="1152" x1="1904" />
            <wire x2="1920" y1="1152" y2="1488" x1="1920" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="768" y1="1184" y2="1184" x1="736" />
        </branch>
        <instance x="480" y="1280" name="XLXI_7" orien="R0" />
        <branch name="XLXN_28">
            <wire x2="480" y1="1216" y2="1216" x1="400" />
            <wire x2="400" y1="1216" y2="2176" x1="400" />
            <wire x2="2048" y1="2176" y2="2176" x1="400" />
            <wire x2="2048" y1="1984" y2="1984" x1="1984" />
            <wire x2="2048" y1="1984" y2="2176" x1="2048" />
        </branch>
    </sheet>
</drawing>