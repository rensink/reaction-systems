** Instructions for obtaining a pruned occurrence tree

GROOVE version required: at least 6.9.3

1. Make a copy of `working-copy-rs.gps`, say `myrs.gps`, and copy the type graph of the problem (say `mytype.gty`) to `myrs.gps`

3. Run the Generator on the start state of the problem (say `mystart.gst`) to find a forbidden state, inserting your own names for `mytype`, `mytrace`, `myrs` and `mystart.gst`:
 
```
java -jar Generator.jar \
  -D typeGraph=mytype \
  -traces \
  -o mytrace.gcp \
  -a inv:forbidden \
  -r 1 \
  myrs.gps \
  mystart.gst
```

`mytrace.gcp` now contains the trace to a forbidden state, as a control program. 

5. Make a copy of `build-occurrence-graph.gps`, say `myocc.gps`, and copy`mytype.gty` to `myocc.gps`

6. Copy the trace control program `mytrace.gcp` to `myocc.gps`

7. Run the Generator on `mystart.gst` to generate the occurrence graph for the forbidden state:

```
java -jar Generator.jar \
  -D typeGraph="mytype instance" \
  -D controlProgram="mytrace react" \
  -traces \
  -f myresult-#.gst \
  -r 1 \
  myocc.gps \
  mystart.gst
```

This will result in a file `myresult-nnn.gst` containing the occurrence graph of the forbidden state (where `nnn` is the state number).

8. Make a copy of `prune-occurrence-graph.gps`, say `myprune.gps`, and copy`mytype.gty` to `myocc.gps`

9. Run the Generator on `myresult-nnn.gst` to prune the occurrence graph:

```
java -jar Generator.jar \
  -D typeGraph="mytype instance" \
  -f mypruned-#.gst \
  myprune.gps \
  myresult-nnn.gst
```

This will result in a file `mypruned-nnn.gst` containing the pruned occurrence graph. Instead of `mypruned-#.gst` you can also use `mypruned-#.dot` to get the result in `.dot` format; or you can use the `Imager.jar` to convert `.gst` into `.dot`.

