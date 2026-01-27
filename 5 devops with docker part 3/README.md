# 5 devops with docker part 3


Dodwanie tokenów

![02-01](./ss/02-01.png)

Dodany obraz do dockerhuba

![02-02](./ss/02-02.png)

Uruchomiony serwer

![02-03](./ss/02-03.png)

Strona po zaktualizowaniu 

![02-03-2](./ss/02-03-2.png)

Uruchomienie skryptu

![02-04](./ss/02-04.png)

Wynik uruchomionego skryptu

![02-05](./ss/02-05.png)

Skrypt uruchomiony w kontenerze 

![02-06](./ss/02-06.png)

Wynik w dockerhubie

![02-07](./ss/02-07.png)


Uruchomienie yt-dlp bez zmiany wlasciciela folderu

![03-01](./ss/03-01.png)

Uruchomienie po zmianie wlasciciela (wracamy do problemu z pobieraniem czyli wszystko gra)

![03-02](./ss/03-02.png)

Wielkosc starego yt-dlp

![04-01](./ss/04-01.png)

Wielkosc nowego yt-dlp

![04-02](./ss/04-02.png)

Sprawdzenie wielkosci poszczegolnych krokow dla yt-dlp

Polecenie:
```
docker image history yt-dlp
```

![04-03](./ss/04-03.png)

W przypadku kolejnego kroku optymalizacji widac znaczące zmniejszenie objętosci

![04-04](./ss/04-04.png)

Przy ostatnim kroku udalo sie zmniejszyc poczatkowy rozmiar prawie 4 krotnie

![04-05](./ss/04-05.png)

Co ciekawe w tym przypadku rozmiar z ubuntu nie rozni sie od rozmiaru z alpine

![04-06](./ss/04-06.png)

W odroznieniu od kursu w naszym przypadku powstaly obraz jest lzejszy niz poprzedni

![04-07](./ss/04-07.png)

