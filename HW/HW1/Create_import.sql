drop table Source1, Source2, Source3;

CREATE TABLE Source1 (
	FIPS INT, 
	Admin2 VARCHAR(100), 
	Province_State VARCHAR(100), 
	Country_Region VARCHAR(100), 
	Last_Update timestamp, 
	Lat DOUBLE PRECISION, 
	Long_ DOUBLE PRECISION, 
	Confirmed INT, 
	Deaths INT, 
	Recovered INT, 
	Active INT, 
	Combined_Key VARCHAR(100), 
	Incident_Rate DOUBLE PRECISION, 
	Case_Fatality_Ratio DOUBLE PRECISION);

CREATE TABLE Source2 (
	FIPS INT, 
	Admin2 VARCHAR(100), 
	Province_State VARCHAR(100), 
	Country_Region VARCHAR(100), 
	Last_Update timestamp, 
	Lat DOUBLE PRECISION, 
	Long_ DOUBLE PRECISION, 
	Confirmed INT, 
	Deaths INT, 
	Recovered INT, 
	Active INT, 
	Combined_Key VARCHAR(100), 
	Incident_Rate DOUBLE PRECISION, 
	Case_Fatality_Ratio DOUBLE PRECISION);

CREATE TABLE Source3 (
	Continent_Name VARCHAR(100),
	Continent_Code VARCHAR(100),
	Country_Name VARCHAR(100),
	Two_Letter_Country_Code VARCHAR(100),
	Three_Letter_Country_Code VARCHAR(100),
	Country_Number INT
	);
	
COPY Source1 from 'D:\111up\Database\HW\HW1\10-01-2022.csv' DELIMITER ',' CSV HEADER;

COPY Source2  from 'D:\111up\Database\HW\HW1\10-11-2022.csv' DELIMITER ',' CSV HEADER;

COPY Source3  from 'D:\111up\Database\HW\HW1\country-and-continent-codes-list-csv.csv' 
DELIMITER ',' CSV HEADER;

alter table Source2
rename column Country_Region to Country_Name;

alter table Source1
rename column Country_Region to Country_Name;
