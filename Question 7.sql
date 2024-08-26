###7. List down the top 10 states that had the highest compounded annual growth rate (CAGR) from 2022 to 2024 in total vehicles sold.###

with cte1 as(
select state,sum(total_vehicles_sold) as veh_2022 
from electric_vehicle_sales_by_state m
join dim_date d on m.date=d.date
 where fiscal_year=2022 
 group by state),cte2 as(
 select state,sum(total_vehicles_sold) as veh_2024
from electric_vehicle_sales_by_state m
join dim_date d on m.date=d.date
 where fiscal_year=2024 
 group by state )
 
 select a.state,veh_2022 ,veh_2024,
 round(((power((veh_2024/veh_2022),(1/2))-1)*100),2)
 as CAGR from cte1 a
 join cte2 b on a.state=b.state
 ORDER BY CAGR desc limit 10