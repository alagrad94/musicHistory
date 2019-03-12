--#1...
--SELECT Id, Label FROM Genre;

--#2
-- INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Jimmy Buffett','1973');

-- #3
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Changes in Latitudes, Changes in Attitudes', '01/01/1977', '2488', 'ABC', '28', '2');

-- #4
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Changes in Latitudes, Changes in Attitudes', '195', '01/01/1977', '2', '28', '23');
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Margaritaville', '195', '01/01/1977', '2', '28', '23');

--#5
--SELECT Album.Title AS AlbumTitle, Song.Title AS SongTitle
--FROM Album
--LEFT JOIN Song ON Song.AlbumId = Album.Id
--WHERE Album.ArtistId = '28';

--#6
--SELECT Album.Title AS AlbumTitle, COUNT(Song.Title) AS SongCount
--FROM Album
--LEFT JOIN Song ON Song.AlbumId = Album.Id
--GROUP BY Album.Title;

--#7
--SELECT Artist.ArtistName AS Artist, COUNT(Song.Title) AS SongCount
--FROM Artist
--LEFT JOIN Song ON Song.ArtistId = Artist.Id
--GROUP BY Artist.ArtistName;

-- #8
--SELECT Genre.Label AS Genre, COUNT(Song.Title) AS SongCount
--FROM Genre
--LEFT JOIN Song ON Song.GenreId = Genre.Id
--GROUP BY Genre.Label;

-- #9
--SELECT Title, AlbumLength
--FROM Album,
--  (SELECT MAX(AlbumLength) AS Length FROM Album) maxlength
--WHERE Album.AlbumLength = maxlength.Length

-- #10
--SELECT Title, SongLength
--FROM Song,
--  (SELECT MAX(SongLength) AS Length FROM Song) maxlength
--WHERE Song.SongLength = maxlength.Length

-- #11
SELECT Title AS SongTitle, SongLength AS Length, AlbumId AS AlbumId
INTO temp
FROM Song,
  (SELECT MAX(SongLength) AS Length FROM Song) maxlength
WHERE Song.SongLength = maxlength.Length
SELECT temp.SongTitle, temp.Length, Album.Title AS AlbumTitle
FROM temp
LEFT JOIN Album ON temp.AlbumId = Album.Id