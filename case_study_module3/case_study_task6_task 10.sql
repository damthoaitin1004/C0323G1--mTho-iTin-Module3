use furama;
-- --task6 
select  sv.service_name,sv.service_code,sv.service_area,sv.rental_costs,svt.service_type_name 
from service sv
 join service_type svt on svt.service_type_code = sv.service_type_code
 join contract ct on   ct.service_code = sv.service_code
where sv.service_code not in (
select s.service_code 
from contract c
 join service s on   s.service_code = c.service_code
 where c.contract_start like "2021-01%" or c.contract_start like "2021-02%" or c.contract_start like "2021-03%"
) group by sv.service_code;
-- task7
select  sv.service_name,sv.service_code,sv.service_area,sv.rental_costs,svt.service_type_name 
from service sv
 join service_type svt on svt.service_type_code = sv.service_type_code
 join contract ct on   ct.service_code = sv.service_code
where sv.service_code not in(
select s.service_code 
from contract c
 join service s on   s.service_code = c.service_code
  where c.contract_start like "2021%"
) group by sv.service_code;
-- task 8
SELECT DISTINCT customer_name
FROM customer;
SELECT customer_name
FROM customer
GROUP BY customer_name;
SELECT customer_name
FROM customer
WHERE customer_name NOT IN (
    SELECT customer_name
    FROM customer
    WHERE customer_name IS NOT NULL
    GROUP BY customer_name
    HAVING COUNT(*) > 1
);
-- task 9
SELECT MONTH(ct.contract_start) AS 'month', COUNT( ct.customer_code) AS 'number of people booking'
FROM contract ct
 join customer c on   c.customer_code = ct.customer_code
GROUP BY Month(ct.contract_start)
order by Month(ct.contract_start);
-- task 10
SELECT 
   ct.contract_code,
   ct.contract_start,
    ct.contract_end,
   ct.contract_money,
    SUM(ctd.detailed_contract_number) AS number_contract
FROM
    contract ct
        LEFT JOIN
    detailed_contract ctd ON ctd.contract_code = ct.contract_code
GROUP BY (ct.contract_code);
