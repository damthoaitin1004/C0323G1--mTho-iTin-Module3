create database Furama;
use Furama;
create table location(
local_code int primary key,
local_name varchar(45)
);
create table levels(
levels_code int primary key,
levels_name varchar(45)
);
create table parts(
parts_code int primary key,
parts_name varchar(45)
);
create table employee(
employee_code int primary key,
employee_name varchar(45) not null,
employee_birth date not null,
employee_identity_number varchar(45) not null,
employee_price double not null,
employee_phone_number varchar(45) not null,
employee_email varchar(45),
employee_address varchar(45),
local_code int,
levels_code int,
parts_code int,
foreign key (local_code) references location (local_code),
foreign key (levels_code) references levels (levels_code),
foreign key (parts_code) references parts(parts_code)
);
create table customer_type(
customer_type_code int primary key,
customer_type_name varbinary(45)
);
create table customer(
customer_code int primary key,
customer_name varchar(45) not null,
customer_birth varchar(45) not null,
customer_gender bit(1) not null,
customer_identity varchar(45) not null,
customer_phone_number varchar(45) not null,
customer_email varchar(45),
customer_address varchar(45),
customer_type_code int,
foreign key (customer_type_code) references customer_type(customer_type_code)
);
create table service_type(
service_type_code int primary key,
service_type_name varchar(45)
);
create table rental_type(
rental_type_code int primary key,
rental_type_name varchar(45)
);
create table service(
service_code int primary key,
service_name varchar(45) not null,
service_area int,
rental_costs double not null,
maximum_people int,
service_type_code int,
rental_type_code int,
foreign key (service_type_code) references service_type(service_type_code),
foreign key (rental_type_code) references rental_type(rental_type_code),
room_standard varchar(45),
Description_of_amenities varchar(45),
area_pool double,
number_floor int
);
create table contract(
contract_code int primary key,
contract_start date not null,
contract_end date not null,
contract_money double not null,
customer_code int,
employee_code int,
service_code int,
foreign key (customer_code) references customer(customer_code),
foreign key (employee_code) references employee(employee_code),
foreign key (service_code) references service(service_code)
);
create table Accompanied_service(
Accompanied_service_code int primary key,
Accompanied_service_name varchar(45) not null,
Accompanied_service_price double not null,
Accompanied_service_unit varchar(10) not null,
Accompanied_service_status varchar(45)
);
create table detailed_contract(
detailed_contract_code int primary key,
contract_code int,
Accompanied_service_code int,
foreign key (contract_code) references contract(contract_code),
foreign key (Accompanied_service_code) references Accompanied_service(Accompanied_service_code),
detailed_contract_number int not null
);





