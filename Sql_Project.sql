select * from books;
select * from customers;
select * from orders;


select title,genre from books where genre='Fiction';
select title, genre, published_year from books where published_year>1950;
select *from customers where country='Canada';

select count(order_id) as Total_Orders
from orders 
where order_date 
between '01-11-2023' and '30-11-2023';

select sum(stock) as Total_stock 
from books;

select * from books 
order by price desc limit 1;

select c.name,o.quantity from customers c join orders o on c.customer_id=o.order_id
where quantity>9;

select *from customers c join orders o on c.customer_id=o.order_id
where quantity>9;

select count(order_id) as total_orders
from orders 
where total_amount>20;

select  DISTINCT genre from books;

 select title,stock from books 
 order by stock asc limit 1;

select sum(total_amount) as Total_Revnue
from orders;


select * from books;
select * from customers;
select * from orders;
--Advanced Sql Questions
-- 1)Retrieve the total number of books sold by each genre.

select b.genre,sum(o.quantity) as Total_Sold_Books
from orders o JOIN books b ON o.book_id=b.book_id
group by b.genre;

--2)Find the average price of books in the Fantasy genre.

 select avg(price) as Avg_Price
 from books
 where genre='Fantasy';

-- 3) List customers who have placed at least 2 orders.

 select customer_id,count(order_id) as Placed_Orders
 from orders
 group by customer_id
 having count(order_id)>=2;

select o.customer_id,c.name,count(o.order_id) as Placed_Orders
 from orders o Join customers c on o.customer_id=c.customer_id
 group by o.customer_id,c.name
 having count(o.order_id)>=2;

-- 4) Find the most frequently ordered book.

select o.book_id,b.title,o.order_date as Frequently_Ordered_book
from orders o Join books b on o.book_id=b.book_id
order by order_date desc LIMIT 1;

-- 5) Show the top 3 most expensive books of "Fantasy" genre.

select genre, price
from books
where genre='Fantasy'
order by price desc limit 3;




select * from books;
select * from customers;
select * from orders;

--6) Retrieve the total quantity of books sold by each auther;

select b.author,sum(o.quantity) as Total_Quantity
from books b Join orders o on b.book_id=o.book_id
group by b.author;
--having sum(o.quantity)>=15 ;

--7) List the cities where customers who spend over $30 located;

select distinct c.city
from orders o join customers c on c.customer_id=o.customer_id
where o.total_amount>=30;


--8) Find the customer who spent most on orders
select o.customer_id,c.name,sum(o.total_amount) as Spend_Amount
from orders o join customers c on c.customer_id=o.customer_id
group by o.customer_id,c.name
order by spend_Amount desc limit 1; 

--9) Calculate the stock remaining after fulfilling all orders;

  select 
        sum(b.stock) as Total_Stock,
		sum(o.quantity) as Total_sold_quantity,
		sum(b.stock)- sum(o.quantity) as Remainnig_Stock
        from books b 
	    join orders o 
	    on o.book_id=b.book_id;


SELECT 
    b.book_id,
    b.stock,
    COALESCE(SUM(o.quantity), 0) AS sold_quantity,
    b.stock -COALESCE(SUM(o.quantity), 0)  AS remaining_stock
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.stock;
