#!/usr/bin/python3
from os import getenv


class Config():
    """Parent configuration class."""
    DEBUG = False
    TESTING = False

    MYSQL_HOST = getenv("INT_MYSQL_HOST")
    MYSQL_USER = getenv("INT_MYSQL_USER")
    MYSQL_PASSWORD = getenv("INT_MYSQL_PASSWORD")
    MYSQL_DB = getenv("INT_MYSQL_DB")

    #UPLOAD_FOLDER = getenv("INT_UPLOAD_FOLDER")

class DevelopmentConfig(Config):
    DEBUG = True

    HOST = getenv("INT_SERVER_HOST")
    PORT = getenv("INT_SERVER_PORT")
    SERVER_NAME = getenv("INT_SERVER_NAME")

class ProductionConfig(Config):
    DEBUG = False

app_config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig
}
