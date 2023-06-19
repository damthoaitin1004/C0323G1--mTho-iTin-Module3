use furama;
-- task 11
SELECT 
    Accompanied_service.Accompanied_service_code,
    Accompanied_service.Accompanied_service_name,
    Accompanied_service.Accompanied_service_price,
    Accompanied_service.Accompanied_service_unit,
    Accompanied_service.Accompanied_service_status
FROM
    Accompanied_service
        JOIN
    detailed_contract ON detailed_contract.Accompanied_service_code = Accompanied_service.Accompanied_service_code
        JOIN
    contract ON detailed_contract.contract_code = contract.contract_code
        JOIN
    customer ON contract.customer_code = customer.customer_code
        JOIN
    customer_type ON customer_type.customer_type_code = customer.customer_type_code
WHERE
    customer_type.customer_type_name = 'Diamond'
        AND customer.customer_address LIKE '%Vinh%'
        OR customer.customer_address LIKE 'Quảng Ngãi'
GROUP BY Accompanied_service.Accompanied_service_code;
-- task 12
SELECT contract.contract_code,
employee.employee_name,
customer.customer_name,
customer.customer_phone_number,
service.service_name,
sum(detailed_contract.detailed_contract_number) as number_of_services_included,
contract.contract_money
FROM
contract
 join customer on contract.customer_code=customer.customer_code
 join employee on contract.employee_code = employee.employee_code
 join service on contract.service_code = service.service_code
left join detailed_contract on contract.contract_code = detailed_contract.contract_code
 where contract.service_code not in (SELECT 
             c.service_code
         FROM
             contract c
         WHERE
        (c.contract_start between '2021-01-01' and '2021-06-30') or (not contract.contract_start between '2020-10-01' and '2020-12-31'))
       group by contract.contract_code;
-- task 13
select 	Accompanied_service.Accompanied_service_code, Accompanied_service.Accompanied_service_name, max(detailed_contract.detailed_contract_number) as quantity_service_free
 from Accompanied_service 
 join detailed_contract  on Accompanied_service.Accompanied_service_code= detailed_contract.Accompanied_service_code
 join contract  on detailed_contract.contract_code=contract.contract_code
 where detailed_contract.detailed_contract_number in(
 select max(detailed_contract_number)
 from detailed_contract)
 group by Accompanied_service.Accompanied_service_code;
--   ---task 14
select contract.contract_code,
service_type.service_type_name,
Accompanied_service.Accompanied_service_name,
count(Accompanied_service.Accompanied_service_code) as so_lan_su_dung
from detailed_contract
 join Accompanied_service on detailed_contract.Accompanied_service_code = Accompanied_service.Accompanied_service_code
 join contract on detailed_contract.contract_code = contract.contract_code
 join service on contract.service_code = service.service_code
 join service_type on service.service_type_code = service_type.service_type_code
 where Accompanied_service.Accompanied_service_code in (select Accompanied_service.Accompanied_service_code
from Accompanied_service
join detailed_contract on detailed_contract.Accompanied_service_code = Accompanied_service.Accompanied_service_code
join contract on contract.contract_code=detailed_contract.contract_code
group by Accompanied_service.Accompanied_service_code
having count(detailed_contract.detailed_contract_code)=1
 )
group by  detailed_contract.detailed_contract_code;