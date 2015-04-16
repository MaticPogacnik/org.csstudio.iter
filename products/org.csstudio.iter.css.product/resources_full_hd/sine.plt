<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<databrowser>
<xyGraphSettings>
    <axisSettingsList>
        <autoFormat>true</autoFormat>
        <autoScale>true</autoScale>
        <autoScaleThreshold>0.01</autoScaleThreshold>
        <dashGridLine>true</dashGridLine>
        <dateEnabled>true</dateEnabled>
        <foregroundColor>
            <blue>0</blue>
            <green>0</green>
            <red>0</red>
        </foregroundColor>
        <formatPattern>HH:mm:ss</formatPattern>
        <logScale>false</logScale>
        <majorGridColor>
            <blue>200</blue>
            <green>200</green>
            <red>200</red>
        </majorGridColor>
        <onPrimarySide>true</onPrimarySide>
        <range>
            <lower>1.41899456832E12</lower>
            <upper>1.41899458832E12</upper>
        </range>
        <scaleFont>1|DejaVu LGC Sans Mono|20.0|0|GTK|1|</scaleFont>
        <showMajorGrid>false</showMajorGrid>
        <title>Time</title>
        <titleFont>1|DejaVu LGC Sans Mono|26.0|0|GTK|1|</titleFont>
    </axisSettingsList>
    <axisSettingsList>
        <autoFormat>true</autoFormat>
        <autoScale>false</autoScale>
        <autoScaleThreshold>0.1</autoScaleThreshold>
        <dashGridLine>true</dashGridLine>
        <dateEnabled>false</dateEnabled>
        <foregroundColor>
            <blue>0</blue>
            <green>0</green>
            <red>0</red>
        </foregroundColor>
        <formatPattern>############.##</formatPattern>
        <logScale>false</logScale>
        <majorGridColor>
            <blue>200</blue>
            <green>200</green>
            <red>200</red>
        </majorGridColor>
        <onPrimarySide>true</onPrimarySide>
        <range>
            <lower>-5.0</lower>
            <upper>5.0</upper>
        </range>
        <scaleFont>1|DejaVu LGC Sans Mono|20.0|0|GTK|1|</scaleFont>
        <showMajorGrid>false</showMajorGrid>
        <title>sim://sine</title>
        <titleFont>1|DejaVu LGC Sans Mono|26.0|0|GTK|1|</titleFont>
    </axisSettingsList>
    <plotAreaBackColor>
        <blue>235</blue>
        <green>235</green>
        <red>235</red>
    </plotAreaBackColor>
    <showLegend>false</showLegend>
    <showPlotAreaBorder>true</showPlotAreaBorder>
    <showTitle>true</showTitle>
    <title>Data Browser Widget</title>
    <titleColor>
        <blue>0</blue>
        <green>0</green>
        <red>0</red>
    </titleColor>
    <titleFont>1|DejaVu Sans Mono|36.0|0|GTK|1|</titleFont>
    <traceSettingsList>
        <antiAliasing>true</antiAliasing>
        <areaAlpha>100</areaAlpha>
        <baseLine>ZERO</baseLine>
        <drawYErrorInArea>true</drawYErrorInArea>
        <errorBarCapWidth>4</errorBarCapWidth>
        <errorBarColor>
            <blue>196</blue>
            <green>21</green>
            <red>21</red>
        </errorBarColor>
        <errorBarEnabled>true</errorBarEnabled>
        <lineWidth>3</lineWidth>
        <name>sim://sine</name>
        <pointSize>4</pointSize>
        <pointStyle>NONE</pointStyle>
        <traceColor>
            <blue>196</blue>
            <green>21</green>
            <red>21</red>
        </traceColor>
        <traceType>STEP_HORIZONTALLY</traceType>
        <xAxis>0</xAxis>
        <xErrorBarType>BOTH</xErrorBarType>
        <yAxis>0</yAxis>
        <yErrorBarType>BOTH</yErrorBarType>
    </traceSettingsList>
    <transparent>false</transparent>
</xyGraphSettings>
    <scroll>true</scroll>
    <update_period>3.0</update_period>
    <start>-20.0 seconds</start>
    <end>now</end>
    <archive_rescale>NONE</archive_rescale>
    <pvlist>
        <pv>
            <name>sim://sine</name>
            <visible>true</visible>
            <axis>0</axis>
            <waveform_index>0</waveform_index>
            <period>0.0</period>
            <ring_size>5000</ring_size>
            <request>OPTIMIZED</request>
            <archive>
                <name>Archive RDB</name>
                <url>jdbc:postgresql://4501DS-SRV-0001.codac.iter.org/css_archive_3_0_0</url>
                <key>1</key>
            </archive>
        </pv>
    </pvlist>
</databrowser>