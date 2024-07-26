1. Make a copy of `working-copy-rs.gps`, say `myrs.gps`

2. Copy the type graph of the problem (say `mytype.gty`) to `myrs.gps`

3. Run the Generator on the start state of the problem (say `mystart.gst`) to find a forbidden state, inserting your own names for `mytype`, `mytrace`, `myrs` and `mystart.gst`:
 
```
java -jar Generator.jar \
  -D typeGraph=mytype
  -traces \
  -o mytrace.gcp 
  -a inv:forbidden 
  -r 1 
  myrs.gps \
  mystart.gst
```

`mytrace.gcp` now contains the trace to a forbidden state, as a control program. 

5. Make a copy of `build-occurrence-graph.gps`, say `myocc.gps`

6. Copy the trace control program `mytrace.gcp` to `myocc.gps`

7. Run the Generator on `mystart.gst` to generate the occurrence graph for the forbidden state:

```
java -jar Generator.jar \
  -D controlProgram=mytrace \
  -traces \
  -f myresult-#1.gst \
  -r 1 \
  myocc.gps \
  mystart.gst
```

This will result in a file `myresult-???.gst` containing the occurrence graph of the forbidden state (where `???` is the state number).

