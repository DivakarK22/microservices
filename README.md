# microservices
Apps in containers


curl --request POST \
  --url 'https://dvkr.atlassian.net/rest/api/3/issue' \
  -u dvkr22@gmail.com:ATATT3xFfGF0Z5BuLjrdpYsh225RYQ7sUvOSFEkVvhGAJ5Q7Jxyu6P8RFnbA1coDgSvrmFnfku-NWhC_4aFW7WfUgA8sN_mRrykHB5WwKtQ3XJLK6-JxIUf13Ryf5-4uPJY5KkPnYZZMRu9efraIOygC5clAvx2Anr8LTmnK1o1ukhp6__oddWE=7193ED13  \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
    "fields":
    {
        "project":
        {
            "key": "SYS"
        },
        "summary": "Jenkins Job Failed",
        "description": {
          "type": "doc",
          "version": 1,
          "content": [
            {
              "type": "paragraph",
              "content": [
                {
                  "type": "text",
                  "text": "Created via REST API, Below Jenkins job is failed at $date,Please check it asap"
                }
              ]
            }
          ]
        },
        "issuetype":
        {
            "id": "10001"
        }
    }
}'

