from flask_restx import Namespace, Resource

ns = Namespace("api")

from .user import Users
