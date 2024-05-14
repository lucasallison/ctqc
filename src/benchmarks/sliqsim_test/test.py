import time, subprocess, json, resource, sys, os, signal
from pathlib import Path

base_path = 'examples'
circuit_name = sys.argv[1]

print(circuit_name)


TIMEOUT = 60

def handler(signum, frame):
    raise Exception("Timeout")

script_dir = Path(os.path.dirname(os.path.abspath(__file__)))
ctqc_dir_index = list(script_dir.parts).index('ctqc')
        
binary_sub_path = 'ctqc/target/release/ctqc'
path_to_ctqc_dir = os.path.join(*list(script_dir.parts)[:ctqc_dir_index])
ctqc_binary = os.path.join(path_to_ctqc_dir, binary_sub_path)

signal.signal(signal.SIGALRM, handler)
signal.alarm(TIMEOUT)

try:
    start_time = time.time()
    res = subprocess.run([ctqc_binary, '-f' , os.path.join(base_path, 'ctqc', circuit_name+'.ctqc'), '-d', 'map'], capture_output=True)
    end_time = time.time()
    execution_time = end_time - start_time

    if res.stderr.decode() != '':
        raise RuntimeError(res.stderr.decode())

    max_rss_bytes = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss
    res = json.loads(res.stdout.decode())
    print(f'* CTQC: {execution_time} s, {max_rss_bytes} mb')
except Exception as e:
    print(f"* CTCQ: {e}")


signal.signal(signal.SIGALRM, handler)
signal.alarm(TIMEOUT)

try:
    start_time = time.time()
    res = subprocess.run(['./sliqsim.sh', os.path.join(base_path, 'qasm2', circuit_name+'.qasm')], capture_output=True)
    end_time = time.time()
    execution_time = end_time - start_time
    max_rss_bytes = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss
    print(f'* SLIQSIM: {execution_time} s, {max_rss_bytes} mb')
except Exception as e:
    print(f"* SLIQSIM: {e}")
