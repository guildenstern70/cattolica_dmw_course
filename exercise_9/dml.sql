-- 1. Insert SINGERs
INSERT INTO SINGER (Name, Surname) VALUES 
('Michael', 'Jackson'),
('Stevie', 'Nicks'),
('Lindsey', 'Buckingham'),
('Christine', 'McVie');

-- 2. Insert TRACKs
-- (Using INTERVAL for the Length column)
INSERT INTO TRACK (Title, Year, Length) VALUES 
('Dreams', 1977, '00:04:17'),
('Go Your Own Way', 1977, '00:03:38'),
('The Chain', 1977, '00:04:28'),
('Wanna Be Startin Somethin', 1982, '00:06:03'),
('Thriller', 1982, '00:05:57'),
('Beat It', 1982, '00:04:18');

-- 3. Insert ALBUMs
INSERT INTO ALBUM (Title, Year, Price) VALUES 
('Rumours', 1977, 15.99),
('Thriller', 1982, 18.50);

-- 4. Map Tracks to Albums (ALBUM_CONTENT)
-- Album 1: Rumours
INSERT INTO ALBUM_CONTENT (AlbumId, TrackId, "Order") VALUES 
(1, 1, 1), -- Dreams
(1, 2, 2), -- Go Your Own Way
(1, 3, 3); -- The Chain

-- Album 2: Thriller
INSERT INTO ALBUM_CONTENT (AlbumId, TrackId, "Order") VALUES 
(2, 4, 1), -- Wanna Be Startin Somethin
(2, 5, 2), -- Thriller
(2, 6, 3); -- Beat It

-- 5. Map Singers to Tracks (SINGER_TRACK)
-- "The Chain" has multiple singers
INSERT INTO SINGER_TRACK (SingerId, TrackId) VALUES 
(2, 1), -- Stevie Nicks on Dreams
(3, 2), -- Lindsey Buckingham on Go Your Own Way
(2, 3), -- Stevie on The Chain
(3, 3), -- Lindsey on The Chain
(4, 3), -- Christine McVie on The Chain
(1, 4), -- Michael Jackson on Wanna Be Startin Somethin
(1, 5), -- Michael Jackson on Thriller
(1, 6); -- Michael Jackson on Beat It
