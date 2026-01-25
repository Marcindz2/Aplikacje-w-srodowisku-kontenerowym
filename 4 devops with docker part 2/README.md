# 4 devops with docker part 2
# 4.1 Migracja do Docker Compose

Polecenie:
```
docker compose build

docker compose push

```

![01-01](./ss/01-01.png)

Polecenie:
```
docker compose run yt-dlp-ubuntu https://imgur.com/JY5tHqr

```

![01-02](./ss/01-02.png)

od razu możemy zauważyć, że w tym przypadku mp4 zostało pobrane na nasz komputer

![01-03](./ss/01-03.png)


Polecenie:
```

docker container run -d -p 8000:8000 jwilder/whoami

```

![01-04](./ss/01-04.png)

![01-05](./ss/01-05.png)

Polecenie:
```

docker compose up -d

```

![01-06](./ss/01-06.png)

# 4.2 Sieci Dockera

Polecenie:
```

docker compose up -d --scale whoami=3

```

![02-01](./ss/02-01.png)

Polecenie:
```

docker compose up --scale whoami=3

docker compose port --index 1 whoami 8000

docker compose port --index 2 whoami 8000

docker compose port --index 3 whoami 8000

```

![02-02](./ss/02-02.png)

Polecenie:
```

docker compose up -d --scale whoami=3

```

![02-03](./ss/02-03.png)

![02-04](./ss/02-04.png)

![02-05](./ss/02-05.png)

Sprawdzenie

![02-06](./ss/02-06.png)

# 4.3 Wolumeny w praktyce

Polecenie:
```

docker compose up -d


```

![03-01](./ss/03-01.png)



Polecenie:
```

docker container inspect db_redmine


```

![03-02](./ss/03-02.png)

Polecenie:
```

docker compose down 

docker volume ls


```

![03-03](./ss/03-03.png)


działający redmine

![03-04](./ss/03-04.png)

Polecenie 
```
docker container diff $(docker compose ps -q redmine)

```
![03-05](./ss/03-05.png)

Adminer
![03-06](./ss/03-06.png)

# 4.4 Kontenery w środowisku deweloperskim

Polecenie 
```
docker compose up -d

```
![04-01](./ss/04-01.png)

poprawiona wersja

![04-02](./ss/04-02.png)