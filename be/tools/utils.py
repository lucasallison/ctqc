import re
import psutil
import os


def atoi(text):
    """Convert string to integer if possible, otherwise return the string."""
    return int(text) if text.isdigit() else text


def natural_keys(text):
    """Convert string into a list of string and number chunks for natural sorting."""
    return [atoi(c) for c in re.split(r'(\d+)', text)]


def kill_process_tree(pid):
    """Kill a process and all its children."""
    parent = psutil.Process(pid)
    for child in parent.children(recursive=True):
        child.kill()
    parent.kill()


def find_file(base_directory, file_name):
    """Search for a file in a directory tree and return its path if found."""
    for root, _, files in os.walk(base_directory):
        if file_name in files:
            return str(os.path.join(root, file_name))
    return None
