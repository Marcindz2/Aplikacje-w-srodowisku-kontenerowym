# 2.1 Docker for Beginners - Linux



# Step 0: Prerequisites

Polecenie 
```
git clone https://github.com/dockersamples/linux_tweet_app

```



# Step 1: Run some simple Docker containers

Polecenie 
```
docker container run alpine hostname
```

![01-01](./ss/01-01.png)

Polecenie 
```
docker container run --interactive --tty --rm ubuntu bash

ls/

ps aux

cat /etc/issue
```

![01-02](./ss/01-02.png)

Polecenie 
```
docker container run \
--detach \
--name mydb \
-e MYSQL_ROOT_PASSWORD=my-secret-pw \
mysql:latest
```

![01-03](./ss/01-03.png)

Polecenie 
```
docker container ls

docker container logs mydb
```

![01-04](./ss/01-04.png)

Polecenie 
```
docker container top mydb

docker exec -it mydb \

mysql --user=root --password=#MYSQL_ROOT_PASSWORD --VERSION

docker exec -it mydb sh
```

![01-05](./ss/01-05.png)

# Step 2: Package and run a custom app using Docker

Polecenie 
```
cat Dockerfile

echo $DOCKERID
```

![02-01](./ss/02-01.png)

Polecenie 
```
docker image build --tag $DOCKERID/linux_tweet_app:1.0 .
```
![02-02](./ss/02-02.png)

Widok na pierwotną stronę

![02-03](./ss/02-03.png)

Polecenie 
```
docker container run \
--detach \
--publish 80:80 \
--name linux_tweet_app \
$DOCKERID/linux_tweet_app:1.0

docker container rm--force linux_tweet_app
```

![02-04](./ss/02-04.png)

# Step 3: Modify a running website

Polecenie 
```
docker container run \
--detach \
--publish 80:80 \
--name linux_tweet_app \
--mount type=bind,source="$(pwd)",target=/usr/share/nginx/html \
$DOCKERID/linux_tweet_app:1.0
```

![03-01](./ss/03-01.png)

Widok na zmodyfikowana stronę

![03-02](./ss/03-02.png)

Polecenie 
```
cp index-new.html index.html

docker rm --force linux_tweet_app

docker container run \
--detach \
--publish 80:80 \
--name linux_tweet_app \
$DOCKERID/linux_tweet_app:1.0
```

![03-03](./ss/03-03.png)

Nastąpił powrót do poprzedniej strony

![03-04](./ss/03-04.png)

Polecenie 
```
docker rm --force linux_tweet_app

docker image build --tag $DOCKERID/linux_tweet_app:2.0 .

docker image ls
```

![03-05](./ss/03-05.png)

Nowa wersja strony 

![03-06](./ss/03-06.png)

Porównanie obu stron na raz w róznych przeglądarkach w tym samym czasie

![03-07](./ss/03-07.png)

Polecenie:
```
docker image ls -f reference="$DOCKERID/*"

```

![03-08](./ss/03-08.png)