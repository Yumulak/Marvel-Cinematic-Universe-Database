from flask import Blueprint, jsonify, abort, request
from ..models import Comic_writer, db

bp = Blueprint('comic_writers', __name__, url_prefix='/comic_writers')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    comic_writers = Comic_writer.query.all() # ORM performs SELECT query
    result = []
    for cw in comic_writers:
        result.append(cw.serialize()) # build list of comic writers as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/int:id>', methods=['GET'])
def show(id: int):
    cw = Comic_writer.query.get_or_404(id)
    return jsonify(cw.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain all info
    if 'first_name' not in request.json or 'last_name':
        return abort(400)
    # construct Comic_writer entry
    cw = Comic_writer(
        first_name=request.json['first_name'],
        last_name=request.json['last_name']
    )

    db.session.add(cw) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(cw.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    cw = Comic_writer.query.get_or_404(id)
    try:
        db.session.delete(cw) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)