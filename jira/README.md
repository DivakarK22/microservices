switch to branch jira

git checkout -b jira

docker build -t jira . 

docker run -d -p 8080:8080 --name jira jira

docker logs -f jira 

Start psql container once jira started , we are using psql as db. inside psql folder.

docker build -t psql

docker run -d -p 5432:5432 --name psql psql

Open localhost:8080 to start jira initial setup add the db.