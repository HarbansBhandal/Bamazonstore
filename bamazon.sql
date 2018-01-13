DROP DATABASE if exists bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
	item_id INT AUTO_INCREMENT,
	product_name VARCHAR(30) NOT NULL,  
	department_name VARCHAR(30) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock_quantity INT NOT NULL,
    product_sales DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (item_id)
);

CREATE TABLE departments(
	department_id INT AUTO_INCREMENT,
    department_name VARCHAR(30) NOT NULL,
    over_head_costs DECIMAL NOT NULL,
    PRIMARY KEY (department_id)
);

INSERT INTO departments(department_name, over_head_costs)
VALUES ('Electronics', 10000);

INSERT INTO departments(department_name, over_head_costs)
VALUES ('Lifestyle', 5000);

INSERT INTO departments(department_name, over_head_costs)
VALUES ('Pets', 3000);

INSERT INTO departments(department_name, over_head_costs)
VALUES ('Books', 100);

INSERT INTO departments(department_name, over_head_costs)
VALUES ('Drinks', 10);
-- ---------------------------------------

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Zelda 64', 'Electronics',300.00,5, 100);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Megaman', 'Electronics',500.00,4, 5000);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Pogo Stick', 'Lifestyle', 5.99, 3, 20);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Socks', 'Lifestyle', 12.99, 2, 10);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Google', 'Electronics', 39.99, 1, 0);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Water Bottle', 'Drinks', 3.99, 5, 0);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Harry Pothead', 'Books', 19.99, 150, 300);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Diablo', 'Lifestyle', 40, 120, 200);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('T-Rex', 'Pets', 499.99, 20, 10);

INSERT INTO products(product_name, department_name, price, stock_quantity, product_sales)
VALUES('Litness', 'Electronics', 70.99, 101, 100);
-- -----------------------------------------------------------

-- UPDATE products SET stock_quantity = stock_quantity + 1, product_sales = product_sales + 1 WHERE item_id = 1;

-- SELECT * FROM products WHERE stock_quantity <= 5;

SELECT * FROM departments;

SELECT * FROM products;

SELECT COUNT(department_name), department_name
FROM products
GROUP BY department_name;

SELECT * FROM products
LEFT JOIN departments ON products.department_name = departments.department_name;



