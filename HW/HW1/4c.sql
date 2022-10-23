/* 4c
extract the newly diagnosed case number (Confirmed) in California, US 
on 2022-10-11, compared with 2022-10-01 (data update date), 
and return the difference between them, 
in one SQL statement (please don’t just do 4a-4b in excel or other software) (10 pts)
*/

select sum (coalesce(Source2.Confirmed, 0) - coalesce(Source1.Confirmed, 0) ) as Confirmed_new_total
       from (select Province_State, Country_Name,
                    sum(Confirmed) Confirmed
                    from Source2
                    group by Province_State, Country_Name) Source2
            full join (select Province_State, Country_Name,
                    		sum(Confirmed) Confirmed
                    		from Source1
                    		group by Province_State, Country_Name) Source1
                      on Source1.Province_State = Source2.Province_State
					  and Source1.Country_Name = Source2.Country_Name
	   where Source1.Province_State = 'California'
	   and Source2.Province_State = 'California' 
	   and Source1.Country_Name = 'US'
	   and Source2.Country_Name = 'US';
