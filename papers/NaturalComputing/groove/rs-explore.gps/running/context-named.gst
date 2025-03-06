<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="running.context-named">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>345 301 19 18</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>335 440 35 18</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>98 42 69 18</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>208 156 32 18</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>155 440 53 18</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>85 283 144 36</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>89 102 150 36</string>
            </attr>
        </node>
        <node id="n7">
            <attr name="layout">
                <string>155 360 156 36</string>
            </attr>
        </node>
        <node id="n8">
            <attr name="layout">
                <string>481 285 96 36</string>
            </attr>
        </node>
        <node id="n9">
            <attr name="layout">
                <string>545 158 108 36</string>
            </attr>
        </node>
        <node id="n10">
            <attr name="layout">
                <string>411 363 108 36</string>
            </attr>
        </node>
        <node id="n11">
            <attr name="layout">
                <string>585 44 23 18</string>
            </attr>
        </node>
        <node id="n12">
            <attr name="layout">
                <string>304 107 102 36</string>
            </attr>
        </node>
        <node id="n13">
            <attr name="layout">
                <string>387 209 114 36</string>
            </attr>
        </node>
        <node id="n14">
            <attr name="layout">
                <string>207 208 114 36</string>
            </attr>
        </node>
        <node id="n15">
            <attr name="layout">
                <string>541 102 114 36</string>
            </attr>
        </node>
        <node id="n16">
            <attr name="layout">
                <string>436 161 31 18</string>
            </attr>
        </node>
        <node id="n17">
            <attr name="layout">
                <string>611 374 19 18</string>
            </attr>
        </node>
        <node id="n18">
            <attr name="layout">
                <string>333 41 38 18</string>
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
        <edge from="n4" to="n4">
            <attr name="label">
                <string>type:espresso</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="n5" to="n6">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>500 0 157 301 132 240 164 120 11</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>let:name="getcappuccino"</string>
            </attr>
        </edge>
        <edge from="n5" to="n7">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>428 18 157 301 233 378 11</string>
            </attr>
        </edge>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>let:name="getcappucino_0"</string>
            </attr>
        </edge>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n6" to="n12">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>407 -11 164 120 355 125 11</string>
            </attr>
        </edge>
        <edge from="n6" to="n2">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>371 30 135 119 132 51 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>let:name="getcappuccino_1"</string>
            </attr>
        </edge>
        <edge from="n7" to="n4">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>421 31 233 378 181 449 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n12">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>74 1 233 378 290 262 344 261 355 125 14</string>
            </attr>
        </edge>
        <edge from="n7" to="n1">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>214 -1 233 378 291 451 352 449 11</string>
            </attr>
        </edge>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n8" to="n8">
            <attr name="label">
                <string>let:name="gettea"</string>
            </attr>
        </edge>
        <edge from="n8" to="n10">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>465 -17 529 303 495 336 465 381 11</string>
            </attr>
        </edge>
        <edge from="n8" to="n8">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="n8" to="n9">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>500 0 529 303 564 240 599 176 11</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n9" to="n12">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>194 -1 599 176 488 140 355 125 14</string>
            </attr>
        </edge>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>let:name="gettea_0"</string>
            </attr>
        </edge>
        <edge from="n9" to="n17">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>253 0 599 176 620 383 11</string>
            </attr>
        </edge>
        <edge from="n10" to="n17">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="n10" to="n1">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>190 0 465 381 425 450 352 449 11</string>
            </attr>
        </edge>
        <edge from="n10" to="n12">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>78 -2 465 381 428 261 362 256 355 125 14</string>
            </attr>
        </edge>
        <edge from="n10" to="n10">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n10" to="n10">
            <attr name="label">
                <string>let:name="gettea_1"</string>
            </attr>
        </edge>
        <edge from="n11" to="n11">
            <attr name="label">
                <string>type:idle</string>
            </attr>
        </edge>
        <edge from="n12" to="n12">
            <attr name="label">
                <string>let:name="student"</string>
            </attr>
        </edge>
        <edge from="n12" to="n13">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>500 0 355 125 395 155 444 227 11</string>
            </attr>
        </edge>
        <edge from="n12" to="n15">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>159 -12 355 125 504 114 598 120 11</string>
            </attr>
        </edge>
        <edge from="n12" to="n12">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="n12" to="n14">
            <attr name="label">
                <string>next</string>
            </attr>
            <attr name="layout">
                <string>500 0 355 125 313 169 264 226 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n13">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n13" to="n13">
            <attr name="label">
                <string>let:name="student_0"</string>
            </attr>
        </edge>
        <edge from="n13" to="n16">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>588 33 444 227 451 170 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n0">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
            <attr name="layout">
                <string>101 -11 444 227 448 311 354 310 11</string>
            </attr>
        </edge>
        <edge from="n13" to="n8">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>372 -22 444 227 491 262 529 303 11</string>
            </attr>
        </edge>
        <edge from="n14" to="n0">
            <attr name="label">
                <string>reactant</string>
            </attr>
            <attr name="layout">
                <string>103 3 264 226 251 310 354 310 11</string>
            </attr>
        </edge>
        <edge from="n14" to="n14">
            <attr name="label">
                <string>let:name="student_1"</string>
            </attr>
        </edge>
        <edge from="n14" to="n14">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n14" to="n5">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>446 24 264 226 216 261 157 301 11</string>
            </attr>
        </edge>
        <edge from="n14" to="n3">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>407 -28 264 226 224 165 11</string>
            </attr>
        </edge>
        <edge from="n15" to="n11">
            <attr name="label">
                <string>product</string>
            </attr>
            <attr name="layout">
                <string>589 -35 596 104 596 53 11</string>
            </attr>
        </edge>
        <edge from="n15" to="n15">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n15" to="n12">
            <attr name="label">
                <string>move</string>
            </attr>
            <attr name="layout">
                <string>163 -13 598 120 355 125 11</string>
            </attr>
        </edge>
        <edge from="n15" to="n15">
            <attr name="label">
                <string>let:name="student_2"</string>
            </attr>
        </edge>
        <edge from="n16" to="n16">
            <attr name="label">
                <string>type:tcoin</string>
            </attr>
        </edge>
        <edge from="n17" to="n17">
            <attr name="label">
                <string>type:tea</string>
            </attr>
        </edge>
        <edge from="n18" to="n12">
            <attr name="label">
                <string>current</string>
            </attr>
        </edge>
        <edge from="n18" to="n18">
            <attr name="label">
                <string>type:Token</string>
            </attr>
        </edge>
    </graph>
</gxl>
