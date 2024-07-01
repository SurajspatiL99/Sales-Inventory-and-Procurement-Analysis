select *
from SalesFINAL;

-- Top 10 brands with highest quantity sold
select top 10 brand, description, sum(SalesQuantity) as total_quantity_sold
from SalesFINAL
group by brand, description
order by total_quantity_sold desc;

-- Top 10 brands with lowest quantity sold
select top 10 brand, description, sum(SalesQuantity) as total_quantity_sold
from SalesFINAL
group by brand, description
order by total_quantity_sold;