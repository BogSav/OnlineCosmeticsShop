from django.db import models

class Adrese(models.Model):
    class Meta:  
        verbose_name_plural = 'Adrese'

    AdresaID = models.AutoField(primary_key=True)
    Judet = models.CharField(max_length=30)
    Localitate = models.CharField(max_length=30)
    Adresa = models.CharField(max_length=70)
    CodPostal = models.CharField(max_length=20)

class Clienti(models.Model):
    class Meta:  
        verbose_name_plural = 'Clienti'

    ClientID = models.AutoField(primary_key=True)
    AdresaID = models.ForeignKey(Adrese, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='AdresaID', db_column="AdresaID")
    Password = models.CharField(max_length=45)
    Nume = models.CharField(max_length=45)
    Prenume = models.CharField(max_length=45)
    Email = models.CharField(max_length=50)
    StatusCont = models.CharField(max_length=30)
    DataNastere = models.DateField(blank=True,null=True)
    DataCreareCont = models.DateField()
    Gender = models.SmallIntegerField(default=1,blank=True,null=True)

    def __str__(self):
        return self.Nume + " " + self.Prenume

class Comenzi(models.Model):
    class Meta:  
        verbose_name_plural = 'Comenzi'
    
    ComandaID = models.AutoField(primary_key=True)
    ClientID = models.ForeignKey(Clienti, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ClientID', db_column="ClientID")
    AdresaID = models.ForeignKey(Adrese, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='AdresaID', db_column="AdresaID")
    Pret = models.FloatField()
    DataCreare = models.DateField()
    Status = models.CharField(max_length=30)

class Produse(models.Model):
    class Meta:  
        verbose_name_plural = 'Produse'

    ProdusID = models.AutoField(primary_key=True)
    Denumire = models.CharField(max_length=50)
    Producator = models.CharField(max_length=45)
    DataAdaugarii = models.DateField()
    Status = models.CharField(max_length=45)
    Pret = models.FloatField(blank=True,null=True)
    Cantitate = models.IntegerField(default=0,blank=True,null=True)
    Descriere = models.TextField(max_length=8000)

    def __str__(self):
        return self.Denumire

class ProduseComandate(models.Model):
    class Meta:  
        verbose_name_plural = 'ProduseComandate'

    ProdusComandatID = models.AutoField(primary_key=True)
    Cantitate = models.IntegerField()
    ProdusID = models.ForeignKey(Produse, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ProdusID', db_column="ProdusID")
    ComandaID = models.ForeignKey(Comenzi, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ComandaID', db_column="ComandaID")

class Reviews(models.Model):
    class Meta:  
        verbose_name_plural = 'Reviews'

    ReviewID = models.AutoField(primary_key=True)
    ClientID = models.ForeignKey(Clienti, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ClientID', db_column="ClientID")
    ProdusID = models.ForeignKey(Produse, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ProdusID', db_column="ProdusID")
    DataCrearii = models.DateField()
    Titlu = models.CharField(max_length=45)
    Content = models.TextField(max_length = 500)
    Nota = models.SmallIntegerField()

class PozeProduse(models.Model):
    class Meta:  
        verbose_name_plural = 'PozeProduse'

    PozaProdusID = models.AutoField(primary_key=True)
    ProdusID = models.ForeignKey(Produse, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ProdusID', db_column="ProdusID")
    Path = models.CharField(max_length=160)

    def __str__(self):
        return "Poza " + self.ProdusID.Denumire.lower()

class ProduseInCos(models.Model):
    class Meta:
        verbose_name_plural = 'ProduseInCos'

    ProdusInCosID = models.AutoField(primary_key=True)
    ProdusID = ProdusID = models.ForeignKey(Produse, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ProdusID', db_column="ProdusID")
    ClientID = models.ForeignKey(Clienti, on_delete=models.DO_NOTHING, blank=True, null=True, to_field='ClientID', db_column="ClientID")