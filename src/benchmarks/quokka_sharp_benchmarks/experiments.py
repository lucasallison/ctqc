import os

def find_common_subpaths(dir1, dir2):
    common_subpaths = []
    
    for root, dirs, files in os.walk(dir1):
        for dir_name in dirs:
            dir1_path = os.path.join(root, dir_name)
            dir2_path = dir1_path.replace(dir1, dir2)
            
            if os.path.isdir(dir2_path):
                common_subpaths.append(dir1_path)
    
    return common_subpaths