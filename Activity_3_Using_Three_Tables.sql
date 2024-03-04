CREATE DATABASE IF NOT EXISTS cafe_shop_ms;

DROP DATABASE IF EXISTS cafe_shop_ms;

USE cafe_shop_ms;

CREATE TABLE IF NOT EXISTS coffees (
    id INT AUTO_INCREMENT,
    coffee_code VARCHAR(5) UNIQUE NOT NULL,
    coffee_name VARCHAR(50) UNIQUE NOT NULL,
    supplier_code VARCHAR(5) NOT NULL,
    quantity_stock INT NOT NULL,
    sales INT,
    PRIMARY KEY (id)
);

INSERT INTO coffees (coffee_code, coffee_name, supplier_code, quantity_stock, sales)
VALUES
('C001', 'Cappuccino', 'S001', 100, 0),
('C002', 'Espresso', 'S006', 150, 0),
('C003', 'Latte', 'S002', 150, 0),
('C004', 'Mocha', 'S004', 100, 0),
('C005', 'Americano', 'S002', 75, 0),
('C006', 'Macchiato', 'S002', 100, 0),
('C007', 'Flat White', 'S004', 50, 0),
('C008', 'Long Black', 'S004', 50, 0),
('C009', 'Affogato', 'S001', 20, 0),
('C010', 'Ristretto', 'S005', 50, 0);

CREATE TABLE IF NOT EXISTS suppliers (
    id INT AUTO_INCREMENT,
    supplier_code VARCHAR(5) UNIQUE NOT NULL,
    supplier_name VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES coffees(id)
);

INSERT INTO suppliers (supplier_code, supplier_name, address, phone)
VALUES
('S001', 'Perky_Beans', '18, place Bernard Pasquier', '0460704772'),
('S002', 'Jolly_Java', '32 rue Leconte de Lisle', '0118081069'),
('S003', 'Gourmet_Grounds', '32 boulevard d''Alsace', '0196142374'),
('S004', 'The_Bean_Barn', '38 rue Saint Germain', '0326281043'),
('S005', 'The_Coffee_House', '51 Rue Frédéric Chopin', '0273470202');

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT,
    order_code VARCHAR(5) UNIQUE NOT NULL,
    coffee_code VARCHAR(5) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES coffees(id)
);

INSERT INTO orders (order_code, coffee_code, quantity, order_date)
VALUES
('O001', 'C001', 10, '2024-03-01'),
('O002', 'C009', 15, '2024-03-04'),
('O003', 'C009', 20, '2024-01-03'),
('O004', 'C001', 10, '2024-03-04'),
('O005', 'C005', 5, '2024-02-10'),
('O006', 'C004', 10, '2024-02-14'),
('O007', 'C003', 5, '2024-02-20'),
('O008', 'C008', 5, '2024-01-08'),
('O009', 'C002', 2, '2024-02-15'),
('O010', 'C002', 5, '2021-01-29');

-- FULL JOIN 3 TABLES
SELECT o.order_code, o.quantity AS order_quantity, c.coffee_code, c.coffee_name, s.supplier_code, s.supplier_name, c.quantity_stock
FROM orders o
        JOIN coffees c ON o.coffee_code = c.coffee_code
        JOIN suppliers s ON c.supplier_code = s.supplier_code
GROUP BY o.order_code;

-- LEFT JOIN 3 TABLES
SELECT o.order_code, o.quantity AS order_quantity, c.coffee_code, c.coffee_name, s.supplier_code, s.supplier_name, c.quantity_stock
FROM orders o
            LEFT JOIN coffees c ON o.coffee_code = c.coffee_code
            LEFT JOIN suppliers s ON c.supplier_code = s.supplier_code
GROUP BY o.order_code;
# There is no supplier information for the coffee Espresso with the code C002 despite there are total orders of 7.
# Therefore, its entry is null.

-- RIGHT JOIN 3 TABLES
SELECT o.order_code, o.quantity AS order_quantity, c.coffee_code, c.coffee_name, s.supplier_code, s.supplier_name, c.quantity_stock
FROM orders o
         RIGHT JOIN coffees c ON o.coffee_code = c.coffee_code
         RIGHT JOIN suppliers s ON c.supplier_code = s.supplier_code
GROUP BY o.order_code;
# There is no order information for the coffee Machiatto with the code C006 despite there are a total stock of 100;
