CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    item_id INT NOT NULL,
    on_spotify BOOLEAN NOT NULL
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Games(
    ID INT CONSTRAINT ID_Games_PK PRIMARY KEY,
    MULTIPLAYER VARCHAR(50),
    LAST_PLAYED_AT DATE,
    PUBLISH_DATE DATE,
    ARCHIVED BOOLEAN,
    CONSTRAINT FK_AUTHORID FOREIGN KEY(ID) REFERENCES Author(ID)

);

CREATE TABLE Author(
    ID INT CONSTRAINT ID_Author_PK PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50)
);
