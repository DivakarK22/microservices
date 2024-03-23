Sensu-Monitoring Running in a Container.

#Build it
docker build -t sensu-master .

#Run it
docker run -d --name=sensu-master -p 4567:4567  sensu-master

SENSU-API is Exposed in port 4567.

Install uchiwa and make changes in config.

uchiwa.json -->

{
  "sensu": [
    {
      "name": "Site 1",
      "host": "0.0.0.0",
      "port": 4567
    }
  ],
  "uchiwa": {
    "host": "0.0.0.0",
    "port": 3000,
    "refresh": 5
  }
}

Dockerfile-Client for installing only sensu-client on containers.