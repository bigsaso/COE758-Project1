<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_26" />
        <blockdef name="TagCompareDirectMapping">
            <timestamp>2023-10-2T17:18:25</timestamp>
            <rect width="304" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
        </blockdef>
        <blockdef name="CacheControllerFSM">
            <timestamp>2023-10-11T15:44:20</timestamp>
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
        <block symbolname="TagCompareDirectMapping" name="XLXI_1">
            <blockpin name="clk" />
            <blockpin name="CPU_ADD(15:0)" />
            <blockpin signalname="XLXN_26" name="HIT_MISS" />
        </block>
        <block symbolname="CacheControllerFSM" name="XLXI_6">
            <blockpin name="clk" />
            <blockpin name="WR_RD" />
            <blockpin name="CS" />
            <blockpin signalname="XLXN_26" name="HIT_MISS" />
            <blockpin name="CPU_ADD(15:0)" />
            <blockpin name="WEN_CACHE" />
            <blockpin name="CACHE_DIN_EN" />
            <blockpin name="CACHE_DOUT_EN" />
            <blockpin name="WEN_SDRAM" />
            <blockpin name="MSTRB" />
            <blockpin name="RDY" />
            <blockpin name="SDRAM_ADD(15:0)" />
            <blockpin name="CACHE_ADD(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1472" y="1248" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1472" y="2016" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_26">
            <wire x2="1392" y1="1488" y2="1904" x1="1392" />
            <wire x2="1472" y1="1904" y2="1904" x1="1392" />
            <wire x2="1920" y1="1488" y2="1488" x1="1392" />
            <wire x2="1920" y1="1152" y2="1152" x1="1904" />
            <wire x2="1920" y1="1152" y2="1488" x1="1920" />
        </branch>
    </sheet>
</drawing>