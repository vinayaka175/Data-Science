# 1) Start by returning all rows and columns from the hero_battles data table.
use hero;
select * from hero_battles;

# 2) Now, return the number of rows in the data set.

select count(*) from hero_battles;

# 3) Write a query to select the column name’s max and min. Hint: use MIN() and MAX().

select min(num_enemies) from hero_battles;
select max(num_enemies) from hero_battles;

# 4) Write a query to select both the sum and the average of the column num_enemies

select sum(num_enemies) as sum_of_enemies ,
avg(num_enemies) as avg_of_enemies 
from hero_battles;

# 5) Now take that query of the sum and average of enemies, and group it by the column name
select sum(num_enemies) as sum_of_enemies ,
avg(num_enemies) as avg_of_enemies 
from hero_battles
group by num_enemies  ;

# 6) Lastly, take the query we’ve been building and ORDER by the average.
  
select sum(num_enemies) as sum_of_enemies ,
avg(num_enemies) as avg_of_enemies 
from hero_battles
group by num_enemies  
order by avg_of_enemies;


















 