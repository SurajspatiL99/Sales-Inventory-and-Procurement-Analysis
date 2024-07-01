use inventory_db;
--Inventory at Beginning of the year
select *
from BegInvFINAL;


-- Total Number of brands in the database
with cte as (select brand, description
from BegInvFINAL
group by brand, description)

select count(brand) as total_brands
from cte;

-- Top 10 Brands with Highest Inventory at Beginning of the year

select top 10 brand, description, sum(onhand) as total_beg_inv
from BegInvFINAL
group by brand, description
order by total_beg_inv desc;


-- Top 10 brands with Lowest Inventory at Beginning of the year
select top 10 brand, description, sum(onhand) as total_beg_inv
from BegInvFINAL
group by brand, description
order by total_beg_inv;


-- No of brand with zero inventory at beginning of the Year
with cte as (select brand, description, sum(onhand) as total_beg_inv
from BegInvFINAL
group by brand, description)

select count(brand)
from cte
where total_beg_inv = 0;


-- Find rows where city has null values
Select * 
from EndInvFINAL
where city is null;


-- updating null with 'Unknown' in city column
update EndInvFINAL 
set city = 
( 
case  
    when city is null then 'Unknown' 
    else city 
end 
)

-- Top 10 Brands with Highest Inventory at End of the year

select top 10 brand, description, sum(onhand) as total_end_inv
from EndInvFINAL
group by brand, description
order by total_end_inv desc;


-- Top 10 brands with Lowest Inventory at End of the year
select top 10 brand, description, sum(onhand) as total_end_inv
from EndInvFINAL
group by brand, description
order by total_end_inv;


-- No of brand with zero inventory at End of the Year
with cte as (select brand, description, sum(onhand) as total_end_inv
from EndInvFINAL
group by brand, description)

select count(brand)
from cte
where total_end_inv = 0;


--brands with with zero inventory at beginning and end of the Year
select t1.brand, t1.description
from  
(select brand, description, sum(onhand) as total_beg_inv
from BegInvFINAL
group by brand, description) t1
inner join
(select brand, description, sum(onhand) as total_end_inv
from EndInvFINAL
group by brand, description) t2 
on (t1.brand = t2.brand
	and 
	t1.description = t2.description)
where total_beg_inv = 0 
	and
	total_end_inv = 0;