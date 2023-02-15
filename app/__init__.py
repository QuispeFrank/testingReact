from flask import Flask, jsonify
from .config import app_config
from flask_cors import CORS

def create_app(config_name="development"):
    app = Flask(__name__)

    app.config.from_object(app_config[config_name])

    CORS(app, resources={r"/*": {"origins": "*"}})

    @app.route("/frank")
    def route_test():
        return "<p> Frank el dios del backend <p>"

    @app.errorhandler(404)
    def page_not_found(err):
        return jsonify({'error': 'Not found'}), 404

    @app.errorhandler(405)
    def page_not_authorized(err):
        return jsonify({'error': 'Not authorized'}), 405

    return app