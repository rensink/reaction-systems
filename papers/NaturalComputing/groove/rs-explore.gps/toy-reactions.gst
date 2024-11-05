<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="toy-reactions">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n2">
            <attr name="layout">
                <string>348 41 69 18</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>224 38 32 18</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>370 199 52 36</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>57 37 53 18</string>
            </attr>
        </node>
        <node id="n15">
            <attr name="layout">
                <string>140 207 43 18</string>
            </attr>
        </node>
        <node id="n18">
            <attr name="layout">
                <string>290 123 53 18</string>
            </attr>
        </node>
        <node id="n19">
            <attr name="layout">
                <string>128 118 53 18</string>
            </attr>
        </node>
        <node id="n20">
            <attr name="layout">
                <string>438 124 53 18</string>
            </attr>
        </node>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>type:cappuccino</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>type:ccoin</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>color:0,0,0</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>type:cpowder</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>flag:present</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:espresso</string>
            </attr>
        </edge>
        <edge from="n15" to="n15">
            <attr name="label">
                <string>type:nomilk</string>
            </attr>
        </edge>
        <edge from="n18" to="n18">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="n18" to="n2">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n18" to="n3">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n18" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n18" to="n15">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
            <attr name="layout">
                <string>658 2 299 144 179 225 11</string>
            </attr>
        </edge>
        <edge from="n19" to="n19">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="n19" to="n5">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n19" to="n15">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>337 6 162 139 162 225 11</string>
            </attr>
        </edge>
        <edge from="n19" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>606 -3 181 139 375 226 11</string>
            </attr>
        </edge>
        <edge from="n19" to="n3">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n20" to="n20">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="n20" to="n4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n20" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
    </graph>
</gxl>
