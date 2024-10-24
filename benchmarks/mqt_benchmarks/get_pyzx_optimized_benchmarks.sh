#!/bin/bash

move_files() {
    local pattern="$1"
    local dir="$2"
    local subdir="$3"

    fd ".*_${pattern}.*" $dir/$subdir -e qasm -I | while read file; do 
        mv "$file" "$(echo "$file" | sed "s/_${pattern}//" | sed "s/\/$subdir\//\/${pattern}\//")"
    done
}

set -x

./unpack_transp_tars.sh

pzxyo_dir=pyzx_optimized

mv transp_circuits/ $pzxyo_dir
rm -rf $pzxyo_dir/opt
fd . $pzxyo_dir -e ctqc -I | xargs rm
fd . $pzxyo_dir -e qasm -I | xargs -n 1 python optimize_with_pyzx.py -t 60 -f
move_files "optimized" $pzxyo_dir "transp"
