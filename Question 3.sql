###3. List the states with negative penetration (decline) in EV sales from 2022 to 2024###

with cte1 as(
select state,sum(electric_vehicles_sold) as total_22 from electric_vehicle_sales_by_state s
join dim_date d on s.date=d.date
where fiscal_year=2022
group by state ),cte2 as(
select state,sum(electric_vehicles_sold) as total_24 from electric_vehicle_sales_by_state s
join dim_date d on s.date=d.date
where fiscal_year=2024
group by state),cte3 as(
select  a.state,total_22/(select sum(total_22) from cte1)*100 as penetration_rate_22,
total_24/(select sum(total_24) from cte2)*100 as penetration_rate_24 from cte1 a 
join cte2 b on a.state = b.state
group by a.state)

select state,(penetration_rate_24-penetration_rate_22) as diff from cte3
where (penetration_rate_24-penetration_rate_22)<0
order by diff asc
