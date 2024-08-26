### 10. Estimate the revenue growth rate of 4-wheeler and 2-wheelers EVs in India for 2022 vs 2024 and 2023 vs 2024, assuming an average unit price.####


with cte1 as(
select d.fiscal_year,
(sum(case when vehicle_category="2-Wheelers" then  electric_vehicles_sold*85000 end))/1000000000 as Rev_2Wheelers_2024_bln,
sum(case when vehicle_category="4-Wheelers" then  electric_vehicles_sold*1500000 end)/1000000000 as Rev_4Wheelers_2024_bln
 from electric_vehicle_sales_by_state s join dim_date d
 on s.date=d.date
 where d.fiscal_year=2024 
 group by d.fiscal_year),cte2 as(
select d.fiscal_year,
(sum(case when vehicle_category="2-Wheelers" then  electric_vehicles_sold*85000 end))/1000000000 as Rev_2Wheelers_2022_bln,
sum(case when vehicle_category="4-Wheelers" then  electric_vehicles_sold*1500000 end)/1000000000 as Rev_4Wheelers_2022_bln
 from electric_vehicle_sales_by_state s join dim_date d
 on s.date=d.date
 where d.fiscal_year=2022
 group by d.fiscal_year),cte3 as(
select d.fiscal_year,
(sum(case when vehicle_category="2-Wheelers" then  electric_vehicles_sold*85000 end))/1000000000 as Rev_2Wheelers_2023_bln,
sum(case when vehicle_category="4-Wheelers" then  electric_vehicles_sold*1500000 end)/1000000000 as Rev_4Wheelers_2023_bln
 from electric_vehicle_sales_by_state s join dim_date d
 on s.date=d.date
 where d.fiscal_year=2023
 group by d.fiscal_year)
 
 select round((Rev_2Wheelers_2024_bln-Rev_2Wheelers_2022_bln)/Rev_2Wheelers_2022_bln*100,2) as rev_growth_rate_2Wheelers_22vs24,
 round((Rev_4Wheelers_2024_bln-Rev_4Wheelers_2022_bln)/Rev_4Wheelers_2022_bln*100,2) as rev_growth_rate_4Wheelers_22vs24,
  round((Rev_2Wheelers_2024_bln-Rev_2Wheelers_2023_bln)/Rev_2Wheelers_2023_bln*100,2) as rev_growth_rate_2Wheelers_23vs24,
 round((Rev_4Wheelers_2024_bln-Rev_4Wheelers_2023_bln)/Rev_4Wheelers_2023_bln*100,2) as rev_growth_rate_4Wheelers_23vs24
 from cte1,cte2,cte3