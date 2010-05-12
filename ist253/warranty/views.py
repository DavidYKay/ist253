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
    #inventory_list = Inventory.objects.all()
    t = loader.get_template('warranty/inventory.html')
    c = Context({
        'inventory_list': inventory_list,
    })
    return HttpResponse(t.render(c))
    #return HttpResponse("Yahoo")

def inventory_detail(request, partno):
    inventory_list = Inventory.objects.all()
    inventory = get_object_or_404(Inventory, pk=partno)
    t = loader.get_template('warranty/inventory_detail.html')
    c = Context({
        'inventory': inventory,
    })
    return HttpResponse(t.render(c))

def diagnostic_list(request):
    diagnostic_list = Diagnostic.objects.all().order_by('diagno')
    #diagnostic_list = Diagnostic.objects.all()
    t = loader.get_template('warranty/diagnostic.html')
    c = Context({
        'diagnostic_list': diagnostic_list,
    })
    return HttpResponse(t.render(c))
    #return HttpResponse("Yahoo")

def diagnostic_detail(request, diagno):
    diagnostic_list = Diagnostic.objects.all()
    diagnostic = get_object_or_404(Diagnostic, pk=diagno)
    t = loader.get_template('warranty/diagnostic_detail.html')
    c = Context({
        'diagnostic': diagnostic,
    })
    return HttpResponse(t.render(c))


def invoice_list(request):
    invoice_list = Invoice.objects.all().order_by('invno')
    #invoice_list = Invoice.objects.all()
    t = loader.get_template('warranty/invoice_list.html')
    c = Context({
        'invoice_list': invoice_list,
    })
    return HttpResponse(t.render(c))
    #return HttpResponse("Yahoo")

def invoice_detail(request, invno):
    invoice_list = Invoice.objects.all()
    invoice = get_object_or_404(Invoice, pk=invno)
    t = loader.get_template('warranty/invoice_detail.html')
    c = Context({
        'invoice': invoice,
    })
    return HttpResponse(t.render(c))


def test_list(request):
    test_list = TestResults.objects.all().order_by('testresno')
    #test_list = TestResults.objects.all()
    t = loader.get_template('warranty/test_list.html')
    c = Context({
        'test_list': test_list,
    })
    return HttpResponse(t.render(c))
    #return HttpResponse("Yahoo")

def test_detail(request, testresno):
    test_list = TestResults.objects.all()
    test = get_object_or_404(TestResults, pk=testresno)
    t = loader.get_template('warranty/test_detail.html')
    c = Context({
        'test': test,
    })
    return HttpResponse(t.render(c))


def service_plan_list(request):
    service_plan_list = ServicePlan.objects.all().order_by('serplanno')
    #service_plan_list = ServicePlan.objects.all()
    t = loader.get_template('warranty/service_plan_list.html')
    c = Context({
        'service_plan_list': service_plan_list,
    })
    return HttpResponse(t.render(c))
    #return HttpResponse("Yahoo")

def service_plan_detail(request, serplanno):
    service_plan_list = ServicePlan.objects.all()
    service_plan = get_object_or_404(ServicePlan, pk=serplanno)
    t = loader.get_template('warranty/service_plan_detail.html')
    c = Context({
        'service_plan': service_plan,
    })
    return HttpResponse(t.render(c))
