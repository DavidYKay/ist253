from django.conf.urls.defaults import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

#urlpatterns = patterns('',
    # Example:
    # (r'^ist253/', include('ist253.foo.urls')),

    # Uncomment the admin/doc line below and add 'django.contrib.admindocs' 
    # to INSTALLED_APPS to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
     #(r'^admin/', include(admin.site.urls)),
#)

#urlpatterns = patterns('ist253.warranty',


#urlpatterns = patterns('',
#    url(r'^/$', 'ist253.warranty.views.index'),
#    url(r'', 'ist253.warranty.views.index'),
#    url(r'^customers/(\d+)/$', 'ist253.warranty.views.customer_detail'),
#)


urlpatterns = patterns('ist253.warranty.views',
    url(r'^$', 'index'),
    url(r'^customer_products/$', 'customer_product_list'),

    url(r'^customers/$', 'customer_list'),
    url(r'^customers/(\d+)/$', 'customer_detail'),

    url(r'^products/$', 'product_list'),
    #url(r'^products/(\d+)/$', 'product_detail'),
    url(r'^products/(\w+)/$', 'product_detail'),

    url(r'^invoices/$', 'invoice_list'),
    url(r'^invoices/(\d+)/$', 'invoice_detail'),

    url(r'^inventory/$', 'inventory_list'),
    url(r'^inventory/(\d+)/$', 'inventory_detail'),

    url(r'^diagnostics/$', 'diagnostic_list'),
    url(r'^diagnostics/(\d+)/$', 'diagnostic_detail'),

    url(r'^service_plans/$', 'service_plan_list'),
    url(r'^service_plans/(\d+)/$', 'service_plan_detail'),

    url(r'^test_results/$', 'test_list'),
    url(r'^test_results/(\d+)/$', 'test_detail'),

    #(r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
    #            {'document_root': settings.STATIC_DOC_ROOT}),
)
