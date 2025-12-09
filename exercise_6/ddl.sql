-- PostgreSQL DDL for Music Database

-- Create TRACK table
CREATE TABLE TRACK (
    id SERIAL PRIMARY KEY,
    song_title VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL CHECK (year > 1900 AND year <= 2100)
);

-- Create ALBUM table
CREATE TABLE ALBUM (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL CHECK (year > 1900 AND year <= 2100),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0)
);

-- Create ALBUM_CONTENT table (many-to-many relationship between Album and Track)
CREATE TABLE ALBUM_CONTENT (
    album_id INTEGER NOT NULL,
    track_cod INTEGER NOT NULL,
    prog_num INTEGER NOT NULL CHECK (prog_num > 0),
    PRIMARY KEY (album_id, track_cod),
    FOREIGN KEY (album_id) REFERENCES ALBUM(id) ON DELETE CASCADE,
    FOREIGN KEY (track_cod) REFERENCES TRACK(id) ON DELETE CASCADE,
    UNIQUE (album_id, prog_num)
);

-- Create AUTHOR_SONG table
CREATE TABLE AUTHOR_SONG (
    author VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY (author, title)
);

-- Create SINGER_TRACK table
CREATE TABLE SINGER_TRACK (
    singer_name VARCHAR(255) NOT NULL,
    track_cod INTEGER NOT NULL,
    PRIMARY KEY (singer_name, track_cod),
    FOREIGN KEY (track_cod) REFERENCES TRACK(id) ON DELETE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX idx_album_year ON ALBUM(year);
CREATE INDEX idx_album_title ON ALBUM(title);
CREATE INDEX idx_track_year ON TRACK(year);
CREATE INDEX idx_track_title ON TRACK(song_title);
CREATE INDEX idx_album_content_album ON ALBUM_CONTENT(album_id);
CREATE INDEX idx_album_content_track ON ALBUM_CONTENT(track_cod);
CREATE INDEX idx_author_song_title ON AUTHOR_SONG(title);
CREATE INDEX idx_singer_track_singer ON SINGER_TRACK(singer_name);
CREATE INDEX idx_singer_track_track ON SINGER_TRACK(track_cod);
