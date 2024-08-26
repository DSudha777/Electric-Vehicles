 ### 8. What are the peak and low season months for EV sales based on the data from 2022 to 2024?###
 
 with cte1 as(
 select m.date,substring(m.date,4,3) as month ,d.fiscal_year,m.electric_vehicles_sold
 from electric_vehicle_sales_by_makers  m
join dim_date d on
m.date = d.date)
select Fiscal_year,month,sum(electric_vehicles_sold) as veh_mon from cte1
where fiscal_year=2022
group by month
order by veh_mon desc



