--##1. List the top 3 and bottom 3 makers for the fiscal years 2023 and 2024 in terms of the number of 2-wheelers sold. ###--


with cte1  as (
select m.*,d.fiscal_year
 from electric_vehicle_sales_by_makers m
 join dim_date d
 on m.date = d.date)
 select maker,sum(electric_vehicles_sold) as veh_sold from cte1 
 where fiscal_year=2023 and vehicle_category='2-Wheelers'
 group by maker
 order by veh_sold desc limit 3
 
 