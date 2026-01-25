# 2.2 Application Contenerization

# Step 0: Basic Link Extractor Script

Polecenie 
```
git checkout step0
tree

cat linkextractor.py

./linkextractor.py http://example.com/

```

![01-01](./ss/01-01.png)

# Step 1: Containerized Link Extractor Script

Polecenie 
```
git checkout step1
tree

cat Dockerfile
```

![01-02](./ss/01-02.png)

Polecenie : 
```
docker image build -t linkextractor:step1 .
```

![01-03](./ss/01-03.png)

Polecenie : 
```
docker image ls
docker container run -it --rm linkextractor:step1 http://example.com/

docker container run -it --rm linkextractor:step1 https://training.play-with-docker.com/
```

![01-04](./ss/01-04.png)

# Step 2: Link Extractor Module with Full URI and Anchor Text
![01-05](./ss/01-05.png)

Polecenie :
```
docker image build -t linkextractor:step2 .

docker image ls
```

![01-06](./ss/01-06.png)



Polecenie : 
```
docker container run -it --rm linkextractor:step2 https://training.play-with-docker.com/
```

![01-07](./ss/01-07.png)



# Step 3: Link Extractor API Service
![01-08](./ss/01-08.png)

Polecenie : 
```
docker image build -t linkextractor:step3 .

docker container run -d -p 5000:5000 --name=linkextractor linkextractor:step3

docker container ls
```

![01-09](./ss/01-09.png)


Polecenie : 
```
curl -i http://localhost:5000/api/http://example.com/

docker container logs linkextractor
```

![01-10](./ss/01-10.png)



# Step 4: Link Extractor API and Web Front End Services


Polecenie : 
```
cat docker-compose.yml
```

![01-11](./ss/01-11.png)

Polecenie : 
```
cat www/index.php
```

![01-12](./ss/01-12.png)

Polecenie : 
```
docker composte ip -d --build 

docker container ls
```

![01-13](./ss/01-13.png)

Polecenie :
```
curl -i http://localhost:5000/api/http://example.com/

sed -i 's/Link Extractor/Super Link Extractor/g' www/index.php

git reset --hard

docker-compose down 
```

![01-14](./ss/01-14.png)

# Step 5: Redis Service for Caching

Polecenie : 
```
cat docker-compose.yml
```

![01-15](./ss/01-15.png)

Polecenie :
```
docker composte ip -d --build 

docker-compose exec redis redis-cli monitor

sed -i 's/Link Extractor/Super Link Extractor/g' www/index.php

git reset --hard

docker-compose down 
```
![01-16](./ss/01-16.png)

# Step 6: Swap Python API Service with Ruby

Polecenie : 
```
cat api/dockerfile
```

![01-17](./ss/01-17.png)

Polecenie :
```
docker composte ip -d --build 

curl -i http://localhost:4567/api/http://example.com/
```

![01-18](./ss/01-18.png)

# Używanie Link Extractora na stronie

![01-19](./ss/01-19.png)
![01-20](./ss/01-20.png)