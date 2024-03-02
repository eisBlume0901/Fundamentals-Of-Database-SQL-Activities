CREATE DATABASE anecito_coffees_db;
USE anecito_coffees_db;
CREATE TABLE IF NOT EXISTS coffees(
  id INT AUTO_INCREMENT,
  coffee_code VARCHAR(5) UNIQUE NOT NULL,
  coffee_name VARCHAR(50) UNIQUE NOT NULL,
  supplier_code VARCHAR(5) NOT NULL,
  quantity_stock INT NOT NULL,
  PRIMARY KEY(id)
)
-- DROP TABLE coffees;

INSERT INTO coffees (coffee_code, coffee_name, supplier_code, quantity_stock) 
VALUES ('C001', 'Fruity', 'S001', 3),
('C002', 'Caffè_Mocha', 'S001', 5),
('C003', 'Dark_Roast', 'S002', 10),
('C004', 'Decaf', 'S002', 10),
('C005', 'Arabica', 'S003', 7),
('C006', 'Frapuccino', 'S002', 15),
('C007', 'Café_Au_Lait', 'S004', 5),
('C008', 'Espresso', 'S005', 15);

DROP TABLE suppliers;

CREATE TABLE IF NOT EXISTS suppliers(
	id INT AUTO_INCREMENT,
    supplier_code VARCHAR(5) UNIQUE NOT NULL,
    supplier_name VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY(id) REFERENCES coffees(id),
    PRIMARY KEY(id)
);

ALTER TABLE suppliers
ADD COLUMN phone VARCHAR(11);

INSERT INTO suppliers(supplier_code, supplier_name, address) 
VALUES ('S001', 'Perky_Beans', '18, place Bernard Pasquier'),
('S002', 'Jolly_Java', '32 rue Leconte'),
('S003', 'Gourmet_Grounds','avenue Roche'),
('S004', 'Aroma_Addicts', '6, chemin Sylvie Guyot');

UPDATE suppliers
SET phone = '0288778329'
WHERE id = 1;

UPDATE suppliers
SET phone = '0452769642'
WHERE id = 2;

UPDATE suppliers
SET phone = '0138374275'
WHERE id = 3;

UPDATE suppliers
SET phone = '0762540703'
WHERE id = 4;

UPDATE suppliers
SET phone = '0775081968'
WHERE id = 5;

UPDATE suppliers
SET phone = '0829126869'
WHERE id = 6;

-- INNER JOIN
SELECT s.id, c.supplier_code, s.supplier_name, s.address, s.phone FROM coffees c
JOIN suppliers s ON c.supplier_code = s.supplier_code
GROUP BY s.supplier_code;

-- LEFT JOIN
SELECT c.id, c.supplier_code AS coffees_supplier_code, s.supplier_code AS suppliers_supplier_code,
 s.supplier_name, s.address, s.phone FROM coffees c
LEFT JOIN suppliers s ON c.supplier_code = s.supplier_code
GROUP BY c.supplier_code;

INSERT INTO suppliers (supplier_code, supplier_name, address)
VALUES ('S006', 'The_Coffee_Collective', '838, place Véronique Moulin')

-- RIGHT JOIN
SELECT s.id, c.supplier_code AS coffees_supplier_code, s.supplier_code AS suppliers_supplier_code,
 s.supplier_name, s.address, s.phone FROM coffees c
RIGHT JOIN suppliers s ON c.supplier_code = s.supplier_code
GROUP BY s.supplier_code;

