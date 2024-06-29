select *
from InvoicePurchases;

select *
from PurchasePricesDec;

select *
from PurchasesFINAL;


-- Top 10 brands with highest quantity sold
select top 10 vendorname, sum(Quantity) as total_quantity_sold
from InvoicePurchases
group by vendorname
order by total_quantity_sold desc;


-- ALTER TABLE InvoicePurchases ALTER COLUMN dollars float;

--Top Vendors by quantity
select top 10 vendorname, sum(quantity) as total_quantity
from PurchasesFINAL
group by vendorname
order by total_quantity desc;

-- ALTER TABLE PurchasesFINAL ALTER COLUMN dollars float;


--Top Vendors by Purchase Cost
select top 10 vendorname, sum(dollars) as total
from PurchasesFINAL
group by vendorname
order by total desc;


-- average leadtime
select avg (datediff(day, PODate, ReceivingDate)) as avg_leadtime
from PurchasesFINAL;


-- Average payment duration
select avg (datediff(day,InvoiceDate, PayDate)) as avg_leadtime
from PurchasesFINAL;


--calculating total days
select datediff(day, min(salesdate), max(salesdate)) as total_days
from SalesFINAL;

-- calculating sales per day
select  brand, description, 
		sum(SalesQuantity)/59 as sales_per_day
from SalesFINAL
group by brand, description;


-- calculating avg lead time
select brand, description, avg(datediff(day, PODate, ReceivingDate)) as avg_leadtime
from PurchasesFINAL
group by brand, description;

-- Calculating Max sales in one Day
select  brand, description, 
		max(SalesQuantity) as max_sales_in_a_day
from SalesFINAL
group by brand, description;

-- calculating max lead time
select brand, description, max(datediff(day, PODate, ReceivingDate)) as max_leadtime
from PurchasesFINAL
group by brand, description;

-- DROP VIEW stock_level;

-- Joining  tables
create view stock_level as	
	(select t1.Brand, t1.Description, sales_per_day, avg_leadtime, max_sales_in_a_day, max_leadtime
	from
		(select  brand, description, 
			sum(SalesQuantity)/59 as sales_per_day
		from SalesFINAL
		group by brand, description) t1
	left join
		(select brand, description, avg(datediff(day, PODate, ReceivingDate)) as avg_leadtime
		from PurchasesFINAL
		group by brand, description) t2
	on (t1.brand = t2.brand
		and 
		t1.description = t2.description)
	left join
		(select  brand, description, 
				max(SalesQuantity) as max_sales_in_a_day
		from SalesFINAL
		group by brand, description) t3
	on (t1.brand = t3.brand
		and 
		t1.description = t3.description)
	left join
		(select brand, description, 
				max(datediff(day, PODate, ReceivingDate)) as max_leadtime
		from PurchasesFINAL
		group by brand, description) t4
	on (t1.brand = t4.brand
		and 
		t1.description = t4.description)	);

--stock level view
select *
from stock_level;



--Safety stock = (maximum daily sales x maximum lead time) – (average daily sales x average lead time)

select brand, description, 
	(sales_per_day*avg_leadtime) as Optimal_Stock_Level,
	((max_sales_in_a_day*max_leadtime) - (sales_per_day*avg_leadtime)) as safety_stock
from stock_level;

/*
select  brand, description, 
		sum(SalesQuantity)--/59 as sales_per_day
from SalesFINAL
group by brand, description
having description = 'H3 Horse Heaven Hills Red Co';
*/

-- Recommended stock calculation
create view recommended_stock as
(
select brand, description, 
	Optimal_Stock_Level, safety_stock,
	(Optimal_Stock_Level + safety_stock) as recommended_stock
from (select brand, description, 
	(sales_per_day*avg_leadtime) as Optimal_Stock_Level,
	((max_sales_in_a_day*max_leadtime) - (sales_per_day*avg_leadtime)) as safety_stock
	from stock_level) as stock
)


-- problem in the database
select *
from stock_level
where max_sales_in_a_day < sales_per_day;

-- Updating Max_Daily_Sales for problematic products
select *,
	case
	when max_sales_in_a_day < sales_per_day then sales_per_day
	else max_sales_in_a_day
	end as new_max_sales_in_a_day
from stock_level
where max_sales_in_a_day < sales_per_day;


-- current stock calucation
select brand, description, sum(onhand) as total_end_inv
from EndInvFINAL
group by brand, description
order by total_end_inv;

select *
from recommended_stock;


select t1.Brand, t1.Description, optimal_stock_level, safety_stock, recommended_stock, total_end_inv
	from
		(select brand, description, sum(onhand) as total_end_inv
		from EndInvFINAL
		group by brand, description) t1
	left join
		(select *
		from recommended_stock) t2
	on (t1.brand = t2.brand
		and 
		t1.description = t2.description)

