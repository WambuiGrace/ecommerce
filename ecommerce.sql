-- CREATING A NEW DATABASE
-- CREATE DATABASE EcommerceDB;
USE ecommerceDB;

-- CREATING TABLES

 CREATE TABLE brand (
  brand_id INT PRIMARY KEY AUTO_INCREMENT,
  brand_name VARCHAR(100) NOT NULL
);

CREATE TABLE product_category (
  product_category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(100) NOT NULL
);

CREATE TABLE size_category (
  size_category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(100) NOT NULL
);

CREATE TABLE size_option (
  size_option_id INT PRIMARY KEY AUTO_INCREMENT,
  size_label VARCHAR(100) NOT NULL,
  size_category_id INT NOT NULL
);

CREATE TABLE color (
  color_id INT PRIMARY KEY AUTO_INCREMENT,
  color_name VARCHAR(100) NOT NULL,
  hex_value VARCHAR(10)
);

CREATE TABLE product (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  description VARCHAR(300),
  base_price DECIMAL(10, 2) NOT NULL,
  brand_id INT NOT NULL,
  product_category_id INT NOT NULL
);

CREATE TABLE product_variation (
  variation_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT NOT NULL,
  size_option_id INT NOT NULL,
  color_id INT NOT NULL
);

CREATE TABLE product_item (
  item_id INT PRIMARY KEY AUTO_INCREMENT,
  stock_quantity INT NOT NULL,
  price_override DECIMAL(10, 2),
  variation_id INT NOT NULL
);

CREATE TABLE product_image (
  image_id INT PRIMARY KEY AUTO_INCREMENT,
  image_url VARCHAR(300),
  product_id INT NOT NULL
);

CREATE TABLE attribute_type (
  attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
  attribute_type_name VARCHAR(100) NOT NULL
);

CREATE TABLE attribute_category (
  attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
  attribute_category_name VARCHAR(100) NOT NULL
);

CREATE TABLE product_attribute (
  product_attribute_id INT PRIMARY KEY AUTO_INCREMENT,
  product_attribute_name VARCHAR(100) NOT NULL,
  product_attribute_value VARCHAR(100),
  product_id INT NOT NULL,
  attribute_type_id INT NOT NULL,
  attribute_category_id INT NOT NULL
);

-- FOREIGN KEYS

ALTER TABLE product
  ADD CONSTRAINT fk_product_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  ADD CONSTRAINT fk_product_category FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);

ALTER TABLE size_option
  ADD CONSTRAINT fk_size_option_category FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id);

ALTER TABLE product_variation
  ADD CONSTRAINT fk_variation_product FOREIGN KEY (product_id) REFERENCES product(product_id),
  ADD CONSTRAINT fk_variation_size_option FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
  ADD CONSTRAINT fk_variation_color FOREIGN KEY (color_id) REFERENCES color(color_id);

ALTER TABLE product_item
  ADD CONSTRAINT fk_item_variation FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id);

ALTER TABLE product_image
  ADD CONSTRAINT fk_image_product FOREIGN KEY (product_id) REFERENCES product(product_id);

ALTER TABLE product_attribute
  ADD CONSTRAINT fk_attribute_product FOREIGN KEY (product_id) REFERENCES product(product_id),
  ADD CONSTRAINT fk_attribute_type FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id),
  ADD CONSTRAINT fk_attribute_category FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id);