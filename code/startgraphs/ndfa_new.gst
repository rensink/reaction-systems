<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="reactions">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="a">
        </node>
        <edge from="a" to="a">
            <attr name="label">
                <string>id:a</string>
            </attr>
        </edge>
        <edge from="a" to="a">
            <attr name="label">
                <string>type:a</string>
            </attr>
        </edge>
        <edge from="a" to="a">
            <attr name="label">
                <string>let:name="a"</string>
            </attr>
        </edge>
        <node id="b">
        </node>
        <edge from="b" to="b">
            <attr name="label">
                <string>id:b</string>
            </attr>
        </edge>
        <edge from="b" to="b">
            <attr name="label">
                <string>type:b</string>
            </attr>
        </edge>
        <edge from="b" to="b">
            <attr name="label">
                <string>let:name="b"</string>
            </attr>
        </edge>
        <node id="q0">
        </node>
        <edge from="q0" to="q0">
            <attr name="label">
                <string>id:q0</string>
            </attr>
        </edge>
        <edge from="q0" to="q0">
            <attr name="label">
                <string>type:q0</string>
            </attr>
        </edge>
        <edge from="q0" to="q0">
            <attr name="label">
                <string>let:name="q0"</string>
            </attr>
        </edge>
        <node id="q1">
        </node>
        <edge from="q1" to="q1">
            <attr name="label">
                <string>id:q1</string>
            </attr>
        </edge>
        <edge from="q1" to="q1">
            <attr name="label">
                <string>type:q1</string>
            </attr>
        </edge>
        <edge from="q1" to="q1">
            <attr name="label">
                <string>let:name="q1"</string>
            </attr>
        </edge>
        <node id="q2">
        </node>
        <edge from="q2" to="q2">
            <attr name="label">
                <string>id:q2</string>
            </attr>
        </edge>
        <edge from="q2" to="q2">
            <attr name="label">
                <string>type:q2</string>
            </attr>
        </edge>
        <edge from="q2" to="q2">
            <attr name="label">
                <string>let:name="q2"</string>
            </attr>
        </edge>
        <node id="q3">
        </node>
        <edge from="q3" to="q3">
            <attr name="label">
                <string>id:q3</string>
            </attr>
        </edge>
        <edge from="q3" to="q3">
            <attr name="label">
                <string>type:q3</string>
            </attr>
        </edge>
        <edge from="q3" to="q3">
            <attr name="label">
                <string>let:name="q3"</string>
            </attr>
        </edge>
        <node id="q4">
        </node>
        <edge from="q4" to="q4">
            <attr name="label">
                <string>id:q4</string>
            </attr>
        </edge>
        <edge from="q4" to="q4">
            <attr name="label">
                <string>type:q4</string>
            </attr>
        </edge>
        <edge from="q4" to="q4">
            <attr name="label">
                <string>let:name="q4"</string>
            </attr>
        </edge>
        <node id="void">
        </node>
        <edge from="void" to="void">
            <attr name="label">
                <string>id:void</string>
            </attr>
        </edge>
        <edge from="void" to="void">
            <attr name="label">
                <string>type:void</string>
            </attr>
        </edge>
        <edge from="void" to="void">
            <attr name="label">
                <string>let:name="void"</string>
            </attr>
        </edge>
        <edge from="q0" to="q0">
            <attr name="label">
                <string>flag:present</string>
            </attr>
        </edge>
        <node id="react_0">
        </node>
        <edge from="react_0" to="react_0">
            <attr name="label">
                <string>id:react_0</string>
            </attr>
        </edge>
        <edge from="react_0" to="react_0">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_0" to="react_0">
            <attr name="label">
                <string>let:name="react_0"</string>
            </attr>
        </edge>
        <edge from="react_0" to="a">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_0" to="q0">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_0" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_0" to="q0">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_1">
        </node>
        <edge from="react_1" to="react_1">
            <attr name="label">
                <string>id:react_1</string>
            </attr>
        </edge>
        <edge from="react_1" to="react_1">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_1" to="react_1">
            <attr name="label">
                <string>let:name="react_1"</string>
            </attr>
        </edge>
        <edge from="react_1" to="a">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_1" to="q0">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_1" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_1" to="q1">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_2">
        </node>
        <edge from="react_2" to="react_2">
            <attr name="label">
                <string>id:react_2</string>
            </attr>
        </edge>
        <edge from="react_2" to="react_2">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_2" to="react_2">
            <attr name="label">
                <string>let:name="react_2"</string>
            </attr>
        </edge>
        <edge from="react_2" to="a">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_2" to="q1">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_2" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_2" to="q2">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_3">
        </node>
        <edge from="react_3" to="react_3">
            <attr name="label">
                <string>id:react_3</string>
            </attr>
        </edge>
        <edge from="react_3" to="react_3">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_3" to="react_3">
            <attr name="label">
                <string>let:name="react_3"</string>
            </attr>
        </edge>
        <edge from="react_3" to="a">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_3" to="q2">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_3" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_3" to="q3">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_4">
        </node>
        <edge from="react_4" to="react_4">
            <attr name="label">
                <string>id:react_4</string>
            </attr>
        </edge>
        <edge from="react_4" to="react_4">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_4" to="react_4">
            <attr name="label">
                <string>let:name="react_4"</string>
            </attr>
        </edge>
        <edge from="react_4" to="a">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_4" to="q3">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_4" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_4" to="q4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_5">
        </node>
        <edge from="react_5" to="react_5">
            <attr name="label">
                <string>id:react_5</string>
            </attr>
        </edge>
        <edge from="react_5" to="react_5">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_5" to="react_5">
            <attr name="label">
                <string>let:name="react_5"</string>
            </attr>
        </edge>
        <edge from="react_5" to="a">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_5" to="q4">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_5" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_5" to="q4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_6">
        </node>
        <edge from="react_6" to="react_6">
            <attr name="label">
                <string>id:react_6</string>
            </attr>
        </edge>
        <edge from="react_6" to="react_6">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_6" to="react_6">
            <attr name="label">
                <string>let:name="react_6"</string>
            </attr>
        </edge>
        <edge from="react_6" to="b">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_6" to="q0">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_6" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_6" to="q0">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_7">
        </node>
        <edge from="react_7" to="react_7">
            <attr name="label">
                <string>id:react_7</string>
            </attr>
        </edge>
        <edge from="react_7" to="react_7">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_7" to="react_7">
            <attr name="label">
                <string>let:name="react_7"</string>
            </attr>
        </edge>
        <edge from="react_7" to="b">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_7" to="q1">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_7" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_7" to="q2">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_8">
        </node>
        <edge from="react_8" to="react_8">
            <attr name="label">
                <string>id:react_8</string>
            </attr>
        </edge>
        <edge from="react_8" to="react_8">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_8" to="react_8">
            <attr name="label">
                <string>let:name="react_8"</string>
            </attr>
        </edge>
        <edge from="react_8" to="b">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_8" to="q2">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_8" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_8" to="q3">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_9">
        </node>
        <edge from="react_9" to="react_9">
            <attr name="label">
                <string>id:react_9</string>
            </attr>
        </edge>
        <edge from="react_9" to="react_9">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_9" to="react_9">
            <attr name="label">
                <string>let:name="react_9"</string>
            </attr>
        </edge>
        <edge from="react_9" to="b">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_9" to="q3">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_9" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_9" to="q4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="react_10">
        </node>
        <edge from="react_10" to="react_10">
            <attr name="label">
                <string>id:react_10</string>
            </attr>
        </edge>
        <edge from="react_10" to="react_10">
            <attr name="label">
                <string>type:Reaction</string>
            </attr>
        </edge>
        <edge from="react_10" to="react_10">
            <attr name="label">
                <string>let:name="react_10"</string>
            </attr>
        </edge>
        <edge from="react_10" to="b">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_10" to="q4">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_10" to="void">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_10" to="q4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <node id="token_0">
        </node>
        <edge from="token_0" to="token_0">
            <attr name="label">
                <string>id:token_0</string>
            </attr>
        </edge>
        <edge from="token_0" to="token_0">
            <attr name="label">
                <string>type:Token</string>
            </attr>
        </edge>
        <edge from="token_0" to="token_0">
            <attr name="label">
                <string>let:name="token_0"</string>
            </attr>
        </edge>
        <edge from="token_0" to="x">
            <attr name="label">
                <string>current</string>
            </attr>
        </edge>
        <node id="x">
        </node>
        <edge from="x" to="x">
            <attr name="label">
                <string>id:x</string>
            </attr>
        </edge>
        <edge from="x" to="x">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="x" to="x">
            <attr name="label">
                <string>let:name="x"</string>
            </attr>
        </edge>
        <node id="x_0">
        </node>
        <edge from="x_0" to="x_0">
            <attr name="label">
                <string>id:x_0</string>
            </attr>
        </edge>
        <edge from="x_0" to="x_0">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="x_0" to="x_0">
            <attr name="label">
                <string>let:name="x_0"</string>
            </attr>
        </edge>
        <edge from="x_0" to="a">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="x" to="x_0">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="x_0" to="x">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="x_1">
        </node>
        <edge from="x_1" to="x_1">
            <attr name="label">
                <string>id:x_1</string>
            </attr>
        </edge>
        <edge from="x_1" to="x_1">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="x_1" to="x_1">
            <attr name="label">
                <string>let:name="x_1"</string>
            </attr>
        </edge>
        <edge from="x_1" to="b">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="x" to="x_1">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="x_1" to="x">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="nil">
        </node>
        <edge from="nil" to="nil">
            <attr name="label">
                <string>id:nil</string>
            </attr>
        </edge>
        <edge from="nil" to="nil">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="nil" to="nil">
            <attr name="label">
                <string>let:name="nil"</string>
            </attr>
        </edge>
    </graph>
</gxl>
