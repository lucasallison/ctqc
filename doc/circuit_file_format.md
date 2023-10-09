# Circuit files

The circuits that can be specified withtin these files is currently very limited. There are four gates that can be used: H, S, CNOT and T. Each gate of the circuit should be placed on a seperate line. 

### Example

```
H 0
CNOT 0 1
S 1
T 2
H 3
```