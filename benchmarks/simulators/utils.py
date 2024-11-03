import subprocess, ast, json, os, shutil, psutil
import time
from typing import List, Dict

def kill_user_processes(username, pattern):
    killed = []
    for proc in psutil.process_iter(['name', 'username']):
        try:
            if (proc.info['username'] == username and 
                pattern in proc.info['name'].lower()):
                proc.kill()
                killed.append(proc.info['name'])
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            pass

    return killed


def remove_files_from_dir(directory: str, pattern: str):
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        if os.path.isfile(file_path) and pattern in filename:
            os.remove(file_path)


def calculate_pattern_files_size(directory, pattern):
    total_size = 0
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        if os.path.isfile(file_path) and pattern in filename:
            total_size += os.path.getsize(file_path)

    size_in_mb = total_size / (1024 * 1024)
    return round(size_in_mb, 2)


def get_disk_space(path):
    _, _, free = shutil.disk_usage(path)
    return round(free / (1024 * 1024))


def exec_subprocess_with_memory_limit(command, mb_mem_limit=8 * 1024, check_interval=0.1, dirs=None, pattern=None):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    max_rss = 0
    output = []

    initial_free_space = sum(map(get_disk_space, dirs)) if dirs else None

    try:
        proc = psutil.Process(process.pid)
        
        while process.poll() is None:
            try:
                all_procs = [proc] + proc.children(recursive=True)
                total_memory_rss = sum(p.memory_info().rss for p in all_procs)
                max_rss = max(max_rss, total_memory_rss)

                if dirs:
                    file_storage = sum(map(lambda d: calculate_pattern_files_size(d, pattern), dirs))
                    file_storage_limit_exceeded = file_storage > 0.5 * initial_free_space
                else: 
                    file_storage_limit_exceeded = False

                if total_memory_rss > mb_mem_limit * 1024 * 1024 or file_storage_limit_exceeded:

                    process.terminate()
                    process.wait(timeout=3)
                    if process.poll() is None:
                        process.kill()
                    
                    error_msg = f"Disk space limit exceeded. Current usage: {file_storage} MB" if file_storage_limit_exceeded else f"Memory limit of {mb_mem_limit} MB exceeded." 

                    raise RuntimeError(error_msg)
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
