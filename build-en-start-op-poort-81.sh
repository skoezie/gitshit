echo "welkom"
docker build -t missingmanual .
docker run -dt -p 81:80 --name missingmanualcontainer missingmanual

