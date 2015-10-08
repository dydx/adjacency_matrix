# Adjacency Matrices

An adjacency matrix is a data structure that represents a graph

For a given graph:

```
  v1 * -------- v3 *
     | \
     |  \
     |   \
  v2 *    \
     |  v4 *
     |
     |
     |
  v5 * -------- v6 *
```

The adjancy matrix is:

|   |v1   |v2   |v3   |v4   |v5   |v6   |
|---|---|---|---|---|---|---|
|v1   |0   |1   |0   |1   |0   |0   |
|v2   |1   |0   |0   |0   |1   |0   |
|v3   |1   |0   |0   |0   |0   |0   |
|v4   |1   |0   |0   |0   |0   |0   |
|v5   |0   |1   |0   |0   |0   |1   |
|v6   |0   |0   |0   |0   |1   |0   |
