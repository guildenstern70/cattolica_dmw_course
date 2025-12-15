-- PostgreSQL DML for Music Database

-- Insert Tracks
INSERT INTO TRACK (song_title, year) VALUES
-- Album 1 tracks
('Bohemian Rhapsody', 1975),
('You''re My Best Friend', 1975),
('39', 1975),
('Sweet Lady', 1975),
('Seaside Rendezvous', 1975),
('The Prophet''s Song', 1975),
('Love of My Life', 1975),
-- Album 2 tracks
('Come Together', 1969),
('Something', 1969),
('Maxwell''s Silver Hammer', 1969),
('Oh! Darling', 1969),
('Octopus''s Garden', 1969),
('I Want You (She''s So Heavy)', 1969),
('Here Comes the Sun', 1969),
-- Album 3 tracks
('Thriller', 1982),
('Beat It', 1982),
('Billie Jean', 1982),
('Wanna Be Startin'' Somethin''', 1982),
('Baby Be Mine', 1982),
('The Girl Is Mine', 1982),
('Human Nature', 1982);

-- Insert Albums
INSERT INTO ALBUM (title, year, price) VALUES
('A Night at the Opera', 1975, 19.99),
('Abbey Road', 1969, 24.99),
('Thriller', 1982, 22.99);

-- Insert Album Content (linking tracks to albums with progressive numbers)
INSERT INTO ALBUM_CONTENT (album_id, track_cod, prog_num) VALUES
-- Album 1: A Night at the Opera
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
-- Album 2: Abbey Road
(2, 8, 1),
(2, 9, 2),
(2, 10, 3),
(2, 11, 4),
(2, 12, 5),
(2, 13, 6),
(2, 14, 7),
-- Album 3: Thriller
(3, 15, 1),
(3, 16, 2),
(3, 17, 3),
(3, 18, 4),
(3, 19, 5),
(3, 20, 6),
(3, 21, 7);

-- Insert Authors
INSERT INTO AUTHOR_SONG (author, title) VALUES
-- Queen songs
('Freddie Mercury', 'Bohemian Rhapsody'),
('John Deacon', 'You''re My Best Friend'),
('Brian May', '39'),
('Brian May', 'Sweet Lady'),
('Freddie Mercury', 'Seaside Rendezvous'),
('Brian May', 'The Prophet''s Song'),
('Freddie Mercury', 'Love of My Life'),
-- Beatles songs
('John Lennon', 'Come Together'),
('George Harrison', 'Something'),
('Paul McCartney', 'Maxwell''s Silver Hammer'),
('Paul McCartney', 'Oh! Darling'),
('Ringo Starr', 'Octopus''s Garden'),
('John Lennon', 'I Want You (She''s So Heavy)'),
('George Harrison', 'Here Comes the Sun'),
-- Michael Jackson songs
('Michael Jackson', 'Thriller'),
('Michael Jackson', 'Beat It'),
('Michael Jackson', 'Billie Jean'),
('Michael Jackson', 'Wanna Be Startin'' Somethin'''),
('Rod Temperton', 'Baby Be Mine'),
('Paul McCartney', 'The Girl Is Mine'),
('Steve Porcaro', 'Human Nature');

-- Insert Singers
INSERT INTO SINGER_TRACK (singer_name, track_cod) VALUES
-- Queen
('Freddie Mercury', 1),
('Freddie Mercury', 2),
('Brian May', 3),
('Freddie Mercury', 4),
('Freddie Mercury', 5),
('Brian May', 6),
('Freddie Mercury', 7),
-- Beatles
('The Beatles', 8),
('The Beatles', 9),
('The Beatles', 10),
('The Beatles', 11),
('The Beatles', 12),
('The Beatles', 13),
('The Beatles', 14),
-- Michael Jackson
('Michael Jackson', 15),
('Michael Jackson', 16),
('Michael Jackson', 17),
('Michael Jackson', 18),
('Michael Jackson', 19),
('Michael Jackson', 20),
('Michael Jackson', 21);

-- Query to show the first album with its tracks
SELECT 
    a.title AS album_title,
    t.id AS song_id,
    t.song_title AS song_name,
    st.singer_name AS singer
FROM ALBUM a
JOIN ALBUM_CONTENT ac ON a.id = ac.album_id
JOIN TRACK t ON ac.track_cod = t.id
JOIN SINGER_TRACK st ON t.id = st.track_cod
WHERE a.id = 1
ORDER BY ac.prog_num;
