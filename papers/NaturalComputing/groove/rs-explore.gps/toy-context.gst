<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="toy-context">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>338 270 19 18</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>340 415 35 18</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>96 55 69 18</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>158 156 32 18</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>115 413 53 18</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>75 276 144 36</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>120 123 27 18</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>271 354 27 18</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>466 284 96 36</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>586 181 27 18</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>400 346 27 18</string>
            </attr>
        </node>
        <node id="n13">
            <attr name="layout">
                <string>583 57 23 18</string>
            </attr>
        </node>
        <node id="n27">
            <attr name="layout">
                <string>302 120 102 36</string>
            </attr>
        </node>
        <node id="n28">
            <attr name="layout">
                <string>414 212 27 18</string>
            </attr>
        </node>
        <node id="n29">
            <attr name="layout">
                <string>238 213 27 18</string>
            </attr>
        </node>
        <node id="n30">
            <attr name="layout">
                <string>583 128 27 18</string>
            </attr>
        </node>
        <node id="n31">
            <attr name="layout">
                <string>519 213 31 18</string>
            </attr>
        </node>
        <node id="n32">
            <attr name="layout">
                <string>594 415 19 18</string>
            </attr>
        </node>
        <node id="n34">
            <attr name="layout">
                <string>331 54 38 18</string>
            </attr>
        </node>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>type:am</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>type:anger</string>
            </attr>
        </edge>
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
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:espresso</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>let:name="getcappuccino"</string>
            </attr>
        </edge>
        <edge from="n7" to="n8">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n7" to="n9">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n8" to="n8">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n8" to="n2">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n8" to="n27">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n9" to="n5">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n9" to="n27">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>246 5 285 363 353 138 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n1">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n10" to="n10">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="n10" to="n10">
            <attr name="label">
                <string>let:name="gettea"</string>
            </attr>
        </edge>
        <edge from="n10" to="n11">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n10" to="n12">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n11" to="n11">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n11" to="n27">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <edge from="n11" to="n32">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n12" to="n12">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n12" to="n27">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>183 0 414 355 353 138 11</string>
            </attr>
        </edge>
        <edge from="n12" to="n32">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="n12" to="n1">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n13" to="n13">
            <attr name="label">
                <string>type:idle</string>
            </attr>
        </edge>
        <edge from="n27" to="n27">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="n27" to="n27">
            <attr name="label">
                <string>let:name="student"</string>
            </attr>
        </edge>
        <edge from="n27" to="n30">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>265 -17 353 138 597 137 11</string>
            </attr>
        </edge>
        <edge from="n27" to="n28">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n27" to="n29">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n28" to="n28">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n28" to="n0">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
            <attr name="layout">
                <string>107 -15 428 221 348 279 11</string>
            </attr>
        </edge>
        <edge from="n28" to="n31">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>478 -15 428 221 535 222 11</string>
            </attr>
        </edge>
        <edge from="n28" to="n10">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <edge from="n29" to="n29">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n29" to="n7">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <edge from="n29" to="n3">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n29" to="n0">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>258 1 252 222 348 279 11</string>
            </attr>
        </edge>
        <edge from="n30" to="n30">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n30" to="n27">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>103 -11 597 137 353 138 11</string>
            </attr>
        </edge>
        <edge from="n30" to="n13">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n31" to="n31">
            <attr name="label">
                <string>type:tcoin</string>
            </attr>
        </edge>
        <edge from="n32" to="n32">
            <attr name="label">
                <string>type:tea</string>
            </attr>
        </edge>
        <edge from="n34" to="n34">
            <attr name="label">
                <string>type:Token</string>
            </attr>
        </edge>
        <edge from="n34" to="n27">
            <attr name="label">
                <string>current</string>
            </attr>
        </edge>
    </graph>
</gxl>
