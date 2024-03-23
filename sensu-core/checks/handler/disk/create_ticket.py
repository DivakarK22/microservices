import base64
import requests
import json

# Jira API endpoint for creating an issue
url = "https://dvkr.atlassian.net/rest/api/3/issue"

# Authentication credentials
username = "dvkr22@gmail.com"
api_token = "ATATT3xFfGF0YweOudT2wsiDz3WWQ24wjIQGRpbvhVlVgpfKgiO8yxudzD_pDqvJu5DWg5fOsDE3KjqKQ9FEVXuU0wAP9i24biOqSVgmxth7uCRQB_J9j3s0XtLDT0MD7rgXdBksheEReSNojOdvhEgQAa0PI8wifrP7BGI_PWHdBSLsS_hPU8I=D94A180D"
assignee_username = "dvkr22@gmail.com"

# Issue payload
issue_payload = {
    "fields": {
        "project": {
            "key": "SYS"  # Replace PROJ with your project key
        },
	"assignee": {
            "name": assignee_username
	},
        "summary": "Node Exporter is down",
        "description": {
          "type": "doc",
          "version": 1,
          "content": [
            {
              "type": "paragraph",
              "content": [
                {
                  "type": "text",
                  "text": "Node exporter service is down on host (Home) 192.168.1.10, Please check  http://home:3000/#/client/Site%201/Home?check=node_exporter"
                }
              ]
            }
          ]
        },
        "issuetype": {
            "name": "Task"  # Replace Bug with the appropriate issue type
        }
    }
}

# Headers
headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
}

# Authentication headers
auth_str = f"{username}:{api_token}"
auth_bytes = auth_str.encode('ascii')
base64_bytes = base64.b64encode(auth_bytes)
auth_headers = {
    "Authorization": f"Basic {base64_bytes.decode('ascii')}"
}

# Make the request
response = requests.post(url, headers=headers, auth=(username, api_token), json=issue_payload)

# Check the response
if response.status_code == 201:
    print(json.loads(response.text)["key"])
else:
    print("Failed to create issue. Status code:", response.status_code)
    print("Response:", response.text)