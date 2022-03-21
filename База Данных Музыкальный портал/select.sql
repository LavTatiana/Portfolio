select album_name, release_year from album
	where release_year = 2018;
select track_name, duration from track
	order by duration desc
	limit 1;
select track_name, duration from track
	where duration >= 3.5;
select mix_name from mix
	where release_year between 2018 and 2020;
select artist_name from artist
	where artist_name not like '%% %%';
select track_name from track
	where track_name like '%%my%%';

