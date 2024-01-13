use hero;

# 1) Start by casting the value “24.423423” to a float value.

select cast("24.423423" as float);

# 2) Next, return the date, time, hour, month, second, and minute data for the hero_battles table based off of the date column.  

select date(date) as date ,
time(date) as time,
hour(date) as hour,
month(date) as month,
second(date) as second,
minute(date) as minute 
from hero_battles;

# 3) Create a histogram for the number of enemies fought. No need to round. 

select num_enemies as bucket , 
COUNT(*) as count,
RPAD('', COUNT(*), '*') as bar 
from hero_battles
group by bucket
order by bucket;


# 4) Write a query to replace all of the occurrences of Batman with Batwoman. Return only the name column. 
 
select replace(name, 'Batman', 'Batwoman') as name
from hero_battles
where  name like '%Batman%';

# 5) Make a new query that creates a sentence that says, 
#“This battle occurred at 14 o’clock,” but
#replace 14 with the hour of that particular battle. 

select concat("This battle occurred at"," ",hour(date)," ","o' clock,") 
from hero_battles;

# 6) Create a query that makes a sentence describing each superhero.
# State their name, and state what comic series they are from.
#For example, “James Bond is from Titan Books.” 
#Use the heroes_information table and the name and publisher columns. 

select concat(name," ", "is from"," ",publisher,".") 
from heroes_information;








