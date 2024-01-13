# In this assignment, you’ll be practicing filtering and ordering SQL queries. 
 
# 1) Start by returning all rows and columns from the hero_battles data table.

select * from hero_battles;

# 2) Now return the same result set but sort the data by ascending the number of enemies (num_enemies) column.

select * from hero_battles
order by num_enemies asc;

# 3) Take that same query but change it and sort descending instead. 

select * from hero_battles
order by num_enemies desc;

# 4) Great work! Keep the current query, but only show rows where the name column is equal to Batman.

select * from hero_battles
where name = "batman" order by num_enemies desc;

# 5) Next, edit the prior query to return the result set that is not Batman.
 
select * from hero_battles
where name != "batman" order by num_enemies desc;

# 6) Write a query that returns a data set that contains all the data where the number of enemies fought was 1 or 2. 

select * from hero_battles
where num_enemies = 1 or num_enemies = 2 order by num_enemies desc;

# 7) Now take that and write a query with all the data where the number of enemies was 1, or 2, or 10, or 12. Use an IN clause. 

select * from hero_battles
where num_enemies in (1,2,10,12) order by num_enemies desc;

# 8) Make a new query that returns any row where the name column contains the phrase “man”.

select * from hero_battles
where name like "%man%";


 


 











