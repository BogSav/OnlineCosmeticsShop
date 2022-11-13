from django.shortcuts import render
from json import dumps
from django.core import serializers

from django.http import HttpResponse, Http404, HttpResponseRedirect

from django.db import connection

from datetime import date

def index(request):
    with connection.cursor() as cursor:
        try:
            cursor.execute("SELECT ProdusID, Path FROM cosmetics_pozeproduse WHERE ProdusID IN (SELECT ProdusID FROM cosmetics_produse WHERE Status = 'Disponibil')")
            paths = cursor.fetchall()

            cursor.execute("SELECT ProdusID, Denumire, Producator, Pret, Descriere FROM cosmetics_produse WHERE Status = 'Disponibil' ORDER BY Denumire")
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
    if is_ajax(request):
        nume = request.POST['nume']
        prenume = request.POST['prenume']
        datanasterii = request.POST['datanasterii']
        email = request.POST['email']
        password = request.POST['password']
        adresscheck = request.POST['adresscheck']
        gender = request.POST['gender']

        datacrearecont = date.today()

        with connection.cursor() as cursor:
            try:
                try:
                    cursor.execute(f"SELECT * FROM cosmetic_clienti WHERE Email = {email}")
                    cursor.fetchone()
                except:
                    pass
                else:
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
            finally:
                cursor.close()

    return render(request, 'Cosmetics/register.html', {})

def loginPage(request):
    if is_ajax(request):
        email = request.POST['email']
        password = request.POST['password']

        with connection.cursor() as cursor:
            try:
                cursor.execute(f"SELECT ClientID, Nume, Prenume FROM cosmetics_clienti WHERE Email = '{email}' AND Password = '{password}'")
                client = cursor.fetchone()
                if client == None:
                    raise Exception
            except Exception as e:
                raise Http404(str(e))
            else:
                request.session['ClientID'] = client[0]
                request.session['Nume'] = client[1]
                request.session['Prenume'] = client[2]
            finally:
                cursor.close

    return render(request, 'Cosmetics/login.html')

def logout(request):
    if 'ClientID' not in request.session:
        return HttpResponseRedirect('/')

    del request.session['ClientID']
    del request.session['Nume']
    del request.session['Prenume']

    return HttpResponseRedirect('/')