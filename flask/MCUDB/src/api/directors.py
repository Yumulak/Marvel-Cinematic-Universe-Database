from flask import Blueprint, jsonify, abort, request
from ..models import Director, db

bp = Blueprint('directors', __name__, url_prefix='/directors')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    directors = Director.query.all() # ORM performs SELECT query
    result = []
    for d in directors:
        result.append(d.serialize()) # build list of comic writers as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/int:id>', methods=['GET'])
def show(id: int):
    d = Director.query.get_or_404(id)
    return jsonify(d.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain all info
    if 'first_name' not in request.json or 'last_name':
        return abort(400)
    # construct director entry
    d = Director(
        first_name=request.json['first_name'],
        last_name=request.json['last_name']
    )

    db.session.add(d) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(d.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    d = Director.query.get_or_404(id)
    try:
        db.session.delete(d) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)