show databases;
create database movies2;
use employee1;

create table artist2(
artid int primary key,
artname varchar(255),
artgender varchar(255));
select*from artist2;
insert into artist2 values( 11,'alpha','male');
insert into artist2 values( 12,'bravo','female');
insert into artist2 values( 13,'charley','male');
insert into artist2 values( 14,'delta','female');


create table producer2(
prodid int primary key,
prodname varchar(255),
prodphone int);
select * from producer2;
insert into producer2 values( 21,'echo',1234567890);
insert into producer2 values( 22,'foxtrot',1234567899);
insert into producer2 values( 23,'golt',1234567898);
insert into producer2 values( 24,'hotel',1234567897);

create table films2(
filmid int primary key,
filmtitle varchar(255),
filmyear int,
fimlang varchar(255),
prodid int);
select * from films2;
insert into films2 values( 31,'ironman',2001,'marathi',21);
insert into films2 values( 32,'thor',2002,'hindi',22);
insert into films2 values( 33,'dr.strange',2003,'english',23);
insert into films2 values( 34,'wonderwomen',2004,'tamil',24);
alter table films2
add constraint m11 foreign key (prodid) references producer2(prodid);

create table casting2(
castid int primary key,
artid int,
filmid int,
part varchar(255),
constraint m12 foreign key (artid) references artist2(artid),
constraint m13 foreign key (filmid) references films2(filmid));
select * from casting2;
insert into casting2 values( 100,11,31,'actor');
insert into casting2 values( 200,12,32,'actress');
insert into casting2 values( 300,13,33,'guest');
insert into casting2 values( 400,14,34,'actress');

create table review2(
reviewsid int primary key,
filmid int,
stars int,
constraint m14 foreign key (filmid) references films2(filmid));

select * from review2;
insert into review2 values ( 1,31,4);
insert into review2 values ( 2,32,5);
insert into review2 values ( 3,33,5);
insert into review2 values (4,34,3);



//Find the name of all the Films whose producer is “echo” ,
First we will find the Producer ID for the Producer2 Named “echo”
and for this we use the PRODUCER2 table; 
   
select filmtitle from films2
where prodid in( select prodid from producer2
where prodname ='echo'); 
//

//'wonderwomen' movie is releasing in which year;

select filmyear from films2
where filmtitle='wonderwomen';
//


//Display all artists who acted in a film between 2001 and 2003;

select a.artname,f.filmtitle,f.filmyear
from artist2 a,casting2 c,films2 f
where a.artid=c.artid and c.filmid=f.filmid
and f.filmyear between 2001 and 2003;
//

//Display the names of films with the stars received and
sort the result on the basis of stars;

select f.filmtitle, r.stars
from films2 f, review2 r
where f.filmid=r.filmid
order by r.stars desc;
//

// Update the stars of all films whose producer is ‘echo’ to 5;

update review2 set stars=5
where filmid in(select filmid from films2
where prodid in(select prodid from producer2
where prodname='echo'));
select * from review2;
//

//films2 n casting2 join;

select* from films2;
select* from casting2;

select * from films2
inner join casting2 
on films2.filmid=casting2.filmid;


select * from films2
left join casting2 
on films2.filmid=casting2.filmid;

select * from casting2
right join films2 
on films2.filmid=casting2.filmid;

select * from films2
left join casting2 on films2.filmid=casting2.filmid
union all
select * from casting2
right join films2 on films2.filmid=casting2.filmid;

select *from films2
cross join casting2;

select a.filmid,b.filmyear
from films2 a,films2 b
where a.filmid=32;
