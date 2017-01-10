import os

# Get the path that the server is running from
_basedir = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '../..'))
MHN_SERVER_HOME = _basedir

# Get the path that the app is running in
_basedir = os.path.abspath(os.path.dirname(__file__))
MHN_WEB_SERVER_HOME = _basedir

# Domain or IP address of server
MHN_DOMAIN_NAME = 'cloud.localdomain'

# Setup database
SQLALCHEMY_DATABASE_URI = 'mysql://clouduser:Password123*@localhost/cloudsofhoney'

# Security setting
SECRET_KEY = os.urandom(24).encode('hex')
SECURITY_PASSWORD_HASH = 'pbkdf2_sha512'
SECURITY_TRACKABLE = True
SECURITY_PASSWORD_SALT = os.urandom(15).encode('hex')
