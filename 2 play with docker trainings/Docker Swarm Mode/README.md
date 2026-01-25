# 2.3

Polecenie 
```
docker swarm init --advertise-addr $(hostname -i)

docker node ls

*Polecenie podane przy inicjalizacji*
```

![01-01](./ss/01-01.png)

Polecenie 
```
git clone https://github.com/docker/example-voting-app
cd example-voting-app

docker stack deploy --compose-file=docker-stack.yml voting_stack
```

![01-02](./ss/01-02.png)


Polecenie 
```
docker stack ls

docker stack services voting_stack

docker service ps voting_stack_vote
```

![01-03](./ss/01-03.png)

Podgląd na stronę

![01-04](./ss/01-04.png)