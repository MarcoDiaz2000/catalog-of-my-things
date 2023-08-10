CREATE TABLE Items (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    CONSTRAINT fk_labels FOREIGN KEY (label_id) REFERENCES Labels(id),
    CONSTRAINT fk_genres FOREIGN KEY (genre_id) REFERENCES Genres(id),
    CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES Authors(id)
);

CREATE INDEX idx_items_label_id ON Items(label_id);
CREATE INDEX idx_items_genre_id ON Items(genre_id);
CREATE INDEX idx_items_author_id ON Items(author_id);

CREATE TABLE Labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(50)
);

CREATE TABLE Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Authors (
    ID INT CONSTRAINT ID_Author_PK PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50)
);

CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(50),
    item_id INT,
    CONSTRAINT fk_items FOREIGN KEY (item_id) REFERENCES Items(id)
);

CREATE INDEX idx_books_item_id ON Books(item_id);

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    item_id INT NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    FOREIGN KEY (item_id) REFERENCES Items(id)
);

CREATE INDEX idx_music_albums_item_id ON music_albums(item_id);

CREATE TABLE Games (
    ID INT CONSTRAINT ID_Games_PK PRIMARY KEY,
    MULTIPLAYER VARCHAR(50),
    LAST_PLAYED_AT DATE,
    PUBLISH_DATE DATE,
    ARCHIVED BOOLEAN,
    CONSTRAINT FK_AUTHORID FOREIGN KEY(ID) REFERENCES Author(ID)
);

CREATE INDEX idx_games_id ON Games(ID);
