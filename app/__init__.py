#!/usr/bin/python3
from flask import Flask, jsonify
from .config import app_config # diccionario con las clases de configuracion para la app 
from flask_cors import CORS
from .v1 import v1_attach_apis # funcion para registrar los blueprint en la app

def create_app(config_name="development"):
    app = Flask(__name__)

    app.config.from_object(app_config[config_name]) # agregando la configuracion a la app

    CORS(app, resources={r"/*": {"origins": "*"}}) # agregando la seguridad

    app = v1_attach_apis(app) # agregando los blueprint a la app

    @app.errorhandler(404)
    def page_not_found(err):
        return jsonify({'error': 'Not found'}), 404

    @app.errorhandler(405)
    def page_not_authorized(err):
        return jsonify({'error': 'Not authorized'}), 405

    return app