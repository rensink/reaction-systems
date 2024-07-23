<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="ndfa-process">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>251 189 43 36</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>446 96 27 18</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>434 311 27 18</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>594 81 69 36</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>582 303 69 36</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>98 187 38 18</string>
            </attr>
        </node>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>type:State</string>
            </attr>
        </edge>
        <edge from="n0" to="n1">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n0" to="n2">
            <attr name="label">
                <string>next</string>
            </attr>
        </edge>
        <edge from="n1" to="n0">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n1" to="n3">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>type:Step</string>
            </attr>
        </edge>
        <edge from="n2" to="n0">
            <attr name="label">
                <string>move</string>
            </attr>
        </edge>
        <edge from="n2" to="n4">
            <attr name="label">
                <string>product</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>id:a</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>let:name="a"</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>type:Entity</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>id:b</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>let:name="b"</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>type:Entity</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:Token</string>
            </attr>
        </edge>
        <edge from="n5" to="n0">
            <attr name="label">
                <string>current</string>
            </attr>
        </edge>
    </graph>
</gxl>
