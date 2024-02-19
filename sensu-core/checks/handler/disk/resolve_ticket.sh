curl -D- -u dvkr22@gmail.com:ATATT3xFfGF0YweOudT2wsiDz3WWQ24wjIQGRpbvhVlVgpfKgiO8yxudzD_pDqvJu5DWg5fOsDE3KjqKQ9FEVXuU0wAP9i24biOqSVgmxth7uCRQB_J9j3s0XtLDT0MD7rgXdBksheEReSNojOdvhEgQAa0PI8wifrP7BGI_PWHdBSLsS_hPU8I=D94A180D -X POST -H "Content-Type: application/json" \
  --data '{
    "transition": {
      "id": "31"
	}
  }' \
  "https://dvkr.atlassian.net/rest/api/2/issue/SYS-115/transitions"

curl -D- -u dvkr22@gmail.com:ATATT3xFfGF0YweOudT2wsiDz3WWQ24wjIQGRpbvhVlVgpfKgiO8yxudzD_pDqvJu5DWg5fOsDE3KjqKQ9FEVXuU0wAP9i24biOqSVgmxth7uCRQB_J9j3s0XtLDT0MD7rgXdBksheEReSNojOdvhEgQAa0PI8wifrP7BGI_PWHdBSLsS_hPU8I=D94A180D -X POST -H "Content-Type: application/json" \
  --data '{
    "body": "Resource is back to NORMAL. Dashboard --> http://192.168.1.10:3001/d/rYdddlPWk/node-exporter-full?orgId=1&refresh=5s&var-DS_PROMETHEUS=f9650249-aab1-4cd2-a76f-c0b4941f6def&var-job=cpu_usages&var-node=192.168.1.10:9100&var-diskdevices=%5Ba-z%5D%2B%7Cnvme%5B0-9%5D%2Bn%5B0-9%5D%2B%7Cmmcblk%5B0-9%5D%2B&from=now-5m&to=now"
  }' \
  "https://dvkr.atlassian.net/rest/api/2/issue/SYS-115/comment"