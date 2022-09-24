from flask import Blueprint, jsonify, abort, request
from ..models import Comic_story, db

bp = Blueprint('comic_stories', __name__, url_prefix='/comic_stories')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    comic_stories = Comic_story.query.all() # ORM performs SELECT query
    result = []
    for cs in comic_stories:
        result.append(cs.serialize()) # build list of comic stories as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/int:id>', methods=['GET'])
def show(id: int):
    cs = Comic_story.query.get_or_404(id)
    return jsonify(cs.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain all info
    if 'title' not in request.json or 'description' not in request.json or 'writer_id' not in request.json or 'illustrator_id':
        return abort(400)
    # construct Comic_story entry
    m = Comic_story(
        title=request.json['title'],
        description=request.json['description'],
        writer_id=request.json['writer_id'],
        illustrator_id=request.json['illustrator_id']
    )

    db.session.add(m) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(m.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    cs = Comic_story.query.get_or_404(id)
    try:
        db.session.delete(cs) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)