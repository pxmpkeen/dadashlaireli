from flask_restx import Resource
from . import ns

    
    
@ns.route("/users")
class Users(Resource):
    def get(self):
        return {"qaqasensen": "abc"}