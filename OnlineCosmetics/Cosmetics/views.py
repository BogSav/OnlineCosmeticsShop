from datetime import date
from json import dumps

from django.db import connection
from django.http import Http404, HttpResponseRedirect
from django.shortcuts import render


def index(request):
    order_by = "WHERE Status = 'Disponibil' ORDER BY Pret"

    with connection.cursor() as cursor:
        try:
            cursor.execute("SELECT ProdusID, Path FROM cosmetics_pozeproduse "
                "WHERE ProdusID IN (SELECT ProdusID FROM cosmetics_produse WHERE Status = 'Disponibil')"
            )
            paths = cursor.fetchall()

            cursor.execute("SELECT ProdusID, Denumire, Producator, Pret, Descriere FROM cosmetics_produse " + order_by)
            produse = cursor.fetchall()
        except Exception as e:
            raise Http404(str(e))
        else:
            paths = [{'ProdusId':x[0], 'Path':x[1]} for x in paths]
            produse = [{'ProdusId':x[0], 'Denumire':x[1], 'Producator':x[2], 'Pret':x[3], 'Descriere':x[4]} for x in produse]
        finally:
            cursor.close()

    paths = dumps(paths)
    produse = dumps(produse)

    context = {
        'produse':produse,
        'paths':paths
        }

    return render(request, 'Cosmetics/index.html', context)

def is_ajax(request):
    return request.META.get('HTTP_X_REQUESTED_WITH') == 'XMLHttpRequest'

def registerPage(request):
    return render(request, 'Cosmetics/register.html', {})

def loginPage(request):
    return render(request, 'Cosmetics/login.html')

def logout(request):
    if 'ClientID' not in request.session:
        return HttpResponseRedirect('/')

    del request.session['ClientID']
    del request.session['Nume']
    del request.session['Prenume']

    return HttpResponseRedirect('/')

def profile(request):
    if 'ClientID' not in request.GET:
        return HttpResponseRedirect('/')
    elif 'ClientID' not in request.session:
        return HttpResponseRedirect('/')
    elif int(request.GET['ClientID']) != request.session['ClientID']:
        return HttpResponseRedirect('/')

    comenzi = None

    with connection.cursor() as cursor:
        try:
            ClientID = request.session['ClientID']

            cursor.execute("SELECT Pret, DataCreare, COUNT(*), Status FROM cosmetics_comenzi "
            "INNER JOIN cosmetics_produsecomandate ON cosmetics_produsecomandate.ComandaID = cosmetics_comenzi.ComandaID "
            f"WHERE ClientID = {ClientID} GROUP BY cosmetics_comenzi.ComandaID")

            comenzi = cursor.fetchall()

        except Exception as e:
            raise Http404(str(e))
        finally:
            cursor.close()

    #comenzi = dumps(comenzi)

    context = {'comenzi' : comenzi}

    return render(request, 'Cosmetics/profile.html', context)

def produs(request):
    produsID = request.GET['ProdusID']
    with connection.cursor() as cursor:
        try:
            cursor.execute(f"SELECT ProdusID, Denumire, Producator, Pret, Descriere FROM cosmetics_produse WHERE ProdusID = {produsID}")
            if cursor.fetchone() == None:
                raise Exception

            cursor.execute(f"SELECT ProdusID, Path FROM cosmetics_pozeproduse WHERE ProdusID = {produsID}")
            paths = cursor.fetchall()
        except Exception as e:
            return HttpResponseRedirect('/')
        else:
            paths = [x[1] for x in paths]
            produs = {'ProdusId':produs[0], 'Denumire':produs[1], 'Producator':produs[2], 'Pret':produs[3], 'Descriere':produs[4]}
        finally:
            cursor.close()

    produs = dumps(produs)
    paths = dumps(paths)

    context = {
        'produs':produs,
        'paths':paths
        }


    return render(request, 'Cosmetics/produs.html', context)

def getProduseInCos(ClientID):
    with connection.cursor() as cursor:
        try:
            cursor.execute("SELECT Denumire, COUNT(*), pozeproduse.Path, cosmetics_produseincos.ProdusID FROM cosmetics_produseincos " 
                "INNER JOIN cosmetics_produse ON (cosmetics_produseincos.ProdusID = cosmetics_produse.ProdusID) "
                "INNER JOIN (SELECT DISTINCT * FROM cosmetics_pozeproduse GROUP BY ProdusID) AS pozeproduse "
                "ON (cosmetics_produse.ProdusID = pozeproduse.ProdusID) "
                f"WHERE cosmetics_produseincos.ClientID = {ClientID} GROUP BY Denumire"
                )

            produse = cursor.fetchall()
            produse = [{'Denumire' : x[0], 'Cantitate' : x[1], 'Path' : x[2], 'ProdusID': x[3]} for x in produse] 

            return produse
        except Exception as e:
            return Http404(str(e))

def cos(request):
    ClientID = request.GET['ClientID']

    if 'ClientID' not in request.GET:
        return HttpResponseRedirect('/')
    elif 'ClientID' not in request.session:
        return HttpResponseRedirect('/')
    elif int(ClientID) != request.session['ClientID']:
        return HttpResponseRedirect('/')
    
    produse = getProduseInCos(ClientID)
    produse = dumps(produse)

    context = {
        'produse' : produse
    }

    return render(request, 'Cosmetics/cos.html', context)