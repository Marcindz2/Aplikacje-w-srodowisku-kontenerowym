# 1 docker for beginners
# 1.1 runing containers

polecenie:
```
docker images
```
![01-01](./ss/01-01.png)

polecenie:
```
docker search ubuntu
```

![01-02](./ss/01-02.png)

polecenie:
```
docker pull ubuntu:22.04
```

![01-03](./ss/01-03.png)

polecenie:
```
docker pull ubuntu:22.10
```

![01-04](./ss/01-04.png)

polecenie:
```
docker images
```

![01-05](./ss/01-05.png)

polecenie:
```
docker rmi "ID obrazu"
```

![01-06](./ss/01-06.png)

polecenie:
```
docker images
```

![01-07](./ss/01-07.png)

polecenie:
```
docker rmi $(docker images -a -q)
```


![01-08](./ss/01-08.png)

polecenie:
```
$ docker run -it --name ubuntu-shell ubuntu:22.04 /bin/bash

$ docker ps -a
```


![01-09](./ss/01-09.png)

polecenie:
```
$ docker start -i ubuntu-shell
```
![01-10](./ss/01-10.png)

polecenie:
```
$ docker stop ubuntu-shell
$ docker rm ubuntu-shell
$ docker ps -a
```
![01-11](./ss/01-11.png)

# 1.2 Changing images
polecenie:
```
docker pull ubuntu:16.04
```

![02-01](./ss/02-01.png)

polecenie:
```
$ docker run -it ubuntu:16.04 /bin/bash

ping
```
![02-02](./ss/02-02.png)

polecenie:
```
apt-get update

apt-get install iputils-ping
```

![02-03](./ss/02-03.png)

polecenie:
```
docker commit <CONTAINER_ID> youruser/ping:latest

docker images
```

![02-04](./ss/02-04.png)

polecenie:
```
$ docker run -it youruser/ping /bin/bash
```

![02-05](./ss/02-05.png)

# 1.3 Building images

polecenie:
```
docker pull ubuntu:16.04
```

polecenie/zawartość pliku:
```
$ touch Dockerfile

FROM ubuntu:16.04
LABEL author="Marcin"

RUN apt-get update

RUN apt-get install -y iputils-ping
```

![03-01](./ss/03-01.png)

polecenie:
```
docker build -t 'marcin/ping' .
```
![03-02](./ss/03-02.png)

polecenie:
```
docker images
```
![03-03](./ss/03-03.png)

polecenie/zawartość pliku:
```
$ touch Dockerfile

FROM ubuntu:16.04
LABEL author="Marcin"

RUN apt-get update \
    && apt-get install -y iputils-ping \
    && apt-get clean \
    && cd /var/lib/apt/lists && rm -fr *Release* *Sources* *Packages* \
    && truncate -s 0 /var/log/*log
```

![03-04](./ss/03-04.png)

polecenie:
```
docker images
```
![03-05](./ss/03-05.png)

polecenie:
```
docker run -it delner/ping
```
![03-06](./ss/03-06.png)

# 1.4 Sharing images

polecenie:
```
docker search kafka
```

![04-01](./ss/04-01.png)

polecenie:
```
docker images

docker tag marcin/ping:latest marcindz2/ping:1.0

docker images

docker rmi marcin/ping:latest

docker images
```

![04-02](./ss/04-02.png)

wynik w serwisie

![04-03](./ss/04-03.png)

# 1.5 Volumes

polecenie:
```
docker run --rm -d --name apache -p 80:80 httpd:2.4
```

![05-01](./ss/05-01.png)

polecenie:
```
curl localhost
```

![05-02](./ss/05-02.png)

polecenie:
```
docker cp index.html apache:/usr/local/apache2/htdocs/
```

![05-03](./ss/05-03.png)

polecenia:
```
curl localhost

docker volume create myvolume

docker volume ls

docker volume rm myvolume

docker volume ls

docker volume create httpd_htdocs

docker run --rm -d --name apache -p 80:80 -v httpd_htdocs:/usr/local/apache2/htdocs/ httpd:2.4
```

![05-04](./ss/05-04.png)


polecenia:
```
docker cp index.html apache:/usr/local/apache2/htdocs/

curl localhost

docker stop apache

docker run --rm -d --name apache -p 80:80 -v httpd_htdocs:/usr/local/apache2/htdocs/ httpd:2.4
c21dd93fea83d710b4d4c954911862760030723df6a5b42650e462e388fe6049

curl localhost
```

![05-05](./ss/05-05.png)

polecenie:
```
docker run --rm -d --name apache -p 80:80 -v "scieżka do pliku" httpd:2.4
0d91516b20ea6113b5dcca08ada6465095dc68663b3d2201dc0490165764f842
curl localhost
curl localhost
```

![05-06](./ss/05-06.png)

# 1.6 Networking

polecenie:
```
docker network l

docker network inspect bridge
```

![06-01](./ss/06-01.png)

polecenie:
```
docker run --rm -d --name dummy marcindz2/ping:1.0

docker network inspect bridge
```

![06-02](./ss/06-02.png)

polecenie:
```
docker run --rm -d -e PING_TARGET=172.17.0.2 --name pinger marcindz2/ping:1.0

docker ps

docker logs pinger
```

![06-03](./ss/06-03.png)

polecenie:
```
docker network create skynet

docker run --rm -d --network skynet --name dummy marcindz2/ping:1.0

docker run --rm -d --network skynet -e PING_TARGET=dummy --name pinger marcindz2/ping:1.0

docker logs pinger
```

![06-04](./ss/06-04.png)


(dla tego polecenia zmieniłem składnie, ponieważ dostawałem błędy związane z brakiem hasła dla postgresa)
polecenie: 
```
docker run --rm -d --name widgetdb --network skynet -p 5432 -e POSTGRESS_PASSWORD=secret postgres

docker run --rm -d --name gadgetdb --network skynet -p 5432 -e POSTGRESS_PASSWORD=secret postgres

docker ps
```

![06-05](./ss/06-05.png)

polecenie:
```
docker exec -it widgetdb /bin/bash

psql -U postgres


psql -U postgres -h gadgetdb
```

![06-06](./ss/06-06.png)


