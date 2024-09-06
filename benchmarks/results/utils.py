import numpy as np, os, json

def rankmin(x):
    """
    Takes in a list of numbers and returns a list of their ranks. Example:
    [7,2,5] -> [2,0,1]
    """
    _, inv, counts = np.unique(x, return_inverse=True, return_counts=True)
    csum = np.zeros_like(counts)
    csum[1:] = counts[:-1].cumsum()
    return csum[inv]


def get_json_files():
    json_files = []
    for root, _, files in os.walk('.'):
        for file in files:
            if file.endswith('.json'):
                json_files.append(os.path.join(root, file))
    return json_files


def load_json_data(file):
    with open(file) as f:
        return json.load(f)
