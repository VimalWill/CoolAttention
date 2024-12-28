# COOL Attention

Attention layers are the basic components of the LLMs. The project focus on the basic implementation of those attention mechanism in ```system verilog```. 

## Attention Mechanism

The attention mechanism can represented as follows,

$$
\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right) V
$$

## Cluster Design
![cluster](docs/cluster.png)
<br>
