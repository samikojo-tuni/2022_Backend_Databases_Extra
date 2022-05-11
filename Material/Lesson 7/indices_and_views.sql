USE music;

-- View indices, track table as an example
SHOW INDEXES FROM track;

-- Explain query (which indices can be used and which, if any, is actually used)
EXPLAIN SELECT name from track WHERE name="Paranoid";

-- Create index 
CREATE INDEX ix_track_name ON track(name);

-- This query can now use the new index
EXPLAIN SELECT name from track WHERE name="Paranoid";

-- Create more indices
CREATE INDEX ix_album_name ON album(name);
CREATE INDEX ix_album_year ON album(year);
CREATE INDEX ix_artist_name ON artist(name);

-- A view
CREATE VIEW track_info AS 
	SELECT artist.name AS artist_name, album.name AS album_name, track.name as track_name, track.length 
	FROM artist 
	INNER JOIN album ON album.artist_id = artist.id 
	INNER JOIN track ON track.album_id = album.id 
	WHERE album.year BETWEEN 1990 AND 2010;

