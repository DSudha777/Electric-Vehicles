## 2. Identify the top 5 states with the highest penetration rate in 2-wheeler and 4-wheeler EV sales in FY 2024.###;


with cte1 as(
select state,sum(electric_vehicles_sold) as veh_state
 from electric_vehicle_sales_by_state s join dim_date d
 on s.date=d.date
 where vehicle_category='2-Wheelers' and d.fiscal_year=2024
 group by state)
 select state,veh_state*100/(select sum(veh_state)from cte1) as total from cte1
 order by total desc limit 5;
 
 
 with cte1 as(
select state,sum(electric_vehicles_sold) as veh_state
 from electric_vehicle_sales_by_state s join dim_date d
 on s.date=d.date
 where vehicle_category='4-Wheelers' and d.fiscal_year=2024
 group by state)
 select state,veh_state*100/(select sum(veh_state)from cte1) as total from cte1
 order by total desc limit 5