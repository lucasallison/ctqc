fd . examples/ctqc | xargs basename | cut -d '.' -f1 | xargs -L 1 python test.py 
