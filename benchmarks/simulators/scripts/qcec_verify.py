try:

    import sys, time, ast
    from mqt import qcec

    circuit_1 = sys.argv[1]
    circuit_2 = sys.argv[2]

    start = time.time()
    res = qcec.verify(circuit_1, circuit_2)
    end = time.time()
    res = ast.literal_eval(str(res))
    res['runtime'] = end - start

    print(res)

except Exception as e:
    print({'exception': str(e)})