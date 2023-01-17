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

            cursor.execute("SELECT COUNT(*) FROM (SELECT cosmetics_produsecomandate.ProdusID FROM cosmetics_comenzi "
                    "INNER JOIN cosmetics_produsecomandate ON cosmetics_produsecomandate.ComandaID = cosmetics_comenzi.ComandaID "
                    "INNER JOIN (SELECT ProdusID, COUNT(*) as NrPoze FROM cosmetics_pozeproduse GROUP BY ProdusID) AS pozeproduse "
                    "ON pozeproduse.ProdusID = cosmetics_produsecomandate.ProdusID "
                    "WHERE pozeproduse.NrPoze > 0 GROUP BY cosmetics_produsecomandate.ProdusID HAVING COUNT(cosmetics_comenzi.ComandaID) > 1) as test")
            numarProdusePozeVSNrComenzi = cursor.fetchone()[0]

            cursor.execute("SELECT COUNT(*) FROM (SELECT cosmetics_produse.ProdusID, AVG(cosmetics_reviews.Nota) as NotaMedie FROM cosmetics_produse "
                    "INNER JOIN cosmetics_reviews ON cosmetics_reviews.ProdusID = cosmetics_produse.ProdusID "
                    "GROUP BY cosmetics_produse.ProdusID HAVING AVG(cosmetics_reviews.Nota) > 2) as NoteReview "
                    "INNER JOIN "
                    "(SELECT cosmetics_produse.ProdusID, COUNT(cosmetics_produse.ProdusID) FROM cosmetics_produse "
                    "INNER JOIN cosmetics_reviews ON cosmetics_reviews.ProdusID = cosmetics_produse.ProdusID "
                    "GROUP BY cosmetics_produse.ProdusID HAVING COUNT(cosmetics_produse.ProdusID) > 1) as TotalReviews  "
                    "ON TotalReviews.ProdusID = NoteReview.ProdusID")
            numarProduseMedieVSNrReview = cursor.fetchone()[0]

            cursor.execute("SELECT produselecomandate.Nume, produselecomandate.Prenume FROM "
                    "(SELECT cosmetics_clienti.Nume, cosmetics_clienti.Prenume, cosmetics_clienti.ClientID, cosmetics_produsecomandate.ProdusID "
                    "FROM cosmetics_clienti "
                    "INNER JOIN cosmetics_comenzi ON cosmetics_clienti.ClientID = cosmetics_comenzi.ClientID "
                    "INNER JOIN cosmetics_produsecomandate ON cosmetics_produsecomandate.ComandaID = cosmetics_comenzi.ComandaID "
                    "GROUP BY cosmetics_clienti.ClientID, cosmetics_produsecomandate.ProdusID) as produselecomandate "
                    "INNER JOIN "
                    "(SELECT cosmetics_clienti.ClientID, cosmetics_reviews.ProdusID FROM cosmetics_clienti "
                    "INNER JOIN cosmetics_reviews ON cosmetics_clienti.ClientID = cosmetics_clienti.ClientID "
                    "GROUP BY cosmetics_reviews.ProdusID) as comenturi "
                    "ON produselecomandate.ProdusID = comenturi.ProdusID")
            clientii = cursor.fetchall()
            
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
        'paths':paths,
        'numarProdusePozeVSNrComenzi':numarProdusePozeVSNrComenzi,
        'numarProduseMedieVSNrReview':numarProduseMedieVSNrReview,
        'clientii':clientii
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

            cursor.execute("SELECT Pret, DataCreare, SUM(cosmetics_produsecomandate.Cantitate), Status FROM cosmetics_comenzi "
                    "INNER JOIN cosmetics_produsecomandate ON cosmetics_produsecomandate.ComandaID = cosmetics_comenzi.ComandaID "
                    f"WHERE ClientID = {ClientID} GROUP BY cosmetics_comenzi.ComandaID")
            comenzi = cursor.fetchall()

            cursor.execute("SELECT Judet, Localitate, Adresa, CodPostal FROM cosmetics_comenzi "
                    "INNER JOIN cosmetics_adrese on cosmetics_comenzi.AdresaID = cosmetics_adrese.AdresaID "
                    f"WHERE cosmetics_comenzi.ClientID = {ClientID} GROUP BY cosmetics_comenzi.AdresaID")
            adreseComenzi = cursor.fetchall()

        except Exception as e:
            raise Http404(str(e))
        finally:
            cursor.close()

    #comenzi = dumps(comenzi)

    context = {
                'comenzi' : comenzi,
                'adreseComenzi' : adreseComenzi}

    return render(request, 'Cosmetics/profile.html', context)

def produs(request):
    produsID = request.GET['ProdusID']
    ClientID = request.session.get('ClientID', None)

    with connection.cursor() as cursor:
        try:
            cursor.execute(f"SELECT ProdusID, Denumire, Producator, Pret, Descriere FROM cosmetics_produse WHERE ProdusID = {produsID}")
            produs = cursor.fetchone()
            if produs[0] == None:
                raise Exception

            cursor.execute(f"SELECT ProdusID, Path FROM cosmetics_pozeproduse WHERE ProdusID = {produsID}")
            paths = cursor.fetchall()

            cursor.execute("SELECT DataCrearii, Titlu, Content, Nota, cosmetics_clienti.Nume, cosmetics_clienti.Prenume FROM cosmetics_reviews "
                    "INNER JOIN cosmetics_clienti ON cosmetics_clienti.ClientID = cosmetics_reviews.ClientID " 
                    f"WHERE ProdusID = {produsID}")
            reviews = cursor.fetchall()

            if ClientID != None:
                cursor.execute("SELECT SUM(cosmetics_produsecomandate.Cantitate) FROM cosmetics_comenzi "
                        "INNER JOIN cosmetics_produsecomandate ON (cosmetics_comenzi.ComandaID = cosmetics_produsecomandate.ComandaID) "
                        f"WHERE cosmetics_comenzi.ClientID = {ClientID} AND cosmetics_produsecomandate.ProdusID = {produsID}")
                sumatotala = cursor.fetchone()[0]
            else:
                sumatotala = 0

            cursor.execute("SELECT COUNT(*) FROM cosmetics_comenzi "
                    "INNER JOIN cosmetics_produsecomandate ON cosmetics_produsecomandate.ComandaID = cosmetics_comenzi.ComandaID "
                    f"WHERE cosmetics_produsecomandate.ProdusID = {produsID}")
            aparitiiInComenzi = cursor.fetchone()[0]

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
        'paths':paths,
        'reviews':reviews,
        'sumatotala':sumatotala,
        'aparitiiInComenzi':aparitiiInComenzi
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