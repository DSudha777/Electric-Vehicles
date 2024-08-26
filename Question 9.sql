#### 9. What is the projected number of EV sales (including 2-wheelers and 4-wheelers) for the top 10 states by penetration rate in 2030, based on the compounded annual growth rate (CAGR) from previous years?####

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
 group by state ),cte3 as(
  select a.state,veh_2022 ,veh_2024,
 round(((power((veh_2024/veh_2022),(1/2))-1)),2)
 as CAGR from cte1 a
 join cte2 b on a.state=b.state
 ),cte4 as(
select state,sum(electric_vehicles_sold)/1000000 as tot_veh_2024_mln
 from electric_vehicle_sales_by_state s join dim_date d
 on s.date=d.date
 where d.fiscal_year=2024
 group by state)
 
 select c.state,CAGR,d.tot_veh_2024_mln, 
 round(tot_veh_2024_mln* power((1+CAGR),6),3) as proj_sales_mln
 from cte3 c
 join cte4 d
 on c.state=d.state
 order by proj_sales_mln desc limit 10