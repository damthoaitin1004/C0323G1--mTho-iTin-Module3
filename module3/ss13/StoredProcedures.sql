use demo;


DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)

BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$

DELIMITER ;
DELIMITER $$
create procedure delete_user(
in user_id int
)
begin

DELETE FROM users
WHERE id = user_id;
end$$
DELIMITER ;


DELIMITER $$
create procedure select_all()
begin
select * from users;
end$$
DELIMITER ;

DELIMITER $$
create procedure update_user(
 in user_name varchar(50),
 in user_email varchar(50),
 in user_country varchar(50),
 in user_id int
)
begin
update users 
set name = user_name,
email = user_email,
country = user_country
where id = user_id;
end$$
DELIMITER ;
call update_user('banh','damthoai@gmail.com','ThaiLand',6)
DELIMITER $$
create procedure search_by_country(
in user_name_country varchar(50)
)
begin 
select * 
from users
where country like user_name_country;
end$$
DELIMITER ;
DELIMITER $$
create procedure sort_by_name()
begin 
select * 
from users
order by name;
end$$
DELIMITER ;
call sort_by_name;