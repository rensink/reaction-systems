<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="datamod23-pruned-18">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>363 990 19 19</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>532 991 19 19</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>635 887 19 19</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>531 772 19 19</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>529 605 19 19</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>366 736 19 19</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>200 584 19 19</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>449 443 19 19</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>451 310 19 19</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>216 435 19 19</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>215 305 19 19</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>327 181 19 19</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>327 58 19 19</string>
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
                <string>let:name="x9_0"</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>type:StepOcc</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>let:name="x5_0"</string>
            </attr>
        </edge>
        <edge from="n1" to="n2">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>let:name="il4e"</string>
            </attr>
        </edge>
        <edge from="n2" to="n1">
            <attr name="label">
                <string>depends</string>
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
                <string>let:name="react_19"</string>
            </attr>
        </edge>
        <edge from="n3" to="n0">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n3" to="n2">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n3" to="n2">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n3" to="n4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n3" to="n1">
            <attr name="label">
                <string>predecessor</string>
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
                <string>let:name="il4r"</string>
            </attr>
        </edge>
        <edge from="n4" to="n3">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:StepOcc</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>let:name="x91_0"</string>
            </attr>
        </edge>
        <edge from="n5" to="n0">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n5" to="n0">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n5" to="n6">
            <attr name="label">
                <string>product</string>
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
                <string>let:name="tcr"</string>
            </attr>
        </edge>
        <edge from="n6" to="n5">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>type:ReactionOcc</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>let:name="react_20"</string>
            </attr>
        </edge>
        <edge from="n7" to="n5">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n7" to="n8">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n7" to="n4">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n7" to="n4">
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
                <string>let:name="stat6"</string>
            </attr>
        </edge>
        <edge from="n8" to="n7">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>type:ReactionOcc</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>let:name="react_47"</string>
            </attr>
        </edge>
        <edge from="n9" to="n6">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n9" to="n6">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n9" to="n10">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n9" to="n5">
            <attr name="label">
                <string>predecessor</string>
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
                <string>let:name="nfat"</string>
            </attr>
        </edge>
        <edge from="n10" to="n9">
            <attr name="label">
                <string>depends</string>
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
                <string>let:name="react_30"</string>
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
        <edge from="n11" to="n12">
            <attr name="label">
                <string>product</string>
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
                <string>flag:last</string>
            </attr>
        </edge>
        <edge from="n12" to="n12">
            <attr name="label">
                <string>let:name="Forbidden"</string>
            </attr>
        </edge>
        <edge from="n12" to="n11">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
    </graph>
</gxl>
