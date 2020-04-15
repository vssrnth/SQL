declare
resid int;
userid int;
username varchar2(100)
done varchar2(100);
doer varchar2(100);


create or replace FUNCTION p(resname varchar2(100),uname varchar2(100),rate int,ratingdate date)
return varchar2
is
begin
username:=uname;
resid:=0;
userid:=0;
select rid into resid  from restaurant where name=resname;
insert into reviewer (name)
select username from dual where not exists (select name from users where name=username);
done:='Complete';
end;

begin
doer=p('cancer','jade',4,'2011-01-22');





