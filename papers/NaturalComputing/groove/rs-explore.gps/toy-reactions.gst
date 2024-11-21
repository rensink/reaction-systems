<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="toy-reactions">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>373 40 19 19</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>230 37 19 19</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>370 199 52 36</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>74 36 19 19</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>152 206 19 19</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>307 122 19 19</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>145 117 19 19</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>455 123 19 19</string>
            </attr>
        </node>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>type:cappuccino</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>type:ccoin</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>type:cpowder</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>flag:present</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>type:espresso</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>type:nomilk</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="n5" to="n0">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n5" to="n4">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
            <attr name="layout">
                <string>658 2 316 132 161 216 11</string>
            </attr>
        </edge>
        <edge from="n5" to="n1">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n5" to="n2">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="n6" to="n3">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n6" to="n2">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>606 -3 154 127 375 226 11</string>
            </attr>
        </edge>
        <edge from="n6" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>337 6 154 127 161 216 11</string>
            </attr>
        </edge>
        <edge from="n6" to="n1">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="n7" to="n2">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n7" to="n2">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
    </graph>
</gxl>
