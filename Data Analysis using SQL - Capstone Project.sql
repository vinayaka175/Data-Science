# 1. How many sales occurred during this time period? 
-- as per the information in case study the time time period is  January 1st, 2018 to December 31st, 2021. 
use cryptopunks;
select count(*) as total_sales
from pricedata
where event_date between '2018-01-01' and '2021-12-31';


# 2. Return the top 5 most expensive transactions (by USD price) for this data set.
-- Return the name, ETH price, and USD price, as well as the date.

select name, eth_price,usd_price,event_date from pricedata
order by usd_price desc 
limit 5;

# 3. Return a table with a row for each transaction with an event column, a USD price column, 
-- and a moving average of USD price that averages the last 50 transactions.

 select
 event_date,
 usd_price,
 avg(usd_price) 
 over (order by event_date rows between 49 preceding and current row )
 as moving_avg from pricedata;
 
 # 4. Return all the NFT names and their average sale price in USD.
 -- Sort descending. Name the average column as average_price.
 
 select name ,
 avg(usd_price) as average_price
 from pricedata 
 group by name 
 order by average_price desc; 
 
 # 5. Return each day of the week and the number of sales that occurred on that day of the week,
 -- as well as the average price in ETH. Order by the count of transactions in ascending order.
 
 select day(event_date) as day_of_week ,
 count(transaction_hash) as count_of_transactions,
 avg(eth_price) as avg_eth_price
 from pricedata
 group by event_date
 order by count_of_transactions;
 
 # 6. Construct a column that describes each sale and is called summary.
 -- The sentence should include who sold the NFT name, who bought the NFT,
 -- who sold the NFT, the date, and what price it was sold for in USD rounded to the nearest thousandth.
 --  Here’s an example summary:
 -- “CryptoPunk #1139 was sold for $194000 to 0x91338ccfb8c0adb7756034a82008531d7713009d
 -- from 0x1593110441ab4c5f2c133f21b0743b2b43e297cb on 2022-01-14”
 
 select concat( name,
 " ", 
 "was sold for",
 " ",
 "$",usd_price,
 " ",
 "to ",
 buyer_address," ",
 "from ",
 seller_address ," ",
 "on ",
 event_date,",") as summary 
 from pricedata;
 
# 7. Create a view called “1919_purchases” and contains 
-- any sales where “0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685” was the buyer.

create view  1919_purchases as
select *
from pricedata
where buyer_address = '0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685';


# 8. Create a histogram of ETH price ranges. Round to the nearest hundred value.  

select round(eth_price/100) * 100 as price_range,
count(*) as count,
rpad('',count(*),'$') as bar
from pricedata
group by price_range
order by price_range;


# 9.Return a unioned query that contains the highest price each NFT was bought for 
-- and a new column called status saying “highest” with a query that has the 
-- lowest price each NFT was bought for and the status column saying “lowest”. 
-- The table should have a name column, a price column called price, and a status column. 
-- Order the result set by the name of the NFT, and the status, in ascending order. 

-- Query for the highest price each NFT was bought for
select
  name,
  max(usd_price) as price,
  'highest' as status
from pricedata
group by name

union

-- Query for the lowest price each NFT was bought for
select name,
min(usd_price) as price,
  'lowest' as status
from pricedata
group by name
order by name asc , status;

# 10. What NFT sold the most each month / year combination? Also, 
-- what was the name and the price in USD? Order in chronological format. 

select 
 extract(year from event_date) as year,
 extract(month from event_date) as month,
  name,
  MAX(usd_price) as max_usd_price
from pricedata
group by year, month, name
order by year, month;

# 11. Return the total volume (sum of all sales),
-- round to the nearest hundred on a monthly basis (month/year). 

select
  extract(year from event_date) as year,
  extract(month from event_date) as month,
  round(sum(usd_price) / 100) * 100 as total_volume
  from pricedata
group by year, month
order by year, month;

# 12. Count how many transactions the wallet 
-- "0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685"had over this time period.

-- for buyer address
select count(*) as transactions from pricedata
where buyer_address = "0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685";

-- for seller address

select count(*) as transactions from pricedata
where seller_address = "0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685";


# 13. Create an “estimated average value calculator” that has a representative price 
-- of the collection every day based off of these criteria:
-- Exclude all daily outlier sales where the purchase price is below 10% of the daily average price
-- Take the daily average of remaining transactions

-- a) First create a query that will be used as a subquery. Select the event date,
--  the USD price, and the average USD price for each day using a window function. Save it as a temporary table.

-- Subquery to calculate the daily average price
create temporary table temp_avg_prices as
select
  event_date,
  usd_price,
  Avg(usd_price) over (partition by event_date) as daily_avg_price
from  pricedata;

select * from temp_avg_prices;

-- b) Use the table you created in Part A to filter out rows where the USD prices
-- is below 10% of the daily average and return a new estimated value which is just the daily average of the filtered data

-- Query to filter outliers and calculate estimated value

select
  event_date,
  avg(usd_price) as estimated_average_value
from temp_avg_prices
where usd_price >= 0.1 * daily_avg_price
group by event_date;

# 14. Give a complete list ordered by wallet profitability (whether people have made or lost money)

select
  event_date,
  sum(usd_price) as total_profit_loss_in_$,avg(usd_price) as avg_profit_loss_in_$
from pricedata
group by event_date
order by total_profit_loss_in_$ desc;















 

 
 
 









