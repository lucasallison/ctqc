from mqt import qcec

# verify the equivalence of two circuits provided as qasm files
result = qcec.verify(".qasm", "circ2.qasm")

# print the result
print(result.equivalence)
