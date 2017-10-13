# microservices

# Docker machine in Google Cloud

```
$ docker-machine create --driver google \
  --google-project docker-181710 \
  --google-zone europe-west1-b \
  --google-machine-type f1-micro \
  --google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
  docker-host
```
```
$ docker-machine ls
$ eval $(docker-machine env docker-host)
```

# docker-compose

Основные команды:
```
docker-compose up -d
docker-compose down
docker-compose config
```
Параметризация в файле `.env`
