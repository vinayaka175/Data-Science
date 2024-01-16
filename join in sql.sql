# using database 
use max;
# creating a table assigning primary key
create table persons(
id int not null,
last_name varchar(255),
first_name varchar(255),
age int,
primary key(id));


# insert the data bases into table
insert into persons
(id ,last_name,first_name,age)
values(001,"rahul","K L",30),
(018,"kohli","virat",35),
(007,"dhoni","M S",41);

select * from persons;

#create a another table;

create table data(
id int not null,
t20_matches int not null,
odi_matches int not null,
test_matches int not null,
primary key(id));

insert into data
(id ,t20_matches,odi_matches,test_matches)
values(001,90,68,25),
(018,199,205,126),
(007,250,261,195);

select * from data;

insert into persons
(id,last_name,first_name,age)
values(045,"sharma",'rohit',37);

insert into data
(id,t20_matches,odi_matches,test_matches)
values(017,56,84,40);

# join clause in sql
# a join clause combines records from two or more tables 
# based on ralated column between them



# the join clause is placed after the FROM TABLE clause 
select * from persons
join data on persons.id=data.id;

# types of joins 

# inner join 
select * from persons
inner join data on persons.id=data.id;

#left join
select * from persons
left join data on persons.id=data.id;

# right join
select * from persons
right join data on persons.id=data.id;

# cross join
select * from persons
cross join data on persons.id=data.id;

# union 

select * from persons
union
select * from data;


select id from persons
where id = 018
union 
select test_matches from data
where id = 018 ;


# join practice 

select persons.first_name,persons.last_name,data.odi_matches,
data.test_matches
from persons
inner join data
on persons.id = data.id
group by persons.id
order by data.test_matches desc;

select * from persons;


# add a neew column to the existing table 
alter table persons 
add column grade int;

# update the new column with the desired data 
select * from persons;


update persons
set grade = 2
where id = 018 ;

select * from persons;

update persons
set grade = 2
where id = 045 ;

update persons
set grade = 3
where id = 001 ;

update persons
set grade = 1
where id = 007 ;

select * from persons;

select * from data;

alter table data 
add column grade int;

update data
set grade = 2
where id = 018 ;

update data
set grade = 2
where id = 045 ;

update data
set grade = 1
where id = 007;

update data
set grade = 3
where id = 001 ;

update data
set grade = 3
where id = 017 ;

alter table data
drop column grade;

select persons.id ,
persons.first_name,
persons.last_name,
persons.grade,
data.test_matches
from persons
join data on persons.id = data.id
group by id
order by data.test_matches desc;














