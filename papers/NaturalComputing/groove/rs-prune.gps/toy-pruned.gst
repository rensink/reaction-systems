<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="toy-pruned">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>336 943 19 19</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>336 856 19 19</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>656 942 19 19</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>501 586 19 19</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>501 504 19 19</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>334 764 19 19</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>334 686 19 19</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>336 587 19 19</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>336 508 19 19</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>660 583 19 19</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>659 504 19 19</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>334 404 19 19</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>333 325 19 19</string>
            </attr>
        </node>
        <node id="n13">
            <attr name="layout">
                <string>334 223 19 19</string>
            </attr>
        </node>
        <node id="n14">
            <attr name="layout">
                <string>335 143 19 19</string>
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
                <string>539 -33 339 934 341 886 11</string>
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
                <string>433 -35 348 886 346 934 11</string>
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
                <string>501 -32 505 672 506 608 11</string>
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
                <string>470 -33 514 608 513 672 11</string>
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
            <attr name="layout">
                <string>430 3 345 794 345 844 11</string>
            </attr>
        </edge>
        <edge from="n5" to="n1">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>430 3 345 794 345 844 11</string>
            </attr>
        </edge>
        <edge from="n5" to="n6">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>541 -32 339 752 339 716 11</string>
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
                <string>402 -31 347 716 347 752 11</string>
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
            <attr name="layout">
                <string>430 0 343 617 343 674 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n6">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>430 0 343 617 343 674 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n0">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>500 0 283 595 224 595 223 951 283 951 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n0">
            <attr name="label">
                <string>predecessor</string>
            </attr>
            <attr name="layout">
                <string>500 0 283 595 224 595 223 951 283 951 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n8">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>554 -35 341 575 341 538 11</string>
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
                <string>391 -34 349 538 349 575 11</string>
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
            <attr name="layout">
                <string>422 1 666 613 666 671 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n2">
            <attr name="label">
                <string>predecessor</string>
            </attr>
            <attr name="layout">
                <string>422 1 666 613 666 671 11</string>
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
            <attr name="layout">
                <string>780 3 398 424 510 424 510 492 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>780 3 398 424 510 424 510 492 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n10">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>865 1 398 405 664 405 664 492 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n10">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>865 1 398 405 664 405 664 492 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n8">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>398 2 344 453 344 517 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n8">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>398 2 344 453 344 517 11</string>
            </attr>
        </edge>
        <edge from="n11" to="n12">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>491 -36 338 411 338 355 11</string>
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
                <string>383 -34 346 355 347 392 11</string>
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
            <attr name="layout">
                <string>425 3 342 253 342 313 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n12">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>425 3 342 253 342 313 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n14">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>560 -33 339 211 339 119 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n7">
            <attr name="label">
                <string>depends</string>
            </attr>
            <attr name="layout">
                <string>500 0 260 226 225 226 224 583 283 583 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n7">
            <attr name="label">
                <string>predecessor</string>
            </attr>
            <attr name="layout">
                <string>500 0 260 226 225 226 224 583 283 583 11</string>
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
                <string>418 -34 347 119 347 211 11</string>
            </attr>
        </edge>
    </graph>
</gxl>
