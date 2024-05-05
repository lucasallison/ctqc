import subprocess, json

MAX_ATTEMPTS = 100

for i in range(MAX_ATTEMPTS):
    print(f"Attempt {i}/{MAX_ATTEMPTS}")
    try:
        res = subprocess.run('./test.sh', capture_output=True, shell=True)
        res = json.loads(res.stdout.decode())
        equiv = bool(res['equivalent'])
        if not equiv:
            print("Found failing circuit")
            exit(0)
    except:
        continue

print("Did not find a failing circuit")
