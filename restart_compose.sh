
git pull https://mm1jwest:$GITHUB_TOKEN@github.com/JordonWest/drf-wine-api.git

docker-compose down

docker-compose up -d --build

# make sure the postgres container is ready, then run migrations
sleep 5
docker exec drf-wine-api-api-1 python /src/manage.py makemigrations 
docker exec drf-wine-api-api-1 python /src/manage.py migrate
