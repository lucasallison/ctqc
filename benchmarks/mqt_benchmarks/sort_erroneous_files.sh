#!/bin/bash

move_files() {
    local pattern="$1"
    local dir="$2"

    fd ".*_${pattern}.*" $dir/opt -e qasm -I | while read file; do 
        mv "$file" "$(echo "$file" | sed "s/_${pattern}//" | sed "s/\/opt\//\/${pattern}\//")"
    done
}

set -x

qo_dir=add_circs

fd . $qo_dir -e ctqc -I | xargs rm
fd . $qo_dir -e qasm -I | xargs sed -i '' -E '/(measure|barrier)/d'
fd . $qo_dir/opt -e qasm -I | xargs -n 1 python introduce_errors.py -f

for type in "flipped" "gm" "swap" "shift4" "shift7"; do
    mkdir -p $qo_dir/$type
    move_files $type $qo_dir
done

    