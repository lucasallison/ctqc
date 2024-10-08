try: 
    import sys, time, os
    import quokka_sharp as qk
    from dotenv import load_dotenv

    load_dotenv()
    tool_path = os.getenv('GPMC_BINARY_PATH')

    circuit_1 = sys.argv[1]
    circuit_2 = sys.argv[2]

    start = time.time()
    # Parse the circuit
    circuit1 = qk.encoding.QASMparser(circuit_1, True)
    # Parse another circuit
    circuit2 = qk.encoding.QASMparser(circuit_2, True)
    # Get (circuit1)^dagger(circuit2)
    circuit2.dagger()
    circuit1.append(circuit2)
    # Get CNF for the merged circuit
    cnf = qk.encoding.QASM2CNF(circuit1)
    res = qk.CheckEquivalence(tool_path, cnf)
    end = time.time()

    print({'equivalence': res, 'runtime': end-start})

except Exception as e:
    print({'exception': str(e)})
