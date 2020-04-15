--1
select name 
from restaurant 
where cuisine='Indian';







--2
select distinct name 
from restaurant
left outer join rating on restaurant.rid = rating.rid
where rating.stars>=4;
















--3

select name 
from restaurant
minus 
select distinct name from restaurant 
inner join rating on restaurant.rid = rating.rid;








--4
select name from reviewer,rating
where reviewer.vid = rating.vid
and rating.ratingdate is null;






--5

select rt.name,rw.name
from rating r1,rating r2,restaurant rt,reviewer rw
where
r1.vid=r2.vid 
and r1.stars > r2.stars and r1.ratingdate>r2.ratingdate  and
r1.rid=rt.rid and
rw.vid=r1.vid;









--6
select rt.name,r1.stars
from rating r1,restaurant rt,rating r2
where r1.rid = rt.rid
and
r1.rid=r2.rid 
and
r1.stars>All(r2.stars)
group by rt.name,r1.stars;








--7
select rt.name,max(r1.stars)-min(r1.stars)
from rating r1,restaurant rt,rating r2
where r1.rid = rt.rid
and
r1.rid=r2.rid 
group by rt.name,r1.rid;



--8



select avg(r1.stars) as indavg
from rating r1
inner join restaurant rt
on rt.rid=r1.rid where rt.cuisine='Indian'
group by r1.rid;



select avg(r1.stars) as chavg
from rating r1
inner join restaurant rt
on rt.rid=r1.rid where rt.cuisine='Chinese'
group by r1.rid;













































