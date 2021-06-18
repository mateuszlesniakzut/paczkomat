By uruchomić projekt na swoim komputerze, należy wykonać następujące kroki:
1) Stworzyć nowe środowisko wirtualne pythona i zainstalować w nim pakiety Django oraz mysql-connector (pip install mysql-connector-python, pip install Django)
2) Postawić lokalny serwer mySQL. W tym celu można wykorzystać instalator MAMP, który zadba o wszystkie potrzebne rzeczy. Następnie uruchamiamy go.
3) Na serwerze mySQL stworzyć bazę danych io i zaimportować do niej plik paczkomat.sql z repo.
4) Ewentualnie zmienić w kodzie dane logowania do bazy danych. W kodzie używany jest port 3306, możliwe jednak że w trakcie instalacji serwerowi mySQL zostanie przydzielony inny port. Jeśli zmieniliśmy inne dane dostępowe (login i password), również trzeba je zmienić w pliku mysite/pickup/views.py. Wprowadzenie poprawnego loginu, hasła i portu jest kluczowe dla działania aplikacji.
5) W terminalu przechodzimy do folderu .../mysite i uruchamiamy komendę: python manage.py runserver
6) W przeglądarce wpisujemy adres: http://127.0.0.1:8000/
