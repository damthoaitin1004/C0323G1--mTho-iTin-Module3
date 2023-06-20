-- task 16
use furama;
set sql_safe_updates = 0;
DELETE FROM employee
WHERE employee_code NOT IN (
  SELECT DISTINCT employee_code
  FROM contract
  WHERE YEAR(contract_start) BETWEEN 2019 AND 2021
);
set sql_safe_updates = 1;
-- task 17
create view view_customer as
select customer.customer_code,sum(rental_costs + (detailed_contract_number * Accompanied_service_price)) as 'total price'
from customer
 left join customer_type on customer_type.customer_type_code =  customer.customer_type_code
 left join contract  on contract.customer_code = customer.customer_code
left join service on contract.service_code = service.service_code
left join detailed_contract on detailed_contract.contract_code =  contract.contract_code
left join Accompanied_service on Accompanied_service.Accompanied_service_code = detailed_contract.Accompanied_service_code
where year(contract.contract_start) = 2021 and customer_type.customer_type_name = 'Platinium'
group by contract.customer_code
having sum(rental_costs + (detailed_contract_number * Accompanied_service_price)) > 10000000;
 
 set sql_safe_updates = 0;

 update customer
 join customer_type on customer.customer_type_code = customer_type.customer_type_code
 set customer.customer_type_code = 1
 where customer.customer_type_code = 2 and customer.customer_code in (
 select customer_code from view_customer
 );
 set sql_safe_updates = 1;

-- task 18



 set sql_safe_updates = 0;

delete from customer
where  customer.customer_code in (
	select *
    from(
		select customer_code
        from contract
        where year(contract.contract_start) < 2021
    ) as p
);

 set sql_safe_updates = 1;
-- task 19
update Accompanied_service 
join detailed_contract on detailed_contract.Accompanied_service_code = Accompanied_service.Accompanied_service_code
set Accompanied_service_code.Accompanied_service_price = Accompanied_service.Accompanied_service_price*2
where detailed_contract.detailed_contract_number > 10;
-- task 20
select 	e.employee_code as 'mã',
		e.employee_name as 'tên',
        e.employee_email as 'email',
        e.employee_phone_number as 'số điện thoại',
        e.employee_birth as 'ngày sinh',
        e.employee_address as 'địa chỉ',
        'nhân viên' as 'phân loại' 
from employee e 
union all
select 	c.customer_code ,
		c.customer_name,
        c.customer_email,
        c.customer_phone_number,
        c.customer_birth,
        c.customer_address,
        'khách hàng'
from customer c;
