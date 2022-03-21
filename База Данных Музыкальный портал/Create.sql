create table if not exists Artist(
id serial primary key,
artist_name varchar(60) not null
);
create table if not exists Genres(
id serial primary key,
genre_name varchar(50) not null
);
create table if not exists Categories(
id serial primary key,
genres_id integer not null references Genres(id),
artist_id integer not null references Artist(id)
);
create table if not exists Album(
id serial primary key,
album_name varchar(60) not null,
release_year integer not null
);
create table if not exists Musicinfo(
id serial primary key,
artist_id integer not null references Artist(id),
album_id integer not null references Album(id)
);
create table if not exists Track(
id serial primary key,
track_name varchar(60) not null,
duration numeric not null,
album_id integer not null references Album(id)
);
create table if not exists Mix(
id serial primary key,
mix_name varchar(60) not null,
release_year integer not null
);
create table if not exists trackinfo(
id serial primary key,
mix_id integer not null references Mix(id),
track_id integer not null references Track(id)
);

