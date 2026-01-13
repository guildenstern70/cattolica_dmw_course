-- 1. Create SINGER table
CREATE TABLE SINGER (
    SingerId SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Surname VARCHAR(100) NOT NULL
);

-- 2. Create TRACK table
CREATE TABLE TRACK (
    TrackId SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Year INTEGER,
    Length INTERVAL NOT NULL -- Using INTERVAL for duration (e.g., '00:03:45')
);

-- 3. Create ALBUM table
CREATE TABLE ALBUM (
    AlbumId SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Year INTEGER,
    Price DECIMAL(10, 2)
);

-- 4. Create ALBUM_CONTENT (Intermediate table for Album-Track relationship)
CREATE TABLE ALBUM_CONTENT (
    AlbumId INTEGER,
    TrackId INTEGER,
    "Order" INTEGER,
    PRIMARY KEY (AlbumId, TrackId),
    CONSTRAINT fk_album 
        FOREIGN KEY (AlbumId) REFERENCES ALBUM(AlbumId) ON DELETE CASCADE,
    CONSTRAINT fk_track_album 
        FOREIGN KEY (TrackId) REFERENCES TRACK(TrackId) ON DELETE CASCADE
);

-- 5. Create SINGER_TRACK (Many-to-Many relationship between Singers and Tracks)
CREATE TABLE SINGER_TRACK (
    SingerId INTEGER,
    TrackId INTEGER,
    PRIMARY KEY (SingerId, TrackId),
    CONSTRAINT fk_singer 
        FOREIGN KEY (SingerId) REFERENCES SINGER(SingerId) ON DELETE CASCADE,
    CONSTRAINT fk_track_singer 
        FOREIGN KEY (TrackId) REFERENCES TRACK(TrackId) ON DELETE CASCADE
);

