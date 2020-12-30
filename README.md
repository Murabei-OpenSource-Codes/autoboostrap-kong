# Auto Boostrap Kong
This image is very similar to the official kong one, but first checks if the
database is avaiable at `KONG_PG_HOST` and bootstrap database before starts
running.

https://konghq.com/kong/
https://hub.docker.com/_/kong

## License
This project is under MIT License.

# Docker image
https://hub.docker.com/repository/docker/andrebaceti/autoboostrap-kong

# Github
https://github.com/andrebaceti/autoboostrap-kong

# Docker compose example
```
version: "3.7"
services:
  postgres-kong
    image: postgres:12
    environment:
      - POSTGRES_PASSWORD=kong
      - POSTGRES_USER=kong
      - POSTGRES_DB=kong

  load-balancer--client-1:
    image: andrebaceti/boostrap-kong:0.0
    ports:
      - "8000:8000"
      - "8001:8001"
    environment:
      - KONG_PG_HOST=postgres-kong
```
