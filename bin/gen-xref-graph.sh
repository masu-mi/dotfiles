#!/usr/bin/env bash

mix xref --format=dot --no-compile graph
find . -name xref_graph.dot \
  | fzf \
  | xargs -I{} \
  bash -c "export path={}; dot -Tsvg {} -o ./xref_graph_\$(basename \$(dirname \$path)).svg"
