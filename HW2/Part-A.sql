select RentalCompany from ByCar where Mileage >= 27;


select tid from trips where travelmode = 'Train' and fare > 150;


select tid,fare from trips where tripstate = 'Non-US';


select tid from trips where travelmode = 'Plane' and fare > 1000;

select t1.tid
from trips t1, trips t2 
where t1.tripstate=t2.tripstate
and
t1.travelmode='Car' and t2.travelmode='Train'
and
t1.fare > t2.fare;



select distinct t1.tid,t2.tid
from bycar t1
join bycar t2
on
t1.mileage=t2.mileage
and 
t1.tid < t2.tid;



select t1.tid,t2.tid
from bytrain t1,bytrain t2
where 
t1.trainspeed < t2.trainspeed;
and 
t1.tid<t2.tid;



select distinct t1.tid,t2.tid
from trips t1,trips t2
where 
t1.tid<t2.tid
and
t1.travelmode=t2.travelmode
and 
t1.tripstate=t2.tripstate;


--9

select distinct t1.tripstate
from trips t1,trips t2,trips t3
where 
t1.tripstate=t2.tripstate and t2.tripstate=t3.tripstate
and
t1.travelmode != t2.travelmode and t2.travelmode!=t3.travelmode;


--10AB
select t1.*
from trips t1
left outer join trips t2
on t1.tid!=t2.tid
and
t1.fare > ALL(t2.fare) 
and
t2.tid is null
WHERE ROWNUM=1
union
select t1.*
from trips t1
left outer join trips t2
on t1.tid!=t2.tid
and
t1.fare < ALL(t2.fare) 
and
t2.tid is null
where ROWNUM=1;