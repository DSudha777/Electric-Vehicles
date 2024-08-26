#### 6. List down the compounded annual growth rate (CAGR) in 4-wheeler units for the top 5 makers from 2022 to 2024.###


with cte1 as(
select maker,sum(electric_vehicles_sold) as veh_2022 
from electric_vehicle_sales_by_makers m
join dim_date d on m.date=d.date
 where fiscal_year=2022 and vehicle_category="4-Wheelers"
 group by maker),cte2 as(
 select maker,sum(electric_vehicles_sold) as veh_2024
from electric_vehicle_sales_by_makers m
join dim_date d on m.date=d.date
 where fiscal_year=2024 and vehicle_category="4-Wheelers"
 group by maker )
 
 select a.maker,veh_2022 ,veh_2024,
 round(((power((veh_2024/veh_2022),(1/2))-1)*100),2)
 as CAGR from cte1 a
 join cte2 b on a.maker=b.maker
 ORDER BY CAGR desc limit 5
 
