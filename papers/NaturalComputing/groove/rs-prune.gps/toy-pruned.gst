<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="toy-pruned">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>230 1004 19 19</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>231 927 19 19</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>577 999 19 19</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>415 674 19 19</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>415 592 19 19</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>233 835 19 19</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>235 764 19 19</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>236 676 19 19</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>237 590 19 19</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>584 675 19 19</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>585 593 19 19</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>248 493 19 19</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>248 416 19 19</string>
            </attr>
        </node>
        <node id="n13">
            <attr name="layout">
                <string>249 323 19 19</string>
            </attr>
        </node>
        <node id="n14">
            <attr name="layout">
                <string>249 243 19 19</string>
            </attr>
        </node>
        <node id="n15">
            <attr name="layout">
                <string>248 151 19 19</string>
            </attr>
        </node>
        <node id="n16">
            <attr name="layout">
                <string>248 68 19 19</string>
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
                <string>408 -34 236 993 237 958 11</string>
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
                <string>495 -31 244 958 244 993 11</string>
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
            <attr name="layout">
                <string>550 -39 424 692 428 613 11</string>
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
            <attr name="layout">
                <string>400 -30 428 613 424 692 11</string>
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
                <string>404 -34 239 824 240 795 11</string>
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
                <string>484 -32 244 774 245 869 11</string>
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
            <attr name="layout">
                <string>500 0 184 691 136 691 135 1014 178 1014 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n0">
            <attr name="label">
                <string>predecessor</string>
            </attr>
            <attr name="layout">
                <string>500 0 184 691 136 691 135 1014 178 1014 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n8">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>517 -29 247 703 246 600 11</string>
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
                <string>398 -35 246 600 247 703 11</string>
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
                <string>492 -30 594 685 597 614 11</string>
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
                <string>475 -34 597 614 594 685 11</string>
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
        <edge from="n11" to="n8">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>404 -4 498 646 418 707 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n8">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>404 -4 498 646 418 707 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n4">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>278 18 313 517 425 517 425 581 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>278 18 313 517 425 517 425 581 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n10">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>500 0 313 503 591 503 591 582 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n10">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>500 0 313 503 591 503 591 582 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n12">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>457 -37 254 482 254 447 11</string>
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
            <attr name="layout">
                <string>514 -36 262 447 262 482 11</string>
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
        <edge from="n13" to="n7">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>500 0 176 337 136 337 135 676 184 676 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n7">
            <attr name="label">
                <string>predecessor</string>
            </attr>
            <attr name="layout">
                <string>500 0 176 337 136 337 135 676 184 676 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n14">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>416 -34 246 355 247 259 11</string>
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
            <attr name="layout">
                <string>528 -33 247 259 246 355 11</string>
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
        <edge from="n15" to="n16">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>495 -35 258 161 257 78 11</string>
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
            <attr name="layout">
                <string>449 -33 257 78 258 161 11</string>
            </attr>
        </edge>
    </graph>
</gxl>
