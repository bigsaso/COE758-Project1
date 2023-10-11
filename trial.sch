<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(15:0)" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7(16:0)" />
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
        <blockdef name="CacheController">
            <timestamp>2023-10-2T16:49:44</timestamp>
            <rect width="336" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="SDRAMController">
            <timestamp>2023-10-11T14:48:57</timestamp>
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
        <block symbolname="CPU_gen" name="XLXI_1">
            <blockpin name="clk" />
            <blockpin name="rst" />
            <blockpin signalname="XLXN_5" name="trig" />
            <blockpin signalname="XLXN_4" name="wr_rd" />
            <blockpin signalname="XLXN_3" name="cs" />
            <blockpin signalname="XLXN_2(15:0)" name="Address(15:0)" />
            <blockpin name="DOut(7:0)" />
        </block>
        <block symbolname="CacheController" name="XLXI_2">
            <blockpin signalname="XLXN_4" name="WR_RD" />
            <blockpin signalname="XLXN_3" name="CS" />
            <blockpin name="Clk" />
            <blockpin signalname="XLXN_2(15:0)" name="ADD(16:0)" />
            <blockpin name="WEN_SDRAM" />
            <blockpin signalname="XLXN_6" name="MSTRB" />
            <blockpin signalname="XLXN_5" name="RDY" />
            <blockpin name="WEN_CACHE" />
            <blockpin name="CACHE_DOUT_EN" />
            <blockpin name="CACHE_DIN_EN" />
            <blockpin signalname="XLXN_7(16:0)" name="SDRAM_ADD(16:0)" />
            <blockpin name="CACHE_ADD(8:0)" />
        </block>
        <block symbolname="SDRAMController" name="XLXI_3">
            <blockpin signalname="XLXN_4" name="WR_RD" />
            <blockpin signalname="XLXN_6" name="MSTRB" />
            <blockpin name="Clk" />
            <blockpin signalname="XLXN_7(16:0)" name="ADD(15:0)" />
            <blockpin name="DIN(7:0)" />
            <blockpin name="DOUT(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="544" y="992" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1296" y="1248" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_2(15:0)">
            <wire x2="1104" y1="896" y2="896" x1="928" />
            <wire x2="1104" y1="896" y2="1200" x1="1104" />
            <wire x2="1296" y1="1200" y2="1200" x1="1104" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1120" y1="832" y2="832" x1="928" />
            <wire x2="1120" y1="832" y2="912" x1="1120" />
            <wire x2="1296" y1="912" y2="912" x1="1120" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1072" y1="768" y2="768" x1="928" />
            <wire x2="1296" y1="768" y2="768" x1="1072" />
            <wire x2="1824" y1="624" y2="624" x1="1072" />
            <wire x2="1824" y1="624" y2="768" x1="1824" />
            <wire x2="2048" y1="768" y2="768" x1="1824" />
            <wire x2="1072" y1="624" y2="768" x1="1072" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="544" y1="960" y2="960" x1="480" />
            <wire x2="480" y1="960" y2="1328" x1="480" />
            <wire x2="1824" y1="1328" y2="1328" x1="480" />
            <wire x2="1824" y1="896" y2="896" x1="1760" />
            <wire x2="1824" y1="896" y2="1328" x1="1824" />
        </branch>
        <instance x="2048" y="1056" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_6">
            <wire x2="2048" y1="832" y2="832" x1="1760" />
        </branch>
        <branch name="XLXN_7(16:0)">
            <wire x2="1904" y1="1152" y2="1152" x1="1760" />
            <wire x2="1904" y1="960" y2="1152" x1="1904" />
            <wire x2="2048" y1="960" y2="960" x1="1904" />
        </branch>
    </sheet>
</drawing>