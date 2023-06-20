create database demo;
use demo;
create table product(
id int primary key auto_increment,
product_code varchar(45), 
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45)
);
insert into product (product_code,product_name,product_price,product_amount,product_description,product_status)
value ('SP01','Bánh sicula',35000,10,'siêu ngon','mới nhập siêu ngon'),('SP02','Bánh dẻo ',50000,20,'siêu dai','hàng sắp hết hạn xả lỗ');
CREATE UNIQUE INDEX idx_product_code ON product (product_code);
CREATE INDEX idx_product_name_price ON Products (product_name, product_price);
explain select *
from product;
CREATE VIEW product_info AS
SELECT product_code, product_name, product_price, product_status
FROM product;
UPDATE product
SET product_name = 'Bánh sochocola'
WHERE id = 1;
DROP VIEW product_info;


DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT *
    FROM product;
END //
DELIMITER ;
call GetAllProducts();
DELIMITER //
CREATE PROCEDURE add_new_product(
in new_product_code VARCHAR(45),
in new_product_name VARCHAR(45),
in new_product_price DOUBLE,
in new_product_amount int,
in new_product_description VARCHAR(50),
in new_product_status VARCHAR(45)
)
BEGIN
    INSERT INTO product (product_code, product_name, product_price,product_amount, product_description, product_status)
    VALUES (new_product_code, new_product_name, new_product_price, new_product_amount, new_product_description,new_product_status);
END //
DELIMITER ;
call add_new_product( 'SP03','sadasd',50000,5,'aaa','sadsad');
-- 
delimiter //
CREATE PROCEDURE update_id_product(
in new_id int,
in new_product_status varchar(45)
)
begin
set sql_safe_updates = 0;
update product
set product_status =  new_product_status
where id = new_id;
set sql_safe_updates = 1;
END //
DELIMITER ;
call update_id_product(4,"hàng mới nhập");
delimiter //
CREATE PROCEDURE delete_id_product(
in new_id int
)
begin
set sql_safe_updates = 0;
delete from product
where id = new_id;
set sql_safe_updates = 1;
END //
DELIMITER ;
call delete_id_product(4)
