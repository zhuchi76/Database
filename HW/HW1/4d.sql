/* 4d extract the country names (return Country_Region column) and total confirmed COVID cases (return Confirmed column) 
with more than 20,000,000 total COVID-19 cases on 2022-10-11 (data update date) (10 pts) */
select Country_Name, sum(Confirmed) as Confirmed_total
from Source2
group by Country_Name
having sum(Confirmed) > 20000000;