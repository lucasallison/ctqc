import subprocess, ast, resource, json
import psutil
import io, time
from typing import List, Dict

def exec_subprocess_with_memory_limit(command, mb_mem_limit=8 * 1024, check_interval=0.1):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    max_rss = 0
    output = []

    try:
        proc = psutil.Process(process.pid)
        
        while process.poll() is None:
            try:
                memory_info = proc.memory_info()
                all_procs = [proc] + proc.children(recursive=True)
                total_memory_rss = sum(p.memory_info().rss for p in all_procs)

                max_rss = max(max_rss, total_memory_rss)
                if memory_info.rss > mb_mem_limit * 1024 * 1024:  # Convert MB to bytes
                    process.terminate()
                    process.wait(timeout=3)
                    if process.poll() is None:
                        process.kill()
                    raise RuntimeError(f"Memory limit of {mb_mem_limit} MB exceeded.")
            except psutil.NoSuchProcess:
                break
            
            time.sleep(check_interval)

        stdout, stderr = process.communicate()  # Capture both stdout and stderr

        if stderr:
            raise RuntimeError(f"Error from subprocess: {stderr.decode()}")

        output = stdout.decode().strip()  # Decode and capture stdout as a string
        
        try:
            res = ast.literal_eval(output)
        except Exception as e:
            try: # Try parsing the output as JSON
                res = json.loads(output)
            except Exception as e:
                raise RuntimeError(f"Failed parsing the result to dict: {output} \n {e}")

        if 'exception' in res:
            raise RuntimeError(f"{res['exception']}")

        res['max_rss_bytes'] = max_rss
        return res

    except Exception as e:
        process.kill()  # Ensure the process is terminated in case of any error
        raise e
