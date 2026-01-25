# 3 devops with docker part 1
# 3.1 Definicje i podstawowe pojęcia

Polecenie:
```

```

![01-01](./ss/01-01.png)


Polecenie:
```
docker container run hello-world
```

![01-01](./ss/01-01.png)



Polecenie:
```
docker container run -it ubuntu sh -c 'apt update && apt install -y curl && curl https://www.google.com'
```

![01-02](./ss/01-02.png)

Polecenie:
```
docker container ls -a
```

![01-03](./ss/01-03.png)

# 3.2 Uruchamianie i zatrzymywanie kontenerów

Polecenie:
```
docker run ubuntu

docker run -it ubuntu
```

![02-01](./ss/02-01.png)


Polecenie:
```
docker run -d -it --name looper ubuntu sh -c "while true; do date; sleep 1; done"
```

![02-02](./ss/02-02.png)

Polecenie:
```
docker logs -f looper
```

![02-03](./ss/02-03.png)

Polecenie:
```
docker attach looper
```

![02-04](./ss/02-04.png)


Polecenie:
```
docker attach --no-stdin looper
```

![02-05](./ss/02-05.png)

Polecenie:
```
docker exec looper ls -la
```

![02-06](./ss/02-06.png)

Polecenie:
```
docker exec -it looper bash

docker kill looper

docker rm looper
```

![02-07](./ss/02-07.png)

Polecenie:
```
docker run -d --rm -it --name looper-it ubuntu sh -c "while true; do date; sleep 1; done"
docker attach looper-it
```

![02-08](./ss/02-08.png)

# 3.3 Dogłębne spojrzenie na obrazy

Polecenie:
```
docker search hello-world
```

![03-01](./ss/03-01.png)

Polecenie:
```
docker pull ubuntu

docker pull ubuntu:22.04

```

![03-02](./ss/03-02.png)


Polecenie:
```
docker build ./section-3 -t sekcja3

```

![03-03](./ss/03-03.png)



Polecenie:
```
docker image ls

docker run sekcja3

```

![03-04](./ss/03-04.png)

Polecenie:
```
docker run -it sekcja3 sh

docker ps

notepad additional.txt

docker cp ./additional.txt crazy_mccarthy:/usr/src/app/

docker diff crazy_mccarthy

```

![03-05](./ss/03-05.png)


Polecenie:
```
docker commit crazy_mccarthy sekcja3-additional

docker image ls

```

![03-06](./ss/03-06.png)


Polecenie:
```
docker build . -t sekcja3:v2

docker run sekcja3:v2 ls

docker run sekcja3-additional ls

```

![03-07](./ss/03-07.png)

# 3.4 Definiowanie warunków startowych kontenera

Polecenie:
```
docker run -it ubuntu:22.04

apt-get update && apt-get install -y curl

curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp


```

![04-01](./ss/04-01.png)

Polecenie:
```
chmod a+rx /usr/local/bin/yt-dlp

apt-get install -y python3
```

![04-02](./ss/04-02.png)


Polecenie:
```
docker build -t yt-dlp ./section-4

docker run yt-dlp

```

![04-03](./ss/04-03.png)

plik docker
```
FROM ubuntu:22.04

WORKDIR /mydir

RUN apt-get update && apt-get install -y curl python3
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
RUN chmod a+x /usr/local/bin/yt-dlp

# Replacing CMD with ENTRYPOINT
ENTRYPOINT ["/usr/local/bin/yt-dlp"]

```
![04-04](./ss/04-04.png)


Polecenie:
```
docker build -t yt-dlp ./section-4

docker run yt-dlp https://www.youtube.com/watch?v=dQw4w9WgXcQ

```
W tym przypadku pobieranie sie nie udało, mimo iż filmik na yt został znaleziony poprawnie (co oznacza ze problem leżał po stronie samego yt-dlp a nie dockera)
![04-05](./ss/04-05.png)

Polecenie:
```
docker pull python:3.11

docker run -it python:3.11

docker run -it python:3.11 --version

docker run -it python:3.11 bash
```

![04-06](./ss/04-06.png)

Polecenie:
```
docker diff recursing_murdock
```

![04-07](./ss/04-07.png)

# 3.5 Interakcja z kontenerem przez wolumeny i porty


Polecenie:
```
docker run -v "%cd%:/mydir" yt-dlp https://www.youtube.com/watch?v=DptFY_MszQs
```

![05-01](./ss/05-01.png)

# 3.6 Wykorzystywanie narzędzi z rejestru

Polecenie:
```
docker build . -t rails-project && docker run -p 3000:3000 rails-project
```

![06-01](./ss/06-01.png)

```
docker tag yt-dlp marcindz2/yt-dlp

docker push marcindz2/yt-dlp
```
![06-02](./ss/06-02.png)