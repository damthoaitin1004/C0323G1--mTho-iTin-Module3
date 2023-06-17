use furama;
select *
from employee
where employee_name like "H%" or employee_name like "T%" or employee_name like "K%"
  AND LENGTH(employee_name) <= 15;
 select *
 from customer
 where  timestampdiff(year,customer_birth,curdate())>=18 and  timestampdiff(year,customer_birth,curdate()) <= 50 
 and customer_address like "%Đà Nẵng%" or customer_address like "%Quảng Trị%";
 
 select s.customer_name,count(ct.contract_code) as "count_booking"
 from customer s 
 join contract ct on s.customer_code = ct.customer_code
 join customer_type cust on s.customer_type_code = cust.customer_type_code
 where cust.customer_type_name = "Diamond"
 GROUP BY s.customer_name
 ORDER BY  "count_booking";
 
select c.customer_code,customer_name, customer_type_name, contract_code,service_name,contract_start,contract_end, rental_costs*detailed_contract_number as 'total price'
from customer c
join customer_type cl
on cl.customer_type_code = c.customer_type_code
left join contract ctr
on ctr.customer_code=c.customer_code
left join  service sv
on sv.service_code = ctr.service_code
left join detailed_contract dc
on dc.contract_code=ctr.contract_code
left join Accompanied_service ra
on ra.Accompanied_service_code = dc.Accompanied_service_code;

