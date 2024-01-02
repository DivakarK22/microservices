Simple portfolio running in Container.

#Build it
docker build -t website .

#Run it
docker run -d -p 1234:1234 website --name website

You can access it in localhost , port 1234.