import os

DEBUG = True
TEMPLATE_DEBUG = DEBUG
PROD = False
USE_SSL = False

LOCAL_PATH = os.path.dirname(os.path.abspath(__file__))
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(LOCAL_PATH, 'dashboard_openstack.sqlite3'),
    },
}

CACHE_BACKEND = 'dummy://'

# Configure these for your outgoing email host
# EMAIL_HOST = 'smtp.my-company.com'
# EMAIL_PORT = 25
# EMAIL_HOST_USER = 'djangomail'
# EMAIL_HOST_PASSWORD = 'top-secret!'

NOVA_DEFAULT_ENDPOINT = 'http://172.16.4.184:8773/services/Cloud'
NOVA_DEFAULT_REGION = 'nova'
NOVA_ACCESS_KEY = '2c9c3abb-5118-4a06-92ed-a344f1ad537e:pro1'
NOVA_SECRET_KEY = 'fa7a33c0-56fc-4fad-b526-cf972cf603b3'
NOVA_ADMIN_USER = 'hugo'
NOVA_PROJECT = 'pro1'

# Configure these for your outgoing email host
# EMAIL_HOST = 'smtp.my-company.com'
# EMAIL_PORT = 25
## EMAIL_HOST_USER = 'djangomail'
## EMAIL_HOST_PASSWORD = 'top-secret!'
