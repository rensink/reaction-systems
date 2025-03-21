<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="toy-pruned">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>78 1124 19 19</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>311 1090 19 19</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>751 848 19 19</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>560 842 19 19</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>562 740 19 19</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>313 974 19 19</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>312 848 19 19</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>300 746 19 19</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>380 621 19 19</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>752 743 19 19</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>750 641 19 19</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>557 639 19 19</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>437 502 19 19</string>
            </attr>
        </node>
        <node id="n13">
            <attr name="layout">
                <string>334 399 19 19</string>
            </attr>
        </node>
        <node id="n14">
            <attr name="layout">
                <string>336 303 19 19</string>
            </attr>
        </node>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>type:StepOcc</string>
            </attr>
        </edge>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>let:name="student_2"</string>
            </attr>
        </edge>
        <edge from="n0" to="n1">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>368 -15 88 1134 321 1100 11</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>let:name="idle"</string>
            </attr>
        </edge>
        <edge from="n1" to="n0">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>480 -12 321 1100 88 1134 11</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>type:StepOcc</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>let:name="refill_1"</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>type:ReactionOcc</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>let:name="react_4"</string>
            </attr>
        </edge>
        <edge from="n3" to="n4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>let:name="cpowder"</string>
            </attr>
        </edge>
        <edge from="n4" to="n3">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:ReactionOcc</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>let:name="react_5"</string>
            </attr>
        </edge>
        <edge from="n5" to="n6">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>564 -27 323 984 321 858 11</string>
            </attr>
        </edge>
        <edge from="n5" to="n1">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n5" to="n1">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>let:name="am"</string>
            </attr>
        </edge>
        <edge from="n6" to="n5">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>625 -37 321 858 323 984 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>type:StepOcc</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>let:name="student_1"</string>
            </attr>
        </edge>
        <edge from="n7" to="n0">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n7" to="n0">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n7" to="n8">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>605 -8 310 756 389 631 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n6">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n7" to="n6">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n8" to="n8">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n8" to="n8">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n8" to="n8">
            <attr name="label">
                <string>let:name="ccoin"</string>
            </attr>
        </edge>
        <edge from="n8" to="n7">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>401 -27 389 631 310 756 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>type:StepOcc</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>let:name="refill_0"</string>
            </attr>
        </edge>
        <edge from="n9" to="n2">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n9" to="n2">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n9" to="n10">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>539 -39 762 753 759 651 11</string>
            </attr>
        </edge>
        <edge from="n10" to="n10">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n10" to="n10">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n10" to="n10">
            <attr name="label">
                <string>let:name="nomilk"</string>
            </attr>
        </edge>
        <edge from="n10" to="n9">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>466 -37 759 651 762 753 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n11">
            <attr name="label">
                <string>type:ReactionOcc</string>
            </attr>
        </edge>
        <edge from="n11" to="n11">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n11" to="n11">
            <attr name="label">
                <string>let:name="react_3"</string>
            </attr>
        </edge>
        <edge from="n11" to="n4">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n11" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n11" to="n10">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n11" to="n10">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n11" to="n8">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n11" to="n8">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n11" to="n12">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n12" to="n12">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n12" to="n12">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n12" to="n12">
            <attr name="label">
                <string>let:name="espresso"</string>
            </attr>
        </edge>
        <edge from="n12" to="n11">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n13" to="n13">
            <attr name="label">
                <string>type:StepOcc</string>
            </attr>
        </edge>
        <edge from="n13" to="n13">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n13" to="n13">
            <attr name="label">
                <string>let:name="getcappuccino_1"</string>
            </attr>
        </edge>
        <edge from="n13" to="n7">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n13" to="n7">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n13" to="n12">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n13" to="n12">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n13" to="n14">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n14" to="n14">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n14" to="n14">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n14" to="n14">
            <attr name="label">
                <string>let:name="anger"</string>
            </attr>
        </edge>
        <edge from="n14" to="n13">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
    </graph>
</gxl>
