import cirq
import numpy as np

I = cirq.unitary(cirq.I)
X = cirq.unitary(cirq.X)
Y = cirq.unitary(cirq.Y)
Z = cirq.unitary(cirq.Z)

def conj_cnot(M):
	CNOT = cirq.unitary(cirq.CNOT)
	CNOT_DAG = np.conj(CNOT.T)
	return CNOT @ M @ CNOT_DAG


M = conj_cnot(cirq.kron(I, X))
res = cirq.kron(I, X)
print((M == res).all())

M = conj_cnot(cirq.kron(I, Y))
res = cirq.kron(Z, Y)
print((M == res).all())

M = conj_cnot(cirq.kron(I, Z))
res = cirq.kron(Z, Z)
print((M == res).all())

M = conj_cnot(cirq.kron(X, I))
res = cirq.kron(X, X)
print((M == res).all())

M = conj_cnot(cirq.kron(X, X))
res = cirq.kron(X, I)
print((M == res).all())

M = conj_cnot(cirq.kron(X, Y))
res = cirq.kron(Y, Z)
print((M == res).all())

M = conj_cnot(cirq.kron(X, Z))
res = -1 * cirq.kron(Y, Y)
print((M == res).all())

M = conj_cnot(cirq.kron(Y, I))
res = cirq.kron(Y, X)
print((M == res).all())

M = conj_cnot(cirq.kron(Y, X))
res = cirq.kron(Y, I)
print((M == res).all())

M = conj_cnot(cirq.kron(Y, Y))
res = -1 * cirq.kron(X, Z)
print((M == res).all())

M = conj_cnot(cirq.kron(Y, Z))
res = cirq.kron(X, Y)
print((M == res).all())

M = conj_cnot(cirq.kron(Z, I))
res = cirq.kron(Z, I)
print((M == res).all())

M = conj_cnot(cirq.kron(Z, X))
res = cirq.kron(Z, X)
print((M == res).all())

M = conj_cnot(cirq.kron(Z, Y))
res = cirq.kron(I, Y)
print((M == res).all())

M = conj_cnot(cirq.kron(Z, Z))
res = cirq.kron(I, Z)
print((M == res).all())
