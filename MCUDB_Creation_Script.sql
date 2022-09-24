-- one to many
CREATE TABLE movies (
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    run_time INT NOT NULL DEFAULT 0,
    release_date DATE NOT NULL,
    viewer_rating INT,
    critic_rating INT,
    director_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE directors (
    id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY (id)
);

-- many to many
CREATE TABLE comic_inspirations (
    comic_stories_id INT NOT NULL,
    movies_id INT NOT NULL,
    PRIMARY KEY (comic_stories_id, movies_id)
);

-- one to many
CREATE TABLE comic_stories (
    id SERIAL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    writer_id INT NOT NULL,
    illustrator_id INT NOT NULL
);

CREATE TABLE comic_writers (
    id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE comic_illustrators (
    id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY (id)
);


-- one to many
ALTER TABLE movies
ADD CONSTRAINT fk_movies_directors
FOREIGN KEY (director_id)
REFERENCES directors;

-- one to many
ALTER TABLE comic_stories
ADD CONSTRAINT fk_comic_stories_writers
FOREIGN KEY (writer_id)
REFERENCES comic_writers;

ALTER TABLE comic_stories
ADD CONSTRAINT fk_comic_stories_comic_illustrators
FOREIGN KEY (illustrator_id)
REFERENCES comic_illustrators;

-- many to many
ALTER TABLE comic_inspirations
ADD CONSTRAINT fk_comic_inspirations_comic_stories
FOREIGN KEY (comic_stories_id)
REFERENCES comic_stories;

ALTER TABLE comic_inspirations
ADD CONSTRAINT fk_comic_inspirations_movies
FOREIGN KEY (movies_id)
REFERENCES movies;
 