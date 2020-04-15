drop table request;
drop table product;
drop table FullOrder;
drop table customer;

create table customer(
customerID number(3),
Name varchar(20),
Address varchar(40),
primary key (customerID)
);

create table FullOrder(
OrderID number(5),
OrderDate date,
customerID number(3),
primary key(OrderID),
foreign key(customerID) REFERENCES customer (customerID)
);

create table product(
ProductID number(2),
description varchar(28),
finish varchar(10),
Price float,
primary key (ProductID),
check (price>=0 AND price<=999.99)
);


create table request(
OrderID number(5),
ProductID number(5),
Quantity integer,
foreign key (OrderID) references FullOrder (OrderID),
foreign key (ProductID) references product (ProductID),
check (Quantity >=1 AND Quantity<=100)
);

insert into customer values(2,'casual furniture','plano,TX');
insert into customer values(6,'mountain gallery','Boulder,CO');

insert into FullOrder values(1006,'24-Mar-10',2);
insert into FullOrder values(1007,'25-Mar-10',6);
insert into FullOrder values(1008,'25-Mar-10',6);
insert into FullOrder values(1009,'26-Mar-10',2);

insert into product values(10,'writing desk','Oak',425);
insert into product values(30,'dining table','Ash',600);
insert into product values(40,'entertainment centre','maple',650);
insert into product values(70,'childrens dresser','pine',300);


insert into request values(1006,10,4);
insert into request values(1006,30,2);
insert into request values(1006,40,1);
insert into request values(1007,40,3);
insert into request values(1007,70,2);
insert into request values(1008,70,1);
insert into request values(1009,10,2);
insert into request values(1009,40,1);


select * from customer;
select * from fullorder;
select * from product;
select * from request;