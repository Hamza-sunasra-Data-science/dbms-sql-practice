create database Hamza;
use Hamza;
create table customer(cu_id int primary key,cu_name varchar(30),email_id varchar(30),city varchar(20));
insert into customer (cu_id,cu_name,email_id,city)
values
(1,'Aarav sharma','aarav02@ganil.com','mumbai'),
(2,'priya patel','priya@gmail.com','pune'),
(3,'Rahul verma','rahulvarma@gmail.com','delhi'),
(4,'Aisha khan','aaish2009@gmail.com','mumbai'),
(5,'rohan mehta','mehta78@gmail.com','bengaluru'),
(6,'sara saikh','sarasaikh@gmail.com','hydrabad'),
(7, 'Kabir Joshi', 'kabir.joshi@example.com', 'Pune'),
(8, 'Neha Singh', 'neha.singh@example.com', 'Delhi'),
(9, 'Arjun Desai', 'arjun.desai@example.com', 'Mumbai'),
(10, 'Zoya Ansari', 'zoya.ansari@example.com', 'Jaipur');
select * from customer;

create table products(pr_id int primary key,pr_name varchar(30),category varchar(30),price int(10),stock int(10));
insert into products(pr_id,pr_name,category,price,stock)
values
(101, 'Wireless Mouse', 'Electronics', 599, 50),
(102, 'Keyboard', 'Electronics', 999, 30),
(103, 'Notebook', 'Stationery', 80, 200),
(104, 'Water Bottle', 'Home', 299, 75),
(105, 'Headphones', 'Electronics', 1499, 25),
(106, 'Pen Pack', 'Stationery', 120, 100),
(107, 'Backpack', 'Bags', 899, 40),
(108, 'Desk Lamp', 'Home', 699, 20),
(109, 'USB Cable', 'Electronics', 199, 60),
(110, 'Calculator', 'Stationery', 450, 35);
select * from products;

create table orders (or_id int primary key,cu_id int,or_data char,stutes varchar(30),
foreign key(cu_id) references customer (cu_id));
insert into orders (or_id,cu_id,or_data,stutes)
values
(1001, 1, '2026-10-01', 'Delivered'),
(1002, 2, '2026-10-02', 'Shipped'),
(1003, 3, '2026-10-03', 'Pending'),
(1004, 4, '2026-10-04', 'Delivered'),
(1005, 5, '2026-10-05', 'Cancelled'),
(1006, 1, '2026-10-06', 'Shipped'),
(1007, 6, '2026-10-07', 'Pending'),
(1008, 7, '2026-10-08', 'Delivered'),
(1009, 8, '2026-10-09', 'Shipped'),
(1010, 3, '2026-10-10', 'Delivered');
select * from orders;
alter table orders modify or_data varchar(30);
select * from orders,customer;

create table order_itmes(item_id int primary key,or_id int,pr_id int,quantity int,price int,
foreign key (or_id) references orders (or_id),foreign key (pr_id) references products(pr_id));
INSERT INTO order_itmes (item_id, or_id, pr_id, quantity, price)
VALUES
(1, 1001, 101, 2, 599),
(2, 1001, 109, 1, 199),
(3, 1002, 105, 1, 1499),
(4, 1003, 103, 5, 80),
(5, 1004, 104, 2, 299),
(6, 1005, 107, 1, 899),
(7, 1006, 102, 1, 999),
(8, 1007, 106, 3, 120),
(9, 1008, 108, 1, 699),
(10, 1009, 110, 2, 450);
select * from order_itmes;

create table pyment(py_id int primary key,or_id int,amount int,py_method varchar(20),py_stutes varchar(20),
foreign key(or_id) references orders(or_id));
insert into pyment(py_id,or_id,amount,py_method,py_stutes)
values
(1, 1001, 1397, 'UPI', 'Paid'),
(2, 1002, 1499, 'Card', 'Paid'),
(3, 1003, 400, 'UPI', 'Pending'),
(4, 1004, 598, 'Cash', 'Paid'),
(5, 1005, 899, 'Card', 'Failed'),
(6, 1006, 999, 'UPI', 'Paid'),
(7, 1007, 360, 'Card', 'Pending'),
(8, 1008, 699, 'UPI', 'Paid'),
(9, 1009, 900, 'Net Banking', 'Paid'),
(10, 1010, 160, 'UPI', 'Paid');
select * from pyment;

create table shipment(sh_id int primary key,or_id int,tr_stutes varchar(20),de_data varchar(30),
foreign key(or_id) references orders(or_id));
insert into shipment(sh_id,or_id,tr_stutes,de_data)
values
(1, 1001, 'Delivered', '2026-10-03'),
(2, 1002, 'In Transit', '2026-10-06'),
(3, 1003, 'Processing', NULL),
(4, 1004, 'Delivered', '2026-10-06'),
(5, 1005, 'Cancelled', NULL),
(6, 1006, 'Shipped', NULL),
(7, 1007, 'Processing', NULL),
(8, 1008, 'Delivered', '2026-10-10'),
(9, 1009, 'In Transit', NULL),
(10, 1010, 'Delivered', '2026-10-12');
select * from shipment;

create table reviews(re_id int primary key,cu_id int,pr_id int,rating int,comments varchar (33),
foreign key(cu_id) references customer(cu_id),foreign key(pr_id) references products(pr_id));
insert into reviews(re_id,cu_id,pr_id,rating,comments)
values
(1, 1, 101, 5, 'Excellent product'),
(2, 2, 105, 4, 'Good sound quality'),
(3, 3, 103, 5, 'Very useful'),
(4, 4, 104, 3, 'Average quality'),
(5, 5, 107, 4, 'Nice backpack'),
(6, 1, 109, 4, 'Works well'),
(7, 6, 106, 5, 'Good pens'),
(8, 7, 108, 3, 'Light is okay'),
(9, 8, 110, 5, 'Easy to use'),
(10, 9, 102, 4, 'Good keyboard');
select * from reviews;
alter table reviews rename column comment to comments;

select customer.cu_name,orders.or_id 
from customer
inner join orders
on orders.cu_id=customer.cu_id;

select products.pr_name,order_itmes.quantity
from products
inner join order_itmes
on order_itmes.pr_id=products.pr_id;

select customer.cu_name,orders.or_id from customer
inner join orders
on customer.cu_id=orders.cu_id 
where customer.city='mumbai' ;

select customer.cu_name,orders.or_id 
from customer
inner join orders
on orders.cu_id=customer.cu_id
where stutes='Delivered';

select pr_name,pr_id,price from products where price>=500;
select count(electronics),pr_name from products where category='electronics' ;


