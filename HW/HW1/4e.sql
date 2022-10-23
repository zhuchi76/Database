/* 4e
extract the country names (return Country_Region column) 
and total confirmed COVID cases (return Confirmed column) 
with more than 20,000,000 total COVID-19 cases 
on 2022-10-11 (data update date). 
Try to join the Country code and continents mapping table, 
and return only the data from countries in Asia. (10 pts)
*/

update Source3
set Country_Name = Country_Name || ',';

update Source3
set Country_Name = LEFT(Country_Name, strpos(Country_Name, ',')-1 );

update Source3
set Country_Name = 'Russia' where Country_Name = 'Russian Federation';
update Source3
set Country_Name = 'Turkey'  where Three_Letter_Country_Code = 'TUR';
update Source3
set Country_Name = 'United Kingdom'  where Three_Letter_Country_Code = 'GBR';
update Source3
set Country_Name = 'US'  where Three_Letter_Country_Code = 'USA';
update Source3
set Country_Name = 'Korea, South' where Three_Letter_Country_Code = 'PRK';
update Source3
set Country_Name = 'Korea, North' where Three_Letter_Country_Code = 'KOR';

select Source2.Country_Name, sum(Source2.Confirmed) as Confirmed_total
from Source2 natural join Source3 where Source3.Continent_Name = 'Asia'
group by Source2.Country_Name
having sum(Source2.Confirmed) > 20000000;