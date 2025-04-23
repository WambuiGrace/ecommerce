
CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;
 
 
-- create table brand
CREATE TABLE brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);


-- create table product cartegory
CREATE TABLE product_category (
    product_category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);


-- create table color
CREATE TABLE color (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL,
    hex_value VARCHAR(7)
);


-- create table sizec_cartegory
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);


-- create table attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY,
    attribute_type_name VARCHAR(100) NOT NULL
);


-- create table attribut_cartegory
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY,
    attribute_category_name VARCHAR(100) NOT NULL
);


-- create table product
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    base_price FLOAT(10,2),
    brand_id INT,
    product_category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id)
);


-- create table size_option
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY,
    size_category_id INT,
    size_label VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
    );


-- create table product_variation
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY,
    product_id INT,
    size_id INT,
    color_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);


-- create table product_item
CREATE TABLE product_item (
    item_id INT PRIMARY KEY,
    stock_quantity INT,
    price_override DECIMAL(10, 2),
    variation_id INT,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);


-- create table product_image
CREATE TABLE product_image (
    image_id INT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- create table product_attribute
CREATE TABLE product_attribute (
    product_attribute_id INT PRIMARY KEY,
    product_attribute_name VARCHAR(100),
    product_attribute_value VARCHAR(255),
    product_id INT,
    attribute_type_id INT,
    attribute_category_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);



INSERT INTO brand (brand_id, brand_name) VALUES
(1001, 'Bathu'),
(1002, 'Warra');


-- Insert into product_category
INSERT INTO product_category (product_category_id, category_name) VALUES
(2001, 'Shoes'),
(2002, 'T-Shirts');

-- Insert into color
INSERT INTO color (color_id, color_name, hex_value) VALUES
(3001, 'Black', '#000000'),
(3002, 'White', '#FFFFFF');

-- Insert into size_category
INSERT INTO size_category (size_category_id, category_name) VALUES
(4001, 'Footwear Size'),
(4002, 'Shirt Size');

-- Insert into size_option
INSERT INTO size_option (size_option_id, size_category_id, size_label) VALUES
(5001, 4001, 'US 9'),
(5002, 4001, 'US 10'),
(5003, 4002, 'M'),
(5004, 4002, 'L');

-- Insert into attribute_type
INSERT INTO attribute_type (attribute_type_id, attribute_type_name) VALUES
(6001, 'Material'),
(6002, 'Closure Type');

-- Insert into attribute_category
INSERT INTO attribute_category (attribute_category_id, attribute_category_name) VALUES
(7001, 'Men'),
(7002, 'Women');

-- Insert into product
INSERT INTO product (product_id, name, description, base_price, brand_id, product_category_id) VALUES
(8001, 'Bathu 2023', 'High-performance running shoe with ultra smooth cushioning', 120.00, 1001, 2001),
(8002, 'Warra Tee', 'Classic cotton T-shirt with Warra logo', 25.00, 1002, 2002);

-- Insert into product_variation
INSERT INTO product_variation (variation_id, product_id, size_id, color_id) VALUES
(9001, 8001, 5001, 3001),
(9002, 8001, 5002, 3002),
(9003, 8002, 5003, 3001);

-- Insert into product_item
INSERT INTO product_item (item_id, stock_quantity, price_override, variation_id) VALUES
(10001, 10, 115.00, 9001),
(10002, 5, NULL, 9002),
(10003, 15, 22.00, 9003);

-- Insert into product_image
INSERT INTO product_image (image_id, image_url, product_id) VALUES
(11001, 'https://example.com/images/Bathu2023_black.jpg', 8001),
(11002, 'https://example.com/images/Warra_tee_black.jpg', 8002);

-- Insert into product_attribute
INSERT INTO product_attribute (product_attribute_id, product_attribute_name, product_attribute_value, product_id, attribute_type_id, attribute_category_id) VALUES
(12001, 'Material', 'Mesh and Rubber', 8001, 6001, 7001),
(12002, 'Closure Type', 'Laces', 8001, 6002, 7001),
(12003, 'Material', '100% Cotton', 8002, 6001, 7002);


-- Insert into color table (including Brown)
INSERT INTO color (color_id, color_name, hex_value) VALUES
(3003, 'Brown', '#A52A2A');

-- Add new product: Bathu Jogger Trousers
 INSERT INTO product (product_id, name, description, base_price, brand_id, product_category_id) VALUES
 (8003, 'Bathu Jogger Trousers', 'Comfortable athletic joggers for everyday wear', 55.00, 1001, 2005);

-- DESCRIBE product_category;

-- Add new size options if not already existing (M, L)
-- (Reusing existing size_options: 5003 = 'M', 5004 = 'L')

-- Add new variations for joggers
INSERT INTO product_variation (variation_id, product_id, size_id, color_id) VALUES
(9004, 8003, 5003, 3001), -- Black, M
(9005, 8003, 5004, 3003); -- Brown, L

-- Add product items for variations
INSERT INTO product_item (item_id, stock_quantity, price_override, variation_id) VALUES
(10004, 12, NULL, 9004),
(10005, 7, NULL, 9005);

-- Add product image
INSERT INTO product_image (image_id, image_url, product_id) VALUES
(11003, 'https://example.com/images/Bathu_jogger_black.jpg', 8003);

-- Add attributes
INSERT INTO product_attribute (product_attribute_id, product_attribute_name, product_attribute_value, product_id, attribute_type_id, attribute_category_id) VALUES
(12004, 'Material', 'Polyester Blend', 8003, 6001, 7001),
(12005, 'Closure Type', 'Elastic Waistband', 8003, 6002, 7001);



-- update product_category table
 UPDATE product_category 
 SET category_name = 'Long trousers'
 WHERE product_category_id = 2005;

 INSERT INTO product_category
 (product_category_id, category_name)
 VALUES (2006, 'shorts');

-- retrieve everything on a color table
 SELECT *
 FROM color limit 5;

-- find products that have black color variation
SELECT 
    DISTINCT p.name AS product_name,
    c.color_name
FROM 
    product p
JOIN product_variation pv ON p.product_id = pv.product_id
JOIN color c ON pv.color_id = c.color_id
WHERE c.color_name = 'Black';

-- find products within a range
SELECT 
    product_id,
    name AS product_name,
    base_price
FROM 
    product
WHERE base_price BETWEEN 20 AND 100;

-- show products that are out of stock
SELECT 
    pi.item_id,
    p.name AS product_name,
    pi.stock_quantity
FROM 
    product_item pi
JOIN product_variation pv ON pi.variation_id = pv.variation_id
JOIN product p ON pv.product_id = p.product_id
WHERE pi.stock_quantity = 0;

SELECT 
    so.size_label,
    p.name AS product_name
FROM 
    product p
JOIN product_variation pv ON p.product_id = pv.product_id
JOIN size_option so ON pv.size_id = so.size_option_id
WHERE p.name = 'Bathu 2023';

