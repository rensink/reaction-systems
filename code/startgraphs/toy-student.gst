<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="reactions">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="anger">
        </node>
        <edge from="anger" to="anger">
            <attr name="label">
                <string>id:anger</string>
            </attr>
        </edge>
        <edge from="anger" to="anger">
            <attr name="label">
                <string>type:anger</string>
            </attr>
        </edge>
        <edge from="anger" to="anger">
            <attr name="label">
                <string>let:name="anger"</string>
            </attr>
        </edge>
        <node id="cappuccino">
        </node>
        <edge from="cappuccino" to="cappuccino">
            <attr name="label">
                <string>id:cappuccino</string>
            </attr>
        </edge>
        <edge from="cappuccino" to="cappuccino">
            <attr name="label">
                <string>type:cappuccino</string>
            </attr>
        </edge>
        <edge from="cappuccino" to="cappuccino">
            <attr name="label">
                <string>let:name="cappuccino"</string>
            </attr>
        </edge>
        <node id="ccoin">
        </node>
        <edge from="ccoin" to="ccoin">
            <attr name="label">
                <string>id:ccoin</string>
            </attr>
        </edge>
        <edge from="ccoin" to="ccoin">
            <attr name="label">
                <string>type:ccoin</string>
            </attr>
        </edge>
        <edge from="ccoin" to="ccoin">
            <attr name="label">
                <string>let:name="ccoin"</string>
            </attr>
        </edge>
        <node id="cpowder">
        </node>
        <edge from="cpowder" to="cpowder">
            <attr name="label">
                <string>id:cpowder</string>
            </attr>
        </edge>
        <edge from="cpowder" to="cpowder">
            <attr name="label">
                <string>type:cpowder</string>
            </attr>
        </edge>
        <edge from="cpowder" to="cpowder">
            <attr name="label">
                <string>let:name="cpowder"</string>
            </attr>
        </edge>
        <node id="danger">
        </node>
        <edge from="danger" to="danger">
            <attr name="label">
                <string>id:danger</string>
            </attr>
        </edge>
        <edge from="danger" to="danger">
            <attr name="label">
                <string>type:danger</string>
            </attr>
        </edge>
        <edge from="danger" to="danger">
            <attr name="label">
                <string>let:name="danger"</string>
            </attr>
        </edge>
        <node id="idle">
        </node>
        <edge from="idle" to="idle">
            <attr name="label">
                <string>id:idle</string>
            </attr>
        </edge>
        <edge from="idle" to="idle">
            <attr name="label">
                <string>type:idle</string>
            </attr>
        </edge>
        <edge from="idle" to="idle">
            <attr name="label">
                <string>let:name="idle"</string>
            </attr>
        </edge>
        <node id="milk">
        </node>
        <edge from="milk" to="milk">
            <attr name="label">
                <string>id:milk</string>
            </attr>
        </edge>
        <edge from="milk" to="milk">
            <attr name="label">
                <string>type:milk</string>
            </attr>
        </edge>
        <edge from="milk" to="milk">
            <attr name="label">
                <string>let:name="milk"</string>
            </attr>
        </edge>
        <node id="pm">
        </node>
        <edge from="pm" to="pm">
            <attr name="label">
                <string>id:pm</string>
            </attr>
        </edge>
        <edge from="pm" to="pm">
            <attr name="label">
                <string>type:pm</string>
            </attr>
        </edge>
        <edge from="pm" to="pm">
            <attr name="label">
                <string>let:name="pm"</string>
            </attr>
        </edge>
        <node id="tcoin">
        </node>
        <edge from="tcoin" to="tcoin">
            <attr name="label">
                <string>id:tcoin</string>
            </attr>
        </edge>
        <edge from="tcoin" to="tcoin">
            <attr name="label">
                <string>type:tcoin</string>
            </attr>
        </edge>
        <edge from="tcoin" to="tcoin">
            <attr name="label">
                <string>let:name="tcoin"</string>
            </attr>
        </edge>
        <node id="tea">
        </node>
        <edge from="tea" to="tea">
            <attr name="label">
                <string>id:tea</string>
            </attr>
        </edge>
        <edge from="tea" to="tea">
            <attr name="label">
                <string>type:tea</string>
            </attr>
        </edge>
        <edge from="tea" to="tea">
            <attr name="label">
                <string>let:name="tea"</string>
            </attr>
        </edge>
        <node id="tpowder">
        </node>
        <edge from="tpowder" to="tpowder">
            <attr name="label">
                <string>id:tpowder</string>
            </attr>
        </edge>
        <edge from="tpowder" to="tpowder">
            <attr name="label">
                <string>type:tpowder</string>
            </attr>
        </edge>
        <edge from="tpowder" to="tpowder">
            <attr name="label">
                <string>let:name="tpowder"</string>
            </attr>
        </edge>
        <edge from="cpowder" to="cpowder">
            <attr name="label">
                <string>flag:present</string>
            </attr>
        </edge>
        <edge from="tpowder" to="tpowder">
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
        <edge from="react_0" to="anger">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_0" to="danger">
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
        <edge from="react_1" to="ccoin">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_1" to="cpowder">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_1" to="milk">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_1" to="cappuccino">
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
        <edge from="react_2" to="cpowder">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_2" to="cpowder">
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
        <edge from="react_3" to="idle">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_3" to="pm">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_3" to="pm">
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
        <edge from="react_4" to="pm">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_4" to="idle">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="react_4" to="pm">
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
        <edge from="react_5" to="tcoin">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_5" to="tpowder">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_5" to="tea">
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
        <edge from="react_6" to="tpowder">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="react_6" to="tpowder">
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
        <edge from="token_0" to="refill">
            <attr name="label">
                <string>current</string>
            </attr>
        </edge>
        <node id="token_1">
        </node>
        <edge from="token_1" to="token_1">
            <attr name="label">
                <string>id:token_1</string>
            </attr>
        </edge>
        <edge from="token_1" to="token_1">
            <attr name="label">
                <string>type:Token</string>
            </attr>
        </edge>
        <edge from="token_1" to="token_1">
            <attr name="label">
                <string>let:name="token_1"</string>
            </attr>
        </edge>
        <edge from="token_1" to="student">
            <attr name="label">
                <string>current</string>
            </attr>
        </edge>
        <node id="getcappuccino">
        </node>
        <edge from="getcappuccino" to="getcappuccino">
            <attr name="label">
                <string>id:getcappuccino</string>
            </attr>
        </edge>
        <edge from="getcappuccino" to="getcappuccino">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="getcappuccino" to="getcappuccino">
            <attr name="label">
                <string>let:name="getcappuccino"</string>
            </attr>
        </edge>
        <node id="getcappuccino_0">
        </node>
        <edge from="getcappuccino_0" to="getcappuccino_0">
            <attr name="label">
                <string>id:getcappuccino_0</string>
            </attr>
        </edge>
        <edge from="getcappuccino_0" to="getcappuccino_0">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="getcappuccino_0" to="getcappuccino_0">
            <attr name="label">
                <string>let:name="getcappuccino_0"</string>
            </attr>
        </edge>
        <edge from="getcappuccino_0" to="cappuccino">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="getcappuccino" to="getcappuccino_0">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="getcappuccino_0" to="student">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="getcappuccino_1">
        </node>
        <edge from="getcappuccino_1" to="getcappuccino_1">
            <attr name="label">
                <string>id:getcappuccino_1</string>
            </attr>
        </edge>
        <edge from="getcappuccino_1" to="getcappuccino_1">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="getcappuccino_1" to="getcappuccino_1">
            <attr name="label">
                <string>let:name="getcappuccino_1"</string>
            </attr>
        </edge>
        <edge from="getcappuccino_1" to="cappuccino">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="getcappuccino_1" to="anger">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="getcappuccino" to="getcappuccino_1">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="getcappuccino_1" to="getcappuccino">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="gettea">
        </node>
        <edge from="gettea" to="gettea">
            <attr name="label">
                <string>id:gettea</string>
            </attr>
        </edge>
        <edge from="gettea" to="gettea">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="gettea" to="gettea">
            <attr name="label">
                <string>let:name="gettea"</string>
            </attr>
        </edge>
        <node id="gettea_0">
        </node>
        <edge from="gettea_0" to="gettea_0">
            <attr name="label">
                <string>id:gettea_0</string>
            </attr>
        </edge>
        <edge from="gettea_0" to="gettea_0">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="gettea_0" to="gettea_0">
            <attr name="label">
                <string>let:name="gettea_0"</string>
            </attr>
        </edge>
        <edge from="gettea_0" to="tea">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="gettea" to="gettea_0">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="gettea_0" to="student">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="gettea_1">
        </node>
        <edge from="gettea_1" to="gettea_1">
            <attr name="label">
                <string>id:gettea_1</string>
            </attr>
        </edge>
        <edge from="gettea_1" to="gettea_1">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="gettea_1" to="gettea_1">
            <attr name="label">
                <string>let:name="gettea_1"</string>
            </attr>
        </edge>
        <edge from="gettea_1" to="tea">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="gettea_1" to="anger">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="gettea" to="gettea_1">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="gettea_1" to="gettea">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="refill">
        </node>
        <edge from="refill" to="refill">
            <attr name="label">
                <string>id:refill</string>
            </attr>
        </edge>
        <edge from="refill" to="refill">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="refill" to="refill">
            <attr name="label">
                <string>let:name="refill"</string>
            </attr>
        </edge>
        <node id="refill_0">
        </node>
        <edge from="refill_0" to="refill_0">
            <attr name="label">
                <string>id:refill_0</string>
            </attr>
        </edge>
        <edge from="refill_0" to="refill_0">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="refill_0" to="refill_0">
            <attr name="label">
                <string>let:name="refill_0"</string>
            </attr>
        </edge>
        <edge from="refill_0" to="milk">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="refill" to="refill_0">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="refill_0" to="refill">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="refill_1">
        </node>
        <edge from="refill_1" to="refill_1">
            <attr name="label">
                <string>id:refill_1</string>
            </attr>
        </edge>
        <edge from="refill_1" to="refill_1">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="refill_1" to="refill_1">
            <attr name="label">
                <string>let:name="refill_1"</string>
            </attr>
        </edge>
        <edge from="refill" to="refill_1">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="refill_1" to="refill">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="student">
        </node>
        <edge from="student" to="student">
            <attr name="label">
                <string>id:student</string>
            </attr>
        </edge>
        <edge from="student" to="student">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="student" to="student">
            <attr name="label">
                <string>let:name="student"</string>
            </attr>
        </edge>
        <node id="student_0">
        </node>
        <edge from="student_0" to="student_0">
            <attr name="label">
                <string>id:student_0</string>
            </attr>
        </edge>
        <edge from="student_0" to="student_0">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="student_0" to="student_0">
            <attr name="label">
                <string>let:name="student_0"</string>
            </attr>
        </edge>
        <edge from="student_0" to="pm">
            <attr name="label">
                <string>reactant</string>
            </attr>
        </edge>
        <edge from="student_0" to="tcoin">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="student" to="student_0">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="student_0" to="gettea">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="student_1">
        </node>
        <edge from="student_1" to="student_1">
            <attr name="label">
                <string>id:student_1</string>
            </attr>
        </edge>
        <edge from="student_1" to="student_1">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="student_1" to="student_1">
            <attr name="label">
                <string>let:name="student_1"</string>
            </attr>
        </edge>
        <edge from="student_1" to="pm">
            <attr name="label">
                <string>inhibitor</string>
            </attr>
        </edge>
        <edge from="student_1" to="ccoin">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="student" to="student_1">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="student_1" to="getcappuccino">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <node id="student_2">
        </node>
        <edge from="student_2" to="student_2">
            <attr name="label">
                <string>id:student_2</string>
            </attr>
        </edge>
        <edge from="student_2" to="student_2">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="student_2" to="student_2">
            <attr name="label">
                <string>let:name="student_2"</string>
            </attr>
        </edge>
        <edge from="student_2" to="idle">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="student" to="student_2">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="student_2" to="student">
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
