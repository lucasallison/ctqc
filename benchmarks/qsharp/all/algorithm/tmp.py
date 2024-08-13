import json, os

def get_json_files():
    json_files = []
    for root, _, files in os.walk('.'):
        for file in files:
            if file.endswith('.json'):
                json_files.append(os.path.join(root, file))
    return json_files

for file in get_json_files():
    print(file)

    with open(file) as f:
        data =  json.load(f)

    for bench in data:
        for res in bench['results']:
            if res['simulator'] == "CTQC_map" and "stats" in res:
                res["stats"]["runtime"] = res["stats"].pop("time")
                res["stats"]["max_rss_bytes"] = res["stats"].pop("rss_bytes")


    with open(file, 'w') as f:
        json.dump(data, f, indent=2)
