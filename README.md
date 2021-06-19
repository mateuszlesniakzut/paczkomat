By uruchomić projekt na swoim komputerze, należy wykonać następujące kroki:
1) Jeśli nie mamy zainstalowanego pythona, należy zainstalować pythona.
2) Stworzyć nowe środowisko wirtualne pythona i zainstalować w nim pakiety Django oraz mysql-connector (pip install mysql-connector-python, pip install Django)
3) Postawić lokalny serwer mySQL jeśli nie mamy. W tym celu można wykorzystać instalator MAMP, który zadba o wszystkie potrzebne rzeczy. Następnie uruchamiamy go.
4) Na serwerze mySQL stworzyć bazę danych "io" i zaimportować do niej plik paczkomat.sql z repo.
5) Klonujemy z repo kod aplikacji.
6) Ewentualnie zmienić w kodzie dane logowania do bazy danych. W kodzie używany jest port 3306, możliwe jednak że w trakcie instalacji serwerowi mySQL zostanie przydzielony inny port. Jeśli zmieniliśmy inne dane dostępowe (login i password), również trzeba je zmienić w pliku mysite/pickup/views.py. Wprowadzenie poprawnego loginu, hasła i portu jest kluczowe dla działania aplikacji. Jeśli przy tworzeniu bazy danych użyliśmy innej nazwy bazy danych niż "io", należy zmienić również nazwę bazy danych w zapytaniach.
7) W terminalu przechodzimy do folderu z aplikacją (.../mysite) i uruchamiamy komendę: python manage.py runserver
8) W przeglądarce wpisujemy adres: http://127.0.0.1:8000/
