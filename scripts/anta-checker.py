import glob
import json

failedTests = []

for name in glob.glob("anta/anta*.json"):
    with open(name, "r") as f:
        results = json.loads(f.read())
        for item in results:
            if item["result"] == "failure":
                failedTests.append(item)

if len(failedTests) > 0:
    raise Exception("Found failed ANTA tests: \n " + json.dumps(failedTests, indent=2))

else:
    pass
