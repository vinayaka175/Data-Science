# 1) Start by querying all of the data from heroes_information if the Race has an average weight of over 400.

select * from heroes_information
where race in (
   select race
   from heroes_information
    group by race
    having avg(weight) > 400);
    
    # 2) Create a temporary table for this result called bigs
    
    create temporary table bigs
    select * from heroes_information
where race in (
   select race
   from heroes_information
    group by race
    having avg(weight) > 400);
    
 # 3) Select all columns and rows from that temporary table.
 
 select * from bigs;
 
 # 4) Write a new query that creates a view that selects the data 
 #if the publisher is Marvel Comics and if their height is above the average height.
 # Bring that view up.
 
 create view marvel_heroes_above_avg_height as 
 select * from heroes_information 
 where publisher = "marvel comics"
 and height > (select avg(height) from heroes_information);
   
   # 5) Now add an index to the heroes_information table on the name and Race columns.
   
   create index hero_index on
   heroes_information ( name, race);
   
   # 6) Finally, create a stored procedure that 
   # selects all the data from heroes_information if they are from DC. Call it all_dc_rows.
   
delimiter $$

create procedure  all_dc_rows()
begin
    select *
   from heroes_information
    where publisher = 'DC comics';
end $$

delimiter ;

call all_dc_rows();



 
  


    

