SELECT 
    a.Title AS "Album Title",
    ac."Order" AS "Song Order",
    t.Title AS "Song Name",
    s.Name || ' ' || s.Surname AS "Singer"
FROM ALBUM a
JOIN ALBUM_CONTENT ac ON a.AlbumId = ac.AlbumId
JOIN TRACK t ON ac.TrackId = t.TrackId
JOIN SINGER_TRACK st ON t.TrackId = st.TrackId
JOIN SINGER s ON st.SingerId = s.SingerId
WHERE a.AlbumId = (SELECT MIN(AlbumId) FROM ALBUM) -- Select the first album
ORDER BY ac."Order" ASC, s.Surname ASC;
