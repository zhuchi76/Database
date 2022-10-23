/* 4f
extract the country names (return Country_Region column) 
and newly diagnosed case number of countries 
with a newly diagnosed case number (calculate the number by yourself) > 100,000 
on 2022-10-11 (compare with 2022-10-01). 
In descending order of newly diagnosed case numbers. (10 pts)
*/
select coalesce(Source1.Country_Name, Source2.Country_Name) Country_Name,
       coalesce(Source2.Confirmed, 0) - coalesce(Source1.Confirmed, 0) Confirmed_new_total
       from (select Country_Name,
                    sum(Confirmed) Confirmed
                    from Source2
                    group by Country_Name) Source2
            full join (select Country_Name,
                    		sum(Confirmed) Confirmed
                    		from Source1
                    		group by Country_Name) Source1
                      on Source1.Country_Name = Source2.Country_Name
	   where coalesce(Source2.Confirmed, 0) - coalesce(Source1.Confirmed, 0) > 100000
	   order by coalesce(Source2.Confirmed, 0) - coalesce(Source1.Confirmed, 0) desc;