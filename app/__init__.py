from flask import Flask
from .api import api
from .api.models import db
from .api.routes import ns

def create_app():
    app = Flask(__name__)

    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqldb://root:root@localhost/silkway'
    # app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    api.init_app(app)
    db.init_app(app)

    api.add_namespace(ns)
    return app