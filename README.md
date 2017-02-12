## Docker container for MongoDB Taplaw

Clone this repo, then run these commands.

#### Build the image:
> docker build -t taplaw-mongodb .

#### Run the container:
> docker run -p 27017:27017 --name mongo_cont -d taplaw-mongodb
