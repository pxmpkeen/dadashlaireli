from flask_restx import Resource
from routes import ns

@ns.route("users")
class Users(Resource):
    def get(self):
        