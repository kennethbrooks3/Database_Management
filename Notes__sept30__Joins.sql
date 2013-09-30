Select p.name as "Product Name", 
       avg(o.dollars)
from orders o inner join products p		--same as   from orders o, products p
  on o.pid = p.pid				--same as   where o.pid = p.pid
group by p.name
having avg(dollars) > (select avg(dollars)
		       from orders)
order by p.name asc
--inner join
--testing for equalities
--connecting tables where the columns match



select * 
from orders o,
     products p,
     agents a,
     customers c
where o.pid = p.pid
  and o.aid = a.aid
  and o.cid = c.cid

-- Customers in the same city
select c1.name,
       c2.name
from customers c1,
     customers c2
where c1.city = c2.city
  and c1.cid <> c2.cid
  and c1.cid <  c2.cid


--Outer Joins
--left outer join
select * --distinct o.cid
from customers c left outer join orders o --joins every customer to their orders(becuase customer was on the left)
  on o.cid = c.cid
order by o.cid

--right outer join
select * --distinct o.cid
from customers c right outer join orders o --joins every order to their customer(becuase order was on the right)
  on o.cid = c.cid
order by o.cid