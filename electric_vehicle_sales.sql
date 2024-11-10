/*Number of sales per year new*/
select count(*), date_part('year', sale_date) as years
from electric_vehicle_transactions
WHERE transaction_type='Original Title'	
group by years;

/*Number of sales per year used*/
select count(*), date_part('year', sale_date) as years
from electric_vehicle_transactions
WHERE transaction_type='Transfer Title'	
group by years;

-----

/*Average sales per month of year over span 12 years*/
select count(*) / 12 as avg_number_sales, date_part('month', sale_date) as month
from electric_vehicle_transactions
WHERE transaction_type='Original Title'
group by month

-----

/*Count number of sales per brand in 2023 (both new and used)*/
select count(*), make as make 
from electric_vehicle_transactions
WHERE transaction_type='Original Title' OR transaction_type='Transfer Title'	
	AND date_part('year', sale_date) = 2023
group by make;

-----

/*Number of hybrid sales in 2023*/
select count(*)
from electric_vehicle_transactions
WHERE transaction_type='Original Title' /*OR transaction_type='Transfer Title'	*/
	AND clean_alt_fuel_type LIKE '%Plug%'
	AND date_part('year', sale_date) = 2023

/*Number of battery sales in 2023*/
select count(*)
from electric_vehicle_transactions
WHERE transaction_type='Original Title' /*OR transaction_type='Transfer Title'	*/
	AND clean_alt_fuel_type LIKE '%Battery%'
	AND date_part('year', sale_date) = 2023