import subprocess, ast, resource
from typing import List, Dict

def exec_subprocess(cmd: List) -> Dict:
    """
    Executes a subprocess command and monitors its maximum resident set size (RSS).

    This function runs the given command in a subprocess, captures its output,
    and attempts to parse the output as a dictionary. It also monitors the maximum
    RSS (in bytes) used by the subprocess and returns this information along with
    the parsed output.
    """

    res = subprocess.run(cmd, capture_output=True)

    try:
        res = ast.literal_eval(res.stdout.decode())
    except Exception as e:
        raise RuntimeError(f"Failed parsing the result to dict: {res.stdout.decode()} \n {e}")

    if 'exception' in res:
        raise RuntimeError(f"{res['exception']}")

    res['max_rss_bytes'] = resource.getrusage(
        resource.RUSAGE_CHILDREN).ru_maxrss
    return res