/* Write your PL/SQL query statement below */
-- select i.*,i2.* from insurance i  join insurance i2
-- on i.tiv_2015 = i2.tiv_2015
-- AND (i.lat != i2.lat and i.lon != i2.lon)
-- and (i.lat,i.lon) not in (select lat,lon from insurance group by lat,lon having count(*)>1);
select round(sum(tiv_2016),2) tiv_2016  from insurance where 
(lat,lon)  in (select lat,lon from insurance group by lat,lon having count(*)=1)
and 
tiv_2015 in (select tiv_2015 from insurance group by tiv_2015 having count(*)>1);

