create database truyum;
use truyum;

create table menu_items (
	item_id int primary key,
    item_name varchar(50),
    price float not null,
    Active varchar(20),
    date_of_launch date,
    category varchar(45),
    free_delivery enum("Yes", "No")
);
create table users (
	user_id int primary key,
    user_name varchar(60),
    address varchar(60)
);
create table cart (
	cart_id int primary key,
    item_id int,
    user_id int,
    foreign key (user_id) references users(user_id),
    foreign key (item_id) references menu_items(item_id)
);
insert into menu_items values(1,'Sandwich',99,'Yes','2016-09-01','main course','Yes');
insert into menu_items values(2,'Burger',129,'Yes','2015-03-09','main course','No');
insert into menu_items values(3,'Pizza',149,'Yes','2017-01-08','main course','No');
insert into menu_items values(4,'French Fries',49,'No','2017-03-05','Starters','Yes');
insert into menu_items values(5,'Chocolate Brownie',79,'Yes','2018-04-09','Dessert','Yes');


select * from menu_items;

select * from menu_items where date_of_launch >= '2016-09-01' and Active = 'Yes';

select item_name from menu_items where item_id = 5;

update menu_items set price = 150 where item_id = 2;

insert into users values (1, 'Karthick', 'Velachery');
insert into users values (2, 'Kiran', 'Madipakkam');
select*from users;
insert into cart values (1, 2, 1), (2, 3, 1), (3, 5, 1);
select*from cart;
select a.item_name from menu_items as a 
join cart as b on a.item_id = b.item_id where b.user_id = 1;

select sum(a.price) from menu_items as a 
join cart as b on a.item_id = b.item_id where b.user_id = 1;

delete from cart where user_id = 1 and item_id = 3;
select*from cart;