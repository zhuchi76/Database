/* b.	extract the total case number (Confirmed) in California, US 
on 2022-10-01 (data update date) (10 pts) */
select sum(Confirmed) as Confirmed_total
from Source1 where Province_State = 'California' and Country_Name = 'US';