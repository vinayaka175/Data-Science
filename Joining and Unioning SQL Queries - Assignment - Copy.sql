#In this assignment, you’ll practice joining and unioning SQL queries. 
 
#1) Take hero_battles and do a left join on heroes_information on the name columns. Select all columns. 

select * from hero_battles
join heroes_information 
on hero_battles.name = heroes_information.name;

# 2) Take super_hero_powers and do a right join with hero_battles on the name columns. 
# Note that the name column is hero_names on the super_hero_powers table. 

select  *  from super_hero_powers 
right join hero_battles
on super_hero_powers.hero_names = hero_battles.name;

# 3) Select all the female heroes from heroes_information and stack that name result
# on top of all the heroes who have accelerated healing from the super_hero_powers table.
# Only return the name columns.

select name from heroes_information 
join super_hero_powers 
on heroes_information.name = super_hero_powers.hero_names
WHERE heroes_information.gender = 'female' AND super_hero_powers.`Accelerated Healing`= "true";





 
 
 
 
 
 
 
 
 


 