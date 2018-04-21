# Docker setup for different services

Choose a service and run `docker-compose`

Ex:
```
$ cd services/mysql
$ docker-compose up
```


After you have your containers ready you can start/stop all by simply running:
```
$ ./docker-up
$ ./docker-down
```
PS: you will need `./jq` for this, please check https://stedolan.github.io/jq/