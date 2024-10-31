try:

    import sys, time, json
    from mqt import qcec

    circuit_1 = sys.argv[1]
    circuit_2 = sys.argv[2]

    start = time.time()
    # res = qcec.verify(circuit_1, circuit_2, run_simulation_checker=False, run_construction_checker=False, run_zx_checker=False)    
    res = qcec.verify(circuit_1, circuit_2)
    end = time.time()
    res = json.loads(str(res))

    print({'equivalence': res['equivalence'], 'runtime': end - start})

except Exception as e:
    print({'exception': str(e)})
