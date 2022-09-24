from flask import Blueprint, jsonify, abort, request
from ..models import Movie, db

bp = Blueprint('movies', __name__, url_prefix='/movies')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    movies = Movie.query.all() # ORM performs SELECT query
    result = []
    for m in movies:
        result.append(m.serialize()) # build list of movies as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    m = Movie.query.get_or_404(id)
    return jsonify(m.serialize())

@bp.route('', methods=['POST'])
def create():
    # req body must contain all info
    if 'name' not in request.json or 'description' not in request.json or 'run_time' not in request.json or 'release_date' not in request.json or 'viewer_rating' not in request.json or 'critic_rating' not in request.json or 'director_id' not in request.json:
        return abort(400)
    # construct Movie entry
    m = Movie(
        name=request.json['name'],
        description=request.json['description'],
        run_time=request.json['run_time'],
        release_date=request.json['release_date'],
        viewer_rating=request.json['viewer_rating'],
        critic_rating=request.json['critic_rating'],
        director_id=request.json['director_id']
    )

    db.session.add(m) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(m.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    m = Movie.query.get_or_404(id)
    try:
        db.session.delete(m) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

