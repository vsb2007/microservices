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
```
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
```
# ДЗ-27
```
docker-machine create \
    --driver google \
    --google-project docker-182005 \
    --google-zone europe-west1-b \
    --google-machine-type g1-small \
    --google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
    master-1
```
а также worker-1 worker-2

```
# Инициализируем Swarm-mode
$ docker swarm init
# Добавляем worker в кластер на самом воркере
$ docker swarm join --token SWMTKN-1-5dkxha7z0h9vfxqsoepxqybmehcs7mvfrtml00s8hxnn2nrgepchln12zdzd1805uensy5xouj7 10.132.0.6:2377
# Проверим состояние кластера
$ docker node ls
# Создать токен:
$ docker swarm join-token manager/worker
# Добавим label к ноде 
$ docker node update --label-add reliability=high master-1
# Посмотреть label’ы всех нод можно так
$ docker node ls -q | xargs docker node inspect -f '{{ .ID }} [{{ .Description.Hostname }}]: {{ .Spec.Labels }}'
# Применяем изменения
$ docker stack deploy --compose-file=<(docker-compose -f docker-compose.yml config 2>/dev/null) DEV
# смотреть все контейнеры
$ docker stack ps DEV
# смотреть все запущенные сервисы
$ docker stack services DEV
# 
$ docker inspect $(docker stack ps DEV -q --filter "Name=DEV_ui.1") --format "{{.Status.ContainerStatus.ContainerID}}"
```