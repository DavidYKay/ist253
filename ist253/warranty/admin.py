from ist253.warranty.models import *
from django.contrib import admin

#class CustomerInline(admin.TabularInline):
#    model = Customer
#    extra = 5

class CustomerAdmin(admin.ModelAdmin):
    list_display = (
        'customeraccountno',
        'customerlname',
        'customerfname',
        'customeraddress',
        'customercity',
        'customerstate',
        'zip',
        'phone',
     )

class InventoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'first', 'second', 'third')
    
admin.site.register(Customer , CustomerAdmin ) 
admin.site.register(Inventory , InventoryAdmin ) 
