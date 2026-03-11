USE restaurant_db;

select * from menu_items;

select COUNT(*) from menu_items; # no.of rows

select * from menu_items
order by price;

select * from menu_items
order by price desc;

select COUNT(*) from menu_items
where category = 'Italian'; 

select *
from menu_items
where category = 'Italian'
order by price;

select *
from menu_items
where category = 'Italian'
order by price desc;

select category , count(menu_item_id) as num_of_dishes
from menu_items
group by category;

select category , avg(price) as avgprice_of_dishes
from menu_items
group by category;

select * from order_details;

select * from order_details
order by order_date;

select min(order_date),max(order_date) from order_details;

select count(distinct order_id) from order_details;

select count(*) from order_details;

select order_id , count(item_id) as num_items
from order_details
group by order_id
order by num_items desc;

select count(*) from 
(select order_id , count(item_id) as num_items
from order_details
group by order_id
having num_items>12) AS num_orders;

select *
from order_details od left join menu_items mi on od.item_id = mi.menu_item_id;

select item_name,category,count(order_details_id) as num_purchases
from order_details od left join menu_items mi on od.item_id = mi.menu_item_id
group by item_name,category
order by num_purchases;

select order_id, sum(price) as total_spend
from order_details od left join menu_items mi on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;

select category,count(item_id) as num_items
from order_details od left join menu_items mi on od.item_id = mi.menu_item_id
where order_id = 440
group by category;


select order_id,category,count(item_id) as num_items
from order_details od left join menu_items mi on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by order_id,category;








