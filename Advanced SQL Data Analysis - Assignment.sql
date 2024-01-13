# 1. Create a query to select all columns from heroes_information
# but to add a new column called human. 
# Have that column be a 1 if their race is Human and 0 if not. 
 
 select *,
 case 
 when race = "human" then 1
 else 0
 end as Human 
 from heroes_information;
 
 # 2. Create a new query to provide a list of the heaviest super heroes, with the heaviest being #1. 
 
 select name ,weight ,rank()  
 over( order by weight desc ) as rank_of_super_heroes
 from heroes_information;
 
 # 3. Give a frequency table with each letter of the alphabet and how many superheroes’ names start with that letter. 
 
select
  substring(name,1,1) as first_letter,
    count(*) as superhero_count
from
    heroes_information
group by 
    first_letter
order by
    first_letter;
    
    
    # 4. Select all the hero races with an average weight of over 150 and an average height of over 100.  
    
 select race,
  avg(weight) as avg_weight,
    avg(height) as avg_height
from 
    heroes_information
group by
    race
having
    avg(weight) > 150 and avg(height) > 100
    order by race ;

 

 
 
 
 
 
 
 