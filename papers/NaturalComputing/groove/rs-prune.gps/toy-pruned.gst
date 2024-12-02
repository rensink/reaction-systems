<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="toy-pruned">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>31 1107 114 54</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>281 1073 80 54</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>713 831 96 54</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>520 825 100 54</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>517 723 110 54</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>273 957 100 54</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>283 831 77 54</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>253 729 114 54</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>345 604 89 54</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>714 726 96 54</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>711 624 97 54</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>517 622 100 54</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>391 485 112 54</string>
            </attr>
        </node>
        <node id="n13">
            <attr name="layout">
                <string>266 382 156 54</string>
            </attr>
        </node>
        <node id="n14">
            <attr name="layout">
                <string>299 286 93 54</string>
            </attr>
        </node>
        <node id="n15">
            <attr name="layout">
                <string>292 191 100 54</string>
            </attr>
        </node>
        <node id="n16">
            <attr name="layout">
                <string>282 42 119 72</string>
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
                <string>368 -15 132 912 244 887 11</string>
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
                <string>480 -12 244 895 132 920 11</string>
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
        <edge from="n5" to="n6">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>564 -27 255 729 248 675 11</string>
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
                <string>625 -37 259 675 266 729 11</string>
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
                <string>605 -8 324 726 365 661 11</string>
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
                <string>401 -27 375 661 333 726 11</string>
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
        <edge from="n9" to="n10">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>539 -39 757 723 755 681 11</string>
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
                <string>466 -37 764 681 766 723 11</string>
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
        <edge from="n15" to="n15">
            <attr name="label">
                <string>type:ReactionOcc</string>
            </attr>
        </edge>
        <edge from="n15" to="n15">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n15" to="n15">
            <attr name="label">
                <string>let:name="react_1"</string>
            </attr>
        </edge>
        <edge from="n15" to="n16">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n15" to="n14">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n15" to="n14">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="n16" to="n16">
            <attr name="label">
                <string>type:EntityInst</string>
            </attr>
        </edge>
        <edge from="n16" to="n16">
            <attr name="label">
                <string>flag:in</string>
            </attr>
        </edge>
        <edge from="n16" to="n16">
            <attr name="label">
                <string>flag:last</string>
            </attr>
        </edge>
        <edge from="n16" to="n16">
            <attr name="label">
                <string>let:name="Forbidden"</string>
            </attr>
        </edge>
        <edge from="n16" to="n15">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
    </graph>
</gxl>
