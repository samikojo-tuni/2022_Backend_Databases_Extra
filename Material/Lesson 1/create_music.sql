-- Deletes the database if it already exists
-- DROP DATABASE music;

-- Creates a new database
-- CREATE DATABASE music;
USE music;

CREATE TABLE artist(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE album(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	year YEAR DEFAULT(0000),
	artist_id INT,
	FOREIGN KEY(artist_id) REFERENCES artist(id)
);

CREATE TABLE track(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	length TIME DEFAULT("00:00:00"),
	track_number INT,
	album_id INT,
	FOREIGN KEY(album_id) REFERENCES album(id)
);

INSERT INTO artist (id, name) VALUES 
	(1, "Iron Maiden"),
	(2, "Black Sabbath"),
	(3, "Dio");

INSERT INTO album(id, name, year, artist_id) VALUES
	(1, "Fear of the Dark", 1992, 1),
	(2, "Brave New World", 2000, 1),
	(3, "Paranoid", 1970, 2),
	(4, "Tyr", 1990, 2),
	(5, "Holy Diver", 1983, 3),
	(6, "Magica", 2000, 3);

INSERT INTO track(name, length, track_number, album_id) VALUES
	("Be Quick or Be Dead", "00:03:24", 1, 1),
	("From Here to Eternity", "00:03:38", 2, 1),
	("Afraid to Shoot Strangers", "00:06:56", 3, 1),
	("Fear Is the Key", "00:05:35", 4, 1),
	("Childhood's End", "00:04:40", 5, 1),
	("Wasting Love", "00:05:50", 6, 1),
	("The Fugitive", "00:04:54", 7, 1),
	("Chains of Misery", "00:03:37", 8, 1),
	("The Apparition", "00:03:54", 9, 1),
	("Judas Be My Guide", "00:03:08", 10, 1),
	("Weekend Warrior", "00:05:39", 11, 1),
	("Fear of the Dark", "00:07:18", 12, 1),
	("The Wicker Man", "00:04:35", 1, 2),
	("Ghost of the Navigator", "00:06:50", 2, 2),
	("Brave New World", "00:06:18", 3, 2),
	("Blood Brothers", "00:07:14", 4, 2),
	("The Mercenary", "00:04:42", 5, 2),
	("Dream of Mirrors", "00:09:21", 6, 2),
	("The Fallen Angel", "00:04:00", 7, 2),
	("The Nomad", "00:09:06", 8, 2),
	("Out of the Silent Planet", "00:06:25", 9, 2),
	("The Thin Line Between Love & Hate", "00:08:26", 10, 2),
	("War Pigs", "00:07.57", 1, 3),
	("Paranoid", "00:02.53", 2, 3),
	("Planet Caravan", "00:04.32", 3, 3),
	("Iron Man", "00:06.00", 4, 3),
	("Electric Funeral", "00:04.53", 5, 3),
	("Hand of Doom", "00:07.08", 6, 3),
	("Rat Salad", "00:02.30", 7, 3),
	("Fairies Wear Boots", "00:06.15", 8, 3),
	("Anno Mundi", "00:06.12", 1, 4),
	("The Law Maker", "00:03.47", 2, 4),
	("Jerusalem", "00:03.53", 3, 4),
	("The Sabbath Stones", "00:06.35", 4, 4),
	("The Battle of Tyr", "00:01.08", 5, 4),
	("Odin's Court", "00:02.21", 6, 4),
	("Valhalla", "00:04.53", 7, 4),
	("Feels Good to Me", "00:05.36", 8, 4),
	("Heaven in Black", "00:03.57", 9, 4),
	("Stand Up and Shout", "00:03:15", 1, 5),
	("Holy Diver", "00:05:54", 2, 5),
	("Gypsy", "00:03:39", 3, 5),
	("Caught in the Middle", "00:04:15", 4, 5),
	("Don't Talk to Strangers", "00:04:53", 5, 5),
	("Straight Through the Heart", "00:04:32", 6, 5),
	("Invisible", "00:05:26", 7, 5),
	("Rainbow in the Dark", "00:04:15", 8, 5),
	("Shame on the Night", "00:05:20", 9, 5),
	("Discovery", "00:00:54", 1, 6),
	("Magica Theme", "00:01:16", 2, 6),
	("Lord of the Last Day", "00:04:04", 3, 6),
	("Fever Dreams", "00:04:37", 4, 6),
	("Turn to Stone", "00:05:19", 5, 6),
	("Feed My Head", "00:05:39", 6, 6),
	("Eriel", "00:07:25", 7, 6),
	("Challis", "00:04:22", 8, 6),
	("As Long as It's Not About Love", "00:06:28", 9, 6),
	("Losing My Insanity", "00:05:04", 10, 6),
	("Otherworld", "00:04:56", 11, 6),
	("Magica (Reprise)", "00:01:53", 12, 6),
	("Lord of the Last Day (Reprise)", "00:01:44", 13, 6),
	("The Magica Story", "00:18:23", 14, 6);