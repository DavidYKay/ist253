from django.db import models

# Create your models here.

class Product(models.Model):
    prodserno = models.CharField(max_length=54, primary_key=True, db_column='ProdSerNo') # Field name made lowercase.
    prodtype  = models.CharField(max_length=54, db_column='ProdType') # Field name made lowercase.
    class Meta:
        db_table = u'PRODUCT'

class Customer(models.Model):
    customeraccountno = models.IntegerField(primary_key=True, db_column='CustomerAccountNo') # Field name made lowercase.
    customerlname = models.CharField(max_length=60, db_column='CustomerLName', blank=True) # Field name made lowercase.
    customerfname = models.CharField(max_length=60, db_column='CustomerFName', blank=True) # Field name made lowercase.
    customeraddress = models.CharField(max_length=60, db_column='CustomerAddress', blank=True) # Field name made lowercase.
    customercity = models.CharField(max_length=60, db_column='CustomerCity', blank=True) # Field name made lowercase.
    customerstate = models.CharField(max_length=60, db_column='CustomerState', blank=True) # Field name made lowercase.
    customerzip = models.CharField(max_length=60, db_column='CustomerZip', blank=True) # Field name made lowercase.
    customerphone = models.CharField(max_length=60, db_column='CustomerPhone', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'CUSTOMER'

class Diagnostic(models.Model):
    diagno        = models.IntegerField(primary_key=True, db_column='DiagNo') # Field name made lowercase.
    diagbegindate = models.DateField(db_column='DiagBeginDate') # Field name made lowercase.
    diagenddate   = models.DateField(null=True, db_column='DiagEndDate', blank=True) # Field name made lowercase.
    diagresult    = models.CharField(max_length=60, db_column='DiagResult', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'DIAGNOSTIC'

class Inventory(models.Model):
    partno    = models.CharField(max_length=54, primary_key=True, db_column='PartNo') # Field name made lowercase.
    partname  = models.CharField(max_length=60, db_column='PartName') # Field name made lowercase.
    partavail = models.IntegerField(db_column='PartAvail') # Field name made lowercase.
    prodtype  = models.CharField(max_length=60, db_column='ProdType') # Field name made lowercase.
    class Meta:
        db_table = u'INVENTORY'

class Invoice(models.Model):
    invno = models.IntegerField(primary_key=True, db_column='InvNo') # Field name made lowercase.
    invdate = models.DateField(db_column='InvDate') # Field name made lowercase.
    salestax = models.DecimalField(decimal_places=2, max_digits=12, db_column='SalesTax') # Field name made lowercase.
    invduedate = models.DateField(db_column='InvDueDate') # Field name made lowercase.
    class Meta:
        db_table = u'INVOICE'

class ServicePlan(models.Model):
    serplanno     = models.IntegerField(primary_key=True, db_column='SerPlanNo') # Field name made lowercase.
    serplantype   = models.CharField(max_length=60, db_column='SerPlanType') # Field name made lowercase.
    serplanrate   = models.DecimalField(decimal_places=2, max_digits=12, db_column='SerPlanRate') # Field name made lowercase.
    serplanissued = models.DateField(db_column='SerPlanIssued') # Field name made lowercase.
    class Meta:
        db_table = u'SERVICE_PLAN'

class TestResults(models.Model):
    testresno = models.IntegerField(primary_key=True, db_column='TestResNo') # Field name made lowercase.
    prodserno = models.ForeignKey(Product, null=True, db_column='ProdSerNo', blank=True) # Field name made lowercase.
    diagno = models.ForeignKey(Diagnostic, null=True, db_column='DiagNo', blank=True) # Field name made lowercase.
    status = models.CharField(max_length=54, db_column='Status', blank=True) # Field name made lowercase.
    partno = models.ForeignKey(Inventory, null=True, db_column='PartNo', blank=True) # Field name made lowercase.
    estserdate = models.DateField(null=True, db_column='EstSerDate', blank=True) # Field name made lowercase.
    class Meta:
        db_table = u'TEST_RESULTS'

class CustomerProduct(models.Model):
    custprodno        = models.IntegerField(primary_key=True, db_column='CustProdNo') # Field name made lowercase.
    customeraccountno = models.ForeignKey(Customer, db_column='CustomerAccountNo') # Field name made lowercase.
    prodserno         = models.ForeignKey(Product, db_column='ProdSerNo') # Field name made lowercase.
    serplanno         = models.ForeignKey(ServicePlan, db_column='SerPlanNo') # Field name made lowercase.
    class Meta:
        db_table = u'CUSTOMER_PRODUCT'

class InvoiceService(models.Model):
    invno = models.ForeignKey(Invoice, db_column='InvNo') # Field name made lowercase.
    serplanno = models.ForeignKey(ServicePlan, db_column='SerPlanNo') # Field name made lowercase.
    class Meta:
        db_table = u'INVOICE_SERVICE'
