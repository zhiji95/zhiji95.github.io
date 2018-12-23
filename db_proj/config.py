import os
"""import pymysql
"""
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
	 SECRET_KEY = os.environ.get('SECRET_KEY') or 'secret_key'
	 DB_USER = "ll3235"
	 DB_PASSWORD = "tf7uykkz"

	 DB_SERVER = "w4111.cisxo09blonu.us-east-1.rds.amazonaws.com"

	 SQLALCHEMY_DATABASE_URI = "postgresql://"+DB_USER+":"+DB_PASSWORD+"@"+DB_SERVER+"/w4111"