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
