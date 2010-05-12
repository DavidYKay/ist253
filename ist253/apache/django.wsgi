import os
import sys
#sys.path.append('/usr/local/django')
sys.path.append('/var/www/localhost/app/')

os.environ['DJANGO_SETTINGS_MODULE'] = 'ist253.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

