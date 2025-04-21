
-- CREATE DATABASE ECOMMERCE
CREATE DATABASE Ecommmerce;
USE Ecommmerce;
-- ADD TABLES TO THE DATABASE
CREATE TABLE product_image(
image_id INT PRIMARY KEY AUTO_INCREMENT,
img_url VARCHAR(200)
);

CREATE TABLE Product_Variation(
variation_id INT PRIMARY KEY AUTO_INCREMENT
);

 CREATE TABLE Color(
 color_id INT PRIMARY KEY AUTO_INCREMENT,
 color_name VARCHAR(100),
 hex_value INT
 );
 CREATE TABLE Product(
 product_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(200),
 description VARCHAR(300),
 base_price DECIMAL(10,2)
 );

 CREATE TABLE product_item(
 item_id INT PRIMARY KEY AUTO_INCREMENT,
 Stock_quantity INT,
 price_override DECIMAL(10,2)
 );
 
 CREATE TABLE size_option(
 size_option_id INT PRIMARY KEY AUTO_INCREMENT,
 size_label VARCHAR (100)
 );

  CREATE TABLE brand(
  brand_id INT PRIMARY KEY AUTO_INCREMENT,
  brand_name VARCHAR(100)
  );
   CREATE TABLE product_category(
   product_category_id INT PRIMARY KEY AUTO_INCREMENT,
   category_name VARCHAR(100)
   );
   CREATE TABLE size_category(
   size_category_id INT PRIMARY KEY AUTO_INCREMENT,
   category_name VARCHAR (100)
   );
   CREATE TABLE attribute_type(
   attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
   attribute_type_name VARCHAR (100)
   );
   CREATE TABLE product_attribute(
   product_attribute_id INT PRIMARY KEY AUTO_INCREMENT,
   product_attribute_name VARCHAR (100),
   product_attribute_value INT
   );

   CREATE TABLE attribute_category(
   attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
   attribute_category_name VARCHAR(100)
   );
   -- ALTER THE TABLES TO ADD FOREIGN KEYS 
   ALTER TABLE Product
   ADD COLUMN brand_id INT,
   ADD CONSTRAINT fk_brand
   FOREIGN KEY (brand_id)
   REFERENCES brand(brand_id);
   
   ALTER TABLE Product
   ADD COLUMN product_category_id INT,
   ADD CONSTRAINT fk_product_category
   FOREIGN KEY (product_category_id)
   REFERENCES product_category(product_category_id);
   
   ALTER TABLE Product_item
   ADD COLUMN variation_id INT,
   ADD CONSTRAINT fk_product_variation
   FOREIGN KEY (variation_id)
   REFERENCES product_variation(variation_id);
   
   ALTER TABLE size_option
   ADD COLUMN size_category_id INT,
   ADD CONSTRAINT fk_product_variation
   FOREIGN KEY (size_category_id)
   REFERENCES product_variation(size_id);

   ALTER TABLE Product_variation
   ADD COLUMN product_id INT,
   ADD CONSTRAINT fk_product
   FOREIGN KEY (product_id)
   REFERENCES product(product_id);
   
  ALTER TABLE size_option
  ADD COLUMN size_category_id INT,
  ADD CONSTRAINT fk_size_category
  FOREIGN KEY (size_category_id)
  REFERENCES size_category(size_category_id);
  ALTER TABLE product_variation
  ADD COLUMN color_id INT,
  ADD CONSTRAINT fk_color
  FOREIGN KEY (color_id)
  REFERENCES color(color_id);
 

  ALTER TABLE product_image 
  ADD COLUMN product_id INT,
  ADD CONSTRAINT fk_product_image_product 
  FOREIGN KEY (product_id) 
  REFERENCES product(product_id);

  ALTER TABLE product_attribute
  ADD COLUMN attribute_category_id INT,
  ADD CONSTRAINT fk_attribute_category
  FOREIGN KEY (attribute_category_id) 
  REFERENCES attribute_category(attribute_category_id);

  ALTER TABLE product_attribute
  ADD COLUMN attribute_type_id INT,
  ADD CONSTRAINT fk_attribute_type
  FOREIGN KEY (attribute_type_id) 
  REFERENCES attribute_type(attribute_type_id);

  ALTER TABLE product_attribute
  ADD COLUMN product_id INT,
  ADD CONSTRAINT fk_product_attribute_category
  FOREIGN KEY (product_id) 
  REFERENCES product(product_id);

  ALTER TABLE size_option
  RENAME COLUMN size_option_id TO size_id; -- rename column 

  ALTER TABLE product_variation
  ADD COLUMN size_id INT,
  ADD CONSTRAINT fk_product_size_option
  FOREIGN KEY (size_id) 
  REFERENCES size_option(size_id);