USE fundamentalsofdatabase_db;
CREATE DATABASE IF NOT EXISTS fundamentalsofdatabase_db;
DROP DATABASE fundamentalsOfdatabase_db;
DROP TABLE orders;
TRUNCATE TABLE orders;
DROP TABLE customers;
TRUNCATE TABLE customers;
DROP TABLE purchases;

CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customerId VARCHAR(5) UNIQUE NOT NULL,
    name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    orderCode VARCHAR(255) NOT NULL,
    purchaseCode VARCHAR(255) NOT NULL
);

INSERT INTO customers (name, customerId, email, orderCode, purchaseCode)
VALUES ('Amelia Watson', 'C1','ameliawatson@yahoo.com', 'O1,O2,O3', 'P1,P2,P3'),
       ('Emerald Greenleaf','C2','emeraldgreenleaf@yahoo.com', '04,05,O6', 'P1,P2,P4,P5'),
       ('Mary Claire Ethereal', 'C3', 'maryethereal@protonmail.com', '09,010,019', 'P6,P9');

CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customerId VARCHAR(5) NOT NULL,
    orderCode VARCHAR(5) NOT NULL
);

ALTER TABLE orders
ADD FOREIGN KEY (customerId) REFERENCES customers(customerId);

# INSERT INTO orders (id, customerId, orderCode)
# VALUES (1, 'C1', 'O1'),
#        (2, 'C1', 'O2'),
#        (3, 'C1', 'O3'),
#        (4, 'C2', 'O4'),
#        (5, 'C2', 'O5'),
#        (6, 'C2', 'O6'),
#        (7, 'C3', 'O9'),
#        (8, 'C3', 'O10'),
#        (9, 'C3', 'O19');


INSERT INTO orders (customerId, orderCode)
VALUES ('C1', 'O1'),
       ('C1', 'O2'),
       ('C1', 'O3'),
       ('C2', 'O4'),
       ('C2', 'O5'),
       ('C2', 'O6'),
       ('C3', 'O9'),
       ('C3', 'O10'),
       ('C3', 'O19');

CREATE TABLE IF NOT EXISTS purchases (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customerId VARCHAR(5) NOT NULL,
    purchaseCode VARCHAR(5) NOT NULL,
    FOREIGN KEY (customerId) REFERENCES customers(customerId)
 );

#     INSERT INTO purchases (customerId, purchaseCode)
#     VALUES (1, 'C1', 'P1'),
#            (2, 'C1', 'P2'),
#            (3, 'C1', 'P3'),
#            (4, 'C2', 'P1'),
#            (5, 'C2', 'P2'),
#            (6, 'C2', 'P4'),
#            (7, 'C2', 'P5'),
#            (8, 'C3', 'P6'),
#            (9, 'C3', 'P9');

INSERT INTO purchases (customerId, purchaseCode)
VALUES ('C1', 'P1'),
       ('C1', 'P2'),
       ('C1', 'P3'),
       ('C2', 'P1'),
       ('C2', 'P2'),
       ('C2', 'P4'),
       ('C2', 'P5'),
       ('C3', 'P6'),
       ('C3', 'P9');


SELECT orderCode, COUNT(orderCode)
FROM orders
GROUP BY orderCode
ORDER BY orderCode ASC;

SELECT purchaseCode, COUNT(purchaseCode)
FROM purchases
GROUP BY purchaseCode
ORDER BY purchaseCode DESC;