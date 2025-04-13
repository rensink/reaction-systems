<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="running-pruned">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>417 999 19 19</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>416 912 19 19</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>570 1000 19 19</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>706 647 19 19</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>707 560 19 19</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>417 818 19 19</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>417 740 19 19</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>571 647 19 19</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>570 560 19 19</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>427 646 19 19</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>427 561 19 19</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>421 467 19 19</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>421 387 19 19</string>
            </attr>
        </node>
        <node id="n13">
            <attr name="layout">
                <string>420 298 19 19</string>
            </attr>
        </node>
        <node id="n14">
            <attr name="layout">
                <string>420 213 19 19</string>
            </attr>
        </node>
        <node id="n15">
            <attr name="layout">
                <string>418 121 19 19</string>
            </attr>
        </node>
        <node id="n16">
            <attr name="layout">
                <string>418 33 19 19</string>
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
                <string>let:name="refill_0"</string>
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
        <edge from="n3" to="n0">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n3" to="n2">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n3" to="n4">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>435 -33 709 633 708 585 11</string>
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
                <string>492 -31 745 642 750 749 11</string>
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
        <edge from="n5" to="n2">
            <attr name="label">
                <string>predecessor</string>
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
            <attr name="layout">
                <string>437 -31 426 845 426 750 11</string>
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
                <string>494 -31 426 750 426 845 11</string>
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
                <string>let:name="refill_0"</string>
            </attr>
        </edge>
        <edge from="n7" to="n2">
            <attr name="label">
                <string>depends</string>
            </attr>
        </edge>
        <edge from="n7" to="n2">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n7" to="n8">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>498 -30 577 633 576 584 11</string>
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
                <string>let:name="nomilk"</string>
            </attr>
        </edge>
        <edge from="n8" to="n7">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>476 -32 584 644 590 748 11</string>
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
                <string>let:name="student_1"</string>
            </attr>
        </edge>
        <edge from="n9" to="n10">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>446 -28 432 635 433 592 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n6">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>377 0 426 677 426 729 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n6">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>377 0 426 677 426 729 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n0">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>456 0 374 664 328 664 328 1005 365 1005 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n0">
            <attr name="label">
                <string>predecessor</string>
            </attr>
            <attr name="layout">
                <string>456 0 374 664 328 664 328 1005 365 1005 11</string>
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
                <string>let:name="ccoin"</string>
            </attr>
        </edge>
        <edge from="n10" to="n9">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>426 -30 441 592 440 635 11</string>
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
            <attr name="layout">
                <string>545 -2 486 469 708 469 708 543 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>545 -2 486 469 708 469 708 543 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n8">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>768 1 486 486 578 486 578 548 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n8">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>768 1 486 486 578 486 578 548 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n9">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n11" to="n7">
            <attr name="label">
                <string>predecessor</string>
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
            <attr name="layout">
                <string>447 -31 427 456 427 417 11</string>
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
                <string>500 -27 435 417 435 456 11</string>
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
        <edge from="n13" to="n14">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>411 -32 426 286 426 244 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n9">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>500 0 347 309 331 309 329 646 374 646 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n9">
            <attr name="label">
                <string>predecessor</string>
            </attr>
            <attr name="layout">
                <string>500 0 347 309 331 309 329 646 374 646 11</string>
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
                <string>437 -32 429 216 430 324 11</string>
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
        <edge from="n15" to="n13">
            <attr name="label">
                <string>predecessor</string>
            </attr>
        </edge>
        <edge from="n15" to="n16">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>464 -33 424 110 425 60 11</string>
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
                <string>let:name="bang"</string>
            </attr>
        </edge>
        <edge from="n16" to="n15">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>518 -34 429 38 428 131 11</string>
            </attr>
        </edge>
    </graph>
</gxl>
