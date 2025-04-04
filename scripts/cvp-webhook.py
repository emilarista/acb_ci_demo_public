# This is a CVP action script that can be used to trigger github CI with web hook.
ctx.info("Sending webhook to Github...")
import requests
from cloudvision.cvlib import ActionFailed

requests.packages.urllib3.disable_warnings()

url = "https://api.github.com/repos/<user>/<repo>/dispatches"

headers = {
    "Accept": "application/vnd.github+json",
    "Authorization": "token <token>",
}

body = {"event_type": "run_anta"}

response = requests.post(url, headers=headers, json=body)
ctx.info("Webhook sent!")

acceptable_responses = [200, 204]

if response.status_code not in acceptable_responses:
    raise ActionFailed(
        "Response code from Github was not the expected [ "
        + ",".join([str(x) for x in acceptable_responses])
        + " ], instead it was "
        + str(response.status_code)
    )
else:
    ctx.info("Action Finished!")
