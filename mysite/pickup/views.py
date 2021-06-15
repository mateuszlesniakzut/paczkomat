from django.shortcuts import render
from django.http import HttpResponse
import mysql.connector

TEMPLATE_DIRS = (
    'os.path.join(BASE_DIR, "templates"),'
)

code = []
def index(request):
    return render(request, "index.html")

def number(request):
    return render(request, "number.html")

def checking_number(request):
    connection = mysql.connector.connect(user='root', host='localhost', port='3306', password='root')
    myquery = connection.cursor()
    myquery.execute("select * from io.zamówienie")
    found = False
    global code
    for q in myquery:
        if (str(request.GET['telnumber']) == str(q[5])):
            found = True
            code.append(q)
    if found:
        return render(request, "checked_number.html", {"number": request.GET['telnumber']})
    else:
        return render(request, "wrong_number.html", {"number": request.GET['telnumber']})

def checking_code(request):
    if (str(request.GET['code']) == str(code[0][6])):
        return render(request, "checked_code.html")
    else:
        return render(request, "wrong_code.html")

def checking_payment(request):
    connection = mysql.connector.connect(user='root', host='localhost', port='3306', password='root')
    myquery = connection.cursor()
    myquery.execute("select * from io.zamówienie inner join io.opłata on io.zamówienie.ID_opłata_FK = io.opłata.ID_opłata_PK")
    found = False
    for q in myquery:
        if (str(q[5]) == str(code[0][5]) and str(q[6]) == str(code[0][6])):
            found = True
    if found:
        return render(request, "checked_payment.html")
    else:
        return render(request, "wrong_payment.html")

# Create your views here.
