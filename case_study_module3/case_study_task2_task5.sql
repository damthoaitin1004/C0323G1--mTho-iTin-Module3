use furama;
select *
from employee
where employee_name like "H%" or employee_name like "T%" or employee_name like "K%"
  AND LENGTH(employee_name) <= 15;
 select *
 from customer
 where  timestampdiff(year,customer_birth,curdate())>=18 and  timestampdiff(year,customer_birth,curdate()) <= 50 
 and customer_address like "%Đà Nẵng%" or customer_address like "%Quảng Trị%";
 select s.customer_name,count(*)
 from customer s 
 join customer_type c on s.customer_code = c.customer_type_code 
 where c.customer_type_name = 'Diamond'
 GROUP BY s.customer_name
 ORDER BY count(*) ASC;
