drop table feedpost;
drop table teamsquad;
drop table leaguemembers;
drop table result;
drop table league;
drop table team;
drop table runner;

create table runner(
	pnr bigint UNIQUE,
	username varchar(16) NOT NULL UNIQUE,
	userpw varchar(16) NOT NULL,
	firstname varchar (64) NOT NULL,
	lastname varchar (64) NOT NULL,
	userinfo varchar(1024),
	runnerid int UNIQUE,
	points int,
	city varchar(64),
	picture varchar(256),
	primary key (pnr)
);

create table team(
	title varchar(32),
	teaminfo varchar(1024),
	dateofcreation char(8),
	openteam bit NOT NULL,
	primary key (title)
);

create table league(
	title varchar(32),
	leagueinfo varchar(1024),
	primary key (title)
);

create table result(
	checkpoint int NOT NULL,
	timeresult int NOT NULL,
	runnerpnr bigint NOT NULL,
	points int,
	primary key (checkpoint, runnerpnr),
	foreign key (runnerpnr) references runner(pnr)
);

create table teamsquad(
	runnerpnr bigint,
	teamtitle varchar(32),
	primary key (runnerpnr, teamtitle),
	foreign key (runnerpnr) references runner(pnr),
	foreign key (teamtitle) references team(title)
);

create table leaguemembers(
	teamtitle varchar(32),
	leaguetitle varchar(32),
	primary key (teamtitle, leaguetitle),
	foreign key (teamtitle) references team(title),
	foreign key (leaguetitle) references league(title)
);

create table feedpost(
	dateofpost datetime,
	poster bigint,
	teamofpost varchar(32),
	textpost varchar(8000),
	primary key (dateofpost, poster, teamofpost),
	foreign key (poster) references runner(pnr),
	foreign key (teamofpost) references team(title)
)