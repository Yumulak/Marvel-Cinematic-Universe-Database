from flask import Blueprint, jsonify, abort, request
from ..models import Comic_illustrator, db

bp = Blueprint('comic_illustrators', __name__, url_prefix='/comic_illustrators')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    comic_writers = Comic_illustrator.query.all() # ORM performs SELECT query
    result = []
    for ci in comic_writers:
        result.append(ci.serialize()) # build list of comic writers as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/int:id>', methods=['GET'])
def show(id: int):
    ci = Comic_illustrator.query.get_or_404(id)
    return jsonify(ci.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain all info
    if 'first_name' not in request.json or 'last_name':
        return abort(400)
    # construct Comic_illustrator entry
    ci = Comic_illustrator(
        first_name=request.json['first_name'],
        last_name=request.json['last_name']
    )

    db.session.add(ci) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(ci.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    ci = Comic_illustrator.query.get_or_404(id)
    try:
        db.session.delete(ci) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)