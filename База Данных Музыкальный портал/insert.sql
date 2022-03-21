insert into Artist (id, artist_name) 
	values (1, 'Imagine Dragons'),
	(2, 'Panic!At the Disco'),
	(3, 'The Score'),
	(4, 'Sia'),
	(5, 'Poets of The Fall'),
	(6, 'Ed Sheeran'),
	(7, 'Kaleo'),
	(8, 'Depeche Mode');
insert into Genres (id, genre_name)
	values (1, 'pop rock'),
	(2, 'alternative rock'),
	(3, 'indie rock'),
	(4, 'modern rock'),
	(5, 'pop'),
	(6, 'symphonic rock'),
	(7, 'blues'),
	(8, 'dance'),
	(9, 'gothic rock');
insert into Categories (id, genres_id, artist_id)
	values (1, 1, 1),
	(2, 1, 2),
	(3, 2, 2),
	(4, 2, 8),
	(5, 3, 3),
	(6, 4, 3),
	(7, 5, 4),
	(8, 5, 6),
	(9, 6, 5),
	(10, 7, 7),
	(11, 8, 8),
	(12, 9, 8);
insert into Album (id, album_name, release_year)
	values (1, 'Origins', 2018),
	(2, 'Pray for the Wicked', 2018),
	(3, 'Carry on', 2020),
	(4, 'This is Acting', 2016),
	(5, 'Twilight Theater', 2010),
	(6, 'No.6 Collaborations Project', 2019),
	(7, 'A/B', 2016),
	(8, 'Violator', 1990);
insert into Musicinfo (id, artist_id, album_id)
	values (1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 8, 8);
insert into Track (id, track_name, duration, album_id)
	values (1,'Natural', 3.09, 1),
	(2, 'Bullet in a Gun', 3.24, 1),
	(3, 'High Hopes', 3.10, 2),
	(4, 'King of the Clouds', 2.40, 2),
	(5, 'Victorious', 4.00, 3),
	(6, 'Stronger', 3.56, 3),
	(7, 'Alive', 4.23, 4),
	(8, 'Heal my wounds', 5.56, 5),
	(9, 'War', 5.06, 5),
	(10, 'Way to Break my Heart', 3.10, 6),
	(11, 'Blow', 3.29, 6),
	(12, 'Way Down We Go', 3.39, 7),
	(13, 'No Good', 3.55, 7),
	(14, 'Personal Jesus', 4.56, 8),
	(15, 'Enjoy the Silence', 6.07, 8),
	(16, 'World in my Eyes', 4.26, 8);
insert into Mix (id, mix_name, release_year)
	values (1, 'Music for fit', 2020),
	(2, 'Best Party Music', 2021),
	(3, 'Top hits', 2016),
	(4, 'Best of Poets of the Fall', 2009),
	(5, 'Romantic Music', 2020),
	(6, 'Best blues music', 2019),
	(7, 'Rock music', 2018),
	(8, 'Best of Depeche Mode', 2019);
insert into trackinfo (id, mix_id, track_id)
	values (1, 1, 1),
	(2, 1, 6),
	(3, 2, 1),
	(4, 2, 2),
	(5, 3, 12),
	(6, 4, 9),
	(7, 5, 10),
	(8, 5, 11),
	(9, 6, 12),
	(10, 6, 13),
	(11, 7, 3),
	(12, 7, 4),
	(13, 7, 5),
	(14, 8, 14),
	(15, 8, 15);










	