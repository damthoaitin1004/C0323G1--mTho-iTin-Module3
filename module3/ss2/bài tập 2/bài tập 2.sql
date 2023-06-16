create database sales_manager;
use sales_manager;
CREATE TABLE customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(45),
    cAge INT
);
CREATE TABLE older (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATE,
    oTotalPrice DOUBLE,
    FOREIGN KEY (cID)
        REFERENCES customer (cID)
);
CREATE TABLE product (
    pID INT PRIMARY KEY,
    pName VARCHAR(45),
    pPrice DOUBLE
);

CREATE TABLE order_detail ( 
    oID INT,
    pID INT,
    odQTY VARCHAR(20),
    FOREIGN KEY (oID)
        REFERENCES older (oID),
    FOREIGN KEY (pID)
        REFERENCES product (pID),
   PRIMARY KEY (oID , pID)
);
