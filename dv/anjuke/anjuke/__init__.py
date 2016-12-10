import sys
import os
import django

sys.path.append('/home/jjzhu/workspace/dv')
os.environ['DJANGO_SETTINGS_MODULE'] = 'dv.settings'
django.setup()
