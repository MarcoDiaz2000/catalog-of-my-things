-- Create the Items table
CREATE TABLE Items (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255),
    author VARCHAR(255),
    source VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN,
    label_id INT,
    CONSTRAINT fk_labels FOREIGN KEY (label_id) REFERENCES Labels(id) ON DELETE SET NULL
);

-- Create the Labels table
CREATE TABLE Labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(50)
);

-- Create the Books table
CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(50),
    item_id INT,
    CONSTRAINT fk_items FOREIGN KEY (item_id) REFERENCES Items(id) ON DELETE SET NULL
);

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

