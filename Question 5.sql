### 5. How do the EV sales and penetration rates in Delhi compare to Karnataka for 2024? ####

with cte1 as(
select state,sum(electric_vehicles_sold) as tot_sales
 from  electric_vehicle_sales_by_state s
 join dim_date d on
 s.date=d.date where
 fiscal_year =2024
 group by state)
 select state,tot_sales,
 tot_sales/(select sum(tot_sales) from cte1)*100 as penetration_rate 
 from  cte1
 where state in("Delhi","Karnataka") 