from platform import release
from turtle import title, write_docstringdict
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


comic_inspirations_table = db.Table(
    "comic_inspirations",
    db.Column("comic_stories_id", db.Integer, db.ForeignKey('comic_stories.id'), primary_key=True),
    db.Column("movies_id", db.Integer, db.ForeignKey('movies.id'), primary_key=True)
)

class Movie(db.Model):
    __tablename__ = "movies"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    description = db.Column(db.String(400), nullable=False)
    run_time = db.Column(db.Integer, default='0', nullable=False)
    release_date = db.Column(db.Date, nullable=False)
    viewer_rating = db.Column(db.Integer, nullable=True)
    critic_rating = db.Column(db.Integer, nullable=True)
    director_id = db.Column(db.Integer, db.ForeignKey("directors.id"), nullable=False)
    comic_stories = db.relationship('Comic_story', secondary=comic_inspirations_table, backref='related_movies', cascade="all,delete")
    

    def __init__(self, movie_id: int, name: str, description: str, run_time: int, release_date, viewer_rating: int, critic_rating: int, director_id: int):
        self.movie_id = movie_id
        self.name = name
        self.description = description
        self.run_time = run_time
        self.release_date = release_date
        self.viewer_rating = viewer_rating
        self.critic_rating = critic_rating
        self.director_id = director_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'run_time': self.run_time,
            'release_date': self.release_date,
            'viewer_rating': self.viewer_rating,
            'critic_rating': self.critic_rating,
            'director_id': self.director_id
        }



class Comic_story(db.Model):
    __tablename__ = "comic_stories"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(128), nullable=False)
    description = db.Column(db.String(400), nullable=False)
    writer_id = db.Column(db.Integer, db.ForeignKey('comic_writers.id'), nullable=False)
    illustrator_id = db.Column(db.Integer, db.ForeignKey('comic_illustrators.id'), nullable=False)
    related_stories = db.relationship('Movie', secondary=comic_inspirations_table, backref='related_stories')

    def __init__(self, title: str, description: str, illustrator_id: int, writer_id: int):
        self.title= title
        self.description = description
        self.writer_id = writer_id
        self.illustrator_id = illustrator_id

    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'writer_id': self.writer_id,
            'illustrator_id': self.illustrator_id
        }

class Director(db.Model):
    __tablename__ = "directors"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)

    def __init__(self, first_name: str, last_name: str):
        self.first_name = first_name
        self.last_name = last_name

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name
        }

class Comic_writer(db.Model):
    __tablename__ = "comic_writers"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)

    def __init__(self, first_name: str, last_name: str):
        self.first_name = first_name
        self.last_name = last_name

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name
        }

class Comic_illustrator(db.Model):
    __tablename__ = "comic_illustrators"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)

    def __init__(self, first_name: str, last_name: str):
        self.first_name = first_name
        self.last_name = last_name

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name
        }


