use furama;
-- --task6 
SELECT 
    sv.service_name,
    sv.service_code,
    sv.service_area,
    sv.rental_costs,
    svt.service_type_name
FROM
    service sv
        JOIN
    service_type svt ON svt.service_type_code = sv.service_type_code
        JOIN
    contract ct ON ct.service_code = sv.service_code
WHERE
    sv.service_code NOT IN (SELECT 
            s.service_code
        FROM
            contract c
                JOIN
            service s ON s.service_code = c.service_code
        WHERE
            c.contract_start LIKE '2021-01%'
                OR c.contract_start LIKE '2021-02%'
                OR c.contract_start LIKE '2021-03%')
GROUP BY sv.service_code;
-- task7
SELECT 
    sv.service_name,
    sv.service_code,
    sv.service_area,
    sv.rental_costs,
    svt.service_type_name
FROM
    service sv
        JOIN
    service_type svt ON svt.service_type_code = sv.service_type_code
        JOIN
    contract ct ON ct.service_code = sv.service_code
WHERE
    sv.service_code NOT IN (SELECT 
            s.service_code
        FROM
            contract c
                JOIN
            service s ON s.service_code = c.service_code
        WHERE
            c.contract_start LIKE '2021%')
GROUP BY sv.service_code;
-- task 8
SELECT DISTINCT
    customer_name
FROM
    customer;
SELECT 
    customer_name
FROM
    customer
GROUP BY customer_name;
SELECT 
    customer_name
FROM
    customer
WHERE
    customer_name NOT IN (SELECT 
            customer_name
        FROM
            customer
        WHERE
            customer_name IS NOT NULL
        GROUP BY customer_name
        HAVING COUNT(*) > 1);
-- task 9
SELECT 
    MONTH(ct.contract_start) AS 'month',
    COUNT(ct.customer_code) AS 'number of people booking'
FROM
    contract ct
    where year(ct.contract_start)="2021"
GROUP BY MONTH(ct.contract_start)
ORDER BY MONTH(ct.contract_start);
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
