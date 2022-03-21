select genre_name, count(artist_id) artist from genres g 
	join categories c on g.id = c.genres_id
	group by genre_name;
select release_year, count(album_id) track from album a
	join track t on a.id = t.album_id
	where release_year between 2019 and 2020
	group by release_year;
select album_name, avg(duration) from album a 
	join track t on a.id = t.id
	group by album_name
	order by avg(duration) desc;
select artist_name from artist a 
	join album a2 on a.id = a2.id 
	where release_year not in (select release_year from album a3
		where release_year = 2020)
	group by artist_name;
select distinct mix_name, artist_name from mix m
	join trackinfo t on t.mix_id = m.id 
	join track t2 on t.track_id = t2.id 
	join album a on t2.album_id = a.id 
	join musicinfo m2 on m2.album_id = a.id
	join artist a2 on a2.id = m2.artist_id 
	where artist_name = 'Ed Sheeran';
select album_name, count(genre_name) from album a 
	join musicinfo m on a.id = m.album_id 
	join artist a2 on m.artist_id = a2.id 
	join categories c on c.artist_id = a2.id
	join genres g on g.id = c.genres_id 
	group by album_name
	having count(genre_name) > 1;
select track_name from track t 
	left join trackinfo t2 on t.id = t2.track_id 
	where track_id is null;
select artist_name from artist a
	join musicinfo m on a.id = m.artist_id 
	join album a2 on m.album_id = a2.id 
	join track t on t.album_id = a2.id
	where duration = (select min(duration) from track t2);
select distinct album_name from album a 
	left join track t on a.id = t.album_id
	where album_id in(
		select album_id from track
		inner join album a2 on t.album_id= a2.id 		
		group by album_id
		order by count(album_id)
		limit 1);
	

	
	 
	
	
	 
	