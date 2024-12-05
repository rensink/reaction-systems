** Instructions for obtaining a pruned occurrence tree

GROOVE version required: at least 6.9.3.

To start with, you need a start graph and a type graph of your problem instance; say `my-start.gst` and `my-type.gty`.

1. Make a copy of `rs-explore.gps`, say `my-explore.gps`

2. Copy the type graph of the problem (say `my-type.gty`) to `my-explore.gps`

3. Run the Generator on the start state of the problem (say `my-start.gst`) to find a forbidden state, inserting your own names for `my-type`, `my-trace`, `my-explore` and `my-start.gst`:
 
```
java -jar Generator.jar \
  -D typeGraph=my-type \
  -traces \
  -o my-trace.gcp \
  -a inv:forbidden \
  -r 1 \
  my-rs.gps \
  my-start.gst
```

`my-trace.gcp` now contains the trace to a forbidden state, as a control program. 

5. Make a copy of `rs-build-occur.gps`, say `my-build.gps`.

5. Copy `my-type.gty` to `my-build.gps`

6. Copy the trace control program `my-trace.gcp` to `my-build.gps`

7. Run the Generator on `my-start.gst` to generate the occurrence graph for the forbidden state:

```
java -jar Generator.jar \
  -D typeGraph="my-type instance" \
  -D controlProgram="my-trace react" \
  -traces \
  -f my-result-#.gst \
  -r 1 \
  my-build.gps \
  my-start.gst
```

This will result in a file `my-result-xxx.gst` (where `xxx` is the state number) containing the occurrence graph of the forbidden state.

8. Make a copy of `rs-prune-occur.gps`, say `my-prune.gps`, and copy `my-type.gty` to `my-prune.gps`

9. Run the Generator on `my-result-nnn.gst` to prune the occurrence graph:

```
java -jar Generator.jar \
  -D typeGraph="mytype instance" \
  -f my-pruned-#.gst \
  my-prune.gps \
  my-result-xxx.gst
```

This will result in a file `my-pruned-yyy.gst` (where `yyy` is the state number) containing the pruned occurrence graph.

9. In the above call, instead of `my-pruned-#.gst` you can also use `my-pruned-#.dot` to get the result in `.dot` format; or you can use the `Imager.jar` to convert `.gst` into `.dot`.

