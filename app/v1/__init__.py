from .routes.cohorts import cohorts_api


def v1_attach_apis(app):
    app.register_blueprint(cohorts_api, url_prefix="/v1/cohorts")
    return app