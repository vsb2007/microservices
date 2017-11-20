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


# ДЗ-21
```
 docker-machine create --driver google --google-project docker-182005 --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts --google-machine-type n1-standard-1 --google-zone europe-west1-b vm1
```
eval $(docker-machine env vm1)

# ДЗ-22-23
docker-machine create --driver google \
    --google-project docker-182005 \
    --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
    --google-machine-type n1-standard-1 \
    --google-zone europe-west1-b \
    --google-open-port 80/tcp \
    --google-open-port 3000/tcp \
    --google-open-port 8080/tcp \
    --google-open-port 9090/tcp \
    --google-open-port 9093/tcp \
    --google-open-port 9292/tcp \
    vm1
