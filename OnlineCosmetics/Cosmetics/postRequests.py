from datetime import date
from json import dumps

from django.db import connection
from django.http import Http404, HttpResponseRedirect, JsonResponse

from .views import getProduseInCos

def is_ajax(request):
    return request.META.get('HTTP_X_REQUESTED_WITH') == 'XMLHttpRequest'

def registerPOST(request):
    if not is_ajax(request):
        raise Http404()

    nume = request.POST['nume']
    prenume = request.POST['prenume']
    datanasterii = request.POST['datanasterii']
    email = request.POST['email']
    password = request.POST['password']
    adresscheck = request.POST['adresscheck']
    gender = request.POST['gender']

    datacrearecont = date.today()

    data = {
        'resultText' : "",
        'succes' : 0,
    }

    with connection.cursor() as cursor:
        try:
            try:
                cursor.execute(f"SELECT * FROM cosmetics_clienti WHERE Email = '{email}'")
                client = cursor.fetchall()

                if client != None:
                    data['resultText'] = "User deja exista boss"
                    data['succes'] = 0
                    return JsonResponse(data)
            except:
                raise Exception

            cursor.execute("INSERT INTO cosmetics_clienti (Nume, Prenume, Email, Password, DataNastere, Gender, StatusCont, DataCreareCont)" 
                f"VALUES ('{nume}', '{prenume}', '{email}' , '{password}', '{datanasterii}', '{gender}', 'Activ', '{datacrearecont}')"
                )
            
            cursor.execute("SELECT LAST_INSERT_ID()")
            client_id = cursor.fetchone()[0]

            if adresscheck == 'true':
                judet = request.POST['judet']
                localitate = request.POST['localitate']
                adresa = request.POST['adresa']
                codpostal = request.POST['codpostal']

                cursor.execute("INSERT INTO cosmetics_adrese (Judet, Localitate, Adresa, CodPostal)"
                    f"VALUES ('{judet}', '{localitate}', '{adresa}', '{codpostal}')"
                    )
                    
                cursor.execute(f"UPDATE cosmetics_clienti SET AdresaID = (SELECT LAST_INSERT_ID()) WHERE ClientID = '{client_id}'")
        except Exception as e:
            raise Http404(str(e))
        else:
            request.session['ClientID'] = client_id
            request.session['Nume'] = nume
            request.session['Prenume'] = prenume

            data['resultText'] = "Contul a fost creat cu succes"
            data['succes'] = 1
        finally:
            cursor.close()

    return JsonResponse(data)

def loginPOST(request):
    if not is_ajax(request):
        raise Http404()

    email = request.POST['email']
    password = request.POST['password']

    data = {
        'resultText' : "",
        'succes' : 0,
    }

    with connection.cursor() as cursor:
        try:
            cursor.execute(f"SELECT ClientID, Nume, Prenume, Password FROM cosmetics_clienti WHERE Email = '{email}'")
            client = cursor.fetchone()

            if client == None:
                data['resultText'] = "Userul nu exista"
                data['succes'] = 0
                return JsonResponse(data)

            print(client)

            if client[3] != password:
                data['resultText'] = "Parola gresita"
                data['succes'] = 0
                return JsonResponse(data)

        except Exception as e:
            raise Http404(str(e))
        else:
            request.session['ClientID'] = client[0]
            request.session['Nume'] = client[1]
            request.session['Prenume'] = client[2]

            data['resultText'] = "Logarea a avut succes"
            data['succes'] = 1
        finally:
            cursor.close

    return JsonResponse(data)

def addProdusInCos(request):
    if not is_ajax(request):
        raise Http404()

    ClientID = request.session['ClientID']
    ProdusID = request.POST['ProdusId']

    succes = 0

    with connection.cursor() as cursor:
        try:
            cursor.execute("INSERT INTO cosmetics_produseincos (ProdusID, ClientID)" 
                f"VALUES ('{ProdusID}', '{ClientID}')"
                )

        except Exception as e:
            raise Http404(str(e))
        else:
            succes = 1
        finally:
            cursor.close   

    return JsonResponse({'succes' : succes})

def modificaCantitateCos(request):
    if not is_ajax(request):
        raise Http404()

    ClientID = request.session['ClientID']
    ProdusID = request.POST['ProdusID']
    Actiune = request.POST['Actiune']

    with connection.cursor() as cursor:
        try:
            if int(Actiune) == -1:
                cursor.execute(f"DELETE FROM cosmetics_produseincos WHERE ProdusID = {ProdusID} AND ClientID = {ClientID} LIMIT 1")
            else:
                cursor.execute(f"INSERT INTO cosmetics_produseincos (ProdusID, ClientID) VALUE ({ProdusID}, {ClientID})")
        except Exception as e:
            raise Http404(str(e))

    return JsonResponse({'produse' : getProduseInCos(ClientID)})

def comandaPOST(request):
    if not is_ajax(request):
        raise Http404()

    
    pass