SELECT 
    a.Title AS "Album Title",
    ac."Order" AS "Song Order",
    t.Title AS "Song Name",
    STRING_AGG(s.Name || ' ' || s.Surname, ', ' ORDER BY s.Surname ASC) AS "Singers"
FROM ALBUM a
JOIN ALBUM_CONTENT ac ON a.AlbumId = ac.AlbumId
JOIN TRACK t ON ac.TrackId = t.TrackId
JOIN SINGER_TRACK st ON t.TrackId = st.TrackId
JOIN SINGER s ON st.SingerId = s.SingerId
WHERE a.AlbumId = (SELECT MIN(AlbumId) FROM ALBUM)
GROUP BY a.Title, ac."Order", t.Title
ORDER BY ac."Order" ASC;
