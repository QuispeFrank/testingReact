#!/usr/bin/python3
from .routes.cohortes import cohortes_api



def v1_attach_apis(app):
    app.register_blueprint(cohortes_api, url_prefix="/api/v1/cohortes")
    return app