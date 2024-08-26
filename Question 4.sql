###4. What are the quarterly trends based on sales volume for the top 5 EV makers (4-wheelers) from 2022 to 2024?###

with cte1 as(select maker,sum(electric_vehicles_sold) as veh_2022 
from electric_vehicle_sales_by_makers m
join dim_date d on m.date=d.date
 where fiscal_year=2022 and vehicle_category="4-Wheelers"
 group by maker order by veh_2022  desc limit 5),cte2 as
 (select maker,
sum(case when quarter="Q1" then electric_vehicles_sold end) as Sales_Q1,
sum(case when quarter="Q2" then electric_vehicles_sold end) as Sales_Q2,
sum(case when quarter="Q3" then electric_vehicles_sold end) as Sales_Q3,
sum(case when quarter="Q4" then electric_vehicles_sold end) as Sales_Q4
 from electric_vehicle_sales_by_makers m 
 join dim_date d on m.date=d.date
 where fiscal_year=2022 and vehicle_category="4-Wheelers"
 group by maker)
 
 select a.maker,b.Sales_Q1,b.Sales_Q2,b.Sales_Q3,b.Sales_Q4
 from cte1 a
 join cte2 b 
 on a.maker = b.maker