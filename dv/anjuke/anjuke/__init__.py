import sys
import os
import django

sys.path.append('../../dv')
os.environ['DJANGO_SETTINGS_MODULE'] = 'dv.settings'
django.setup()
