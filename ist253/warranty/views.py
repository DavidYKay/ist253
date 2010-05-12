from ist253.warranty.models import * 
from django.shortcuts import render_to_response, get_object_or_404   
from django.http import HttpResponse
from django.template import Context, loader

def index(request):
    return render_to_response("home.html")

#Plaintext return
def plain(request):
    customer_list = Customer.objects.all()
    output = ', '.join([c.customerfname for c in customer_list])
    return HttpResponse(output)


def customer_product_list(request):
    #customer_product_list = CustomerProduct.objects.all().order_by('customeraccountno')
    customer_product_list = CustomerProduct.objects.all()
    t = loader.get_template('warranty/customer_product_list.html')
    c = Context({
        'customer_product_list': customer_product_list,
    })
    return HttpResponse(t.render(c))

def customer_list(request):
    #latest_customer_list = Customer.objects.all().order_by('-customeraccountno')[:5]
    latest_customer_list = Customer.objects.all().order_by('customeraccountno')
    t = loader.get_template('warranty/customers.html')
    c = Context({
        'latest_customer_list': latest_customer_list,
    })
    return HttpResponse(t.render(c))

def customer_detail(request, customerAccountNo):
    customer_list = Customer.objects.all()
    customer = get_object_or_404(Customer, pk=customerAccountNo)
    t = loader.get_template('warranty/customer_detail.html')
    c = Context({
        'customer': customer,
    })
    return HttpResponse(t.render(c))

def product_list(request):
    product_list = Product.objects.all().order_by('prodserno')
    t = loader.get_template('warranty/products.html')
    c = Context({
        'product_list': product_list,
    })
    return HttpResponse(t.render(c))

def product_detail(request, productAccountNo):
    product_list = Product.objects.all()
    product = get_object_or_404(Product, pk=productAccountNo)
    t = loader.get_template('warranty/product_detail.html')
    c = Context({
        'product': product,
    })
    return HttpResponse(t.render(c))

def inventory_list(request):
    inventory_list = Inventory.objects.all().order_by('partno')
    t = loader.get_template('warranty/inventory.html')
    c = Context({
        'inventory_list': inventory_list,
    })
    return HttpResponse(t.render(c))

def inventory_detail(request, partno):
    inventory_list = Inventory.objects.all()
    inventory = get_object_or_404(Inventory, pk=partno)
    t = loader.get_template('warranty/inventory_detail.html')
    c = Context({
        'inventory': inventory,
    })
    return HttpResponse(t.render(c))

