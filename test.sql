-- Insert data into brand
INSERT INTO brand (brand_name) VALUES 
('Nike'),
('Adidas'),
('Puma'),
('Reebok');

-- Insert data into product_category
INSERT INTO product_category (category_name) VALUES 
('Shoes'),
('Clothing'),
('Accessories');

-- Insert data into size_category
INSERT INTO size_category (category_name) VALUES 
('Footwear Sizes'),
('Clothing Sizes');

-- Insert data into size_option
INSERT INTO size_option (size_label, size_category_id) VALUES 
('Small', 2),
('Medium', 2),
('Large', 2),
('8', 1),
('9', 1),
('10', 1);

-- Insert data into color
INSERT INTO color (color_name, hex_value) VALUES 
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Green', '#00FF00'),
('Black', '#000000'),
('White', '#FFFFFF');

-- Insert data into product
INSERT INTO product (name, description, base_price, brand_id, product_category_id) VALUES 
('Running Shoes', 'Comfortable running shoes', 59.99, 1, 1),
('Sports T-Shirt', 'Breathable sports t-shirt', 19.99, 2, 2),
('Baseball Cap', 'Stylish baseball cap', 14.99, 3, 3);

-- Insert data into product_variation
INSERT INTO product_variation (product_id, size_option_id, color_id) VALUES 
(1, 4, 1),
(1, 5, 2),
(2, 2, 3),
(3, 3, 4);

-- Insert data into product_item
-- Insert missing data into product_variation
INSERT INTO product_variation (variation_id, product_id, size_option_id, color_id) VALUES
(1, 1, 4, 1),
(2, 1, 5, 2),
(3, 2, 2, 3),
(4, 3, 3, 4);

-- Insert data into product_image
INSERT INTO product_image (image_url, product_id) VALUES 
('https://example.com/images/running_shoes.jpg', 1),
('https://example.com/images/sports_tshirt.jpg', 2),
('https://example.com/images/baseball_cap.jpg', 3);

-- Insert data into attribute_type
INSERT INTO attribute_type (attribute_type_name) VALUES 
('Material'),
('Feature');

-- Insert data into attribute_category
INSERT INTO attribute_category (attribute_category_name) VALUES 
('Performance'),
('Style');

-- Insert data into product_attribute
INSERT INTO product_attribute (product_attribute_name, product_attribute_value, product_id, attribute_type_id, attribute_category_id) VALUES 
('Material', 'Mesh', 1, 1, 1),
('Feature', 'Waterproof', 1, 2, 1),
('Material', 'Cotton', 2, 1, 2),
('Feature', 'Adjustable', 3, 2, 2);

SELECT * FROM brand;
SELECT * FROM product_category;
SELECT * FROM color;
SELECT * FROM product;

-- Get all product variations with their product names, sizes, and colors
SELECT 
    pv.variation_id,
    p.name AS product_name,
    so.size_label AS size,
    c.color_name AS color
FROM product_variation pv
JOIN product p ON pv.product_id = p.product_id
JOIN size_option so ON pv.size_option_id = so.size_option_id
JOIN color c ON pv.color_id = c.color_id;

-- Check Attributes for Each Product
SELECT 
    pa.product_attribute_name,
    pa.product_attribute_value,
    p.name AS product_name,
    at.attribute_type_name,
    ac.attribute_category_name
FROM product_attribute pa
JOIN product p ON pa.product_id = p.product_id
JOIN attribute_type at ON pa.attribute_type_id = at.attribute_type_id
JOIN attribute_category ac ON pa.attribute_category_id = ac.attribute_category_id;

-- Check Images for Each Product
SELECT 
    pi.image_url,
    p.name AS product_name
FROM product_image pi
JOIN product p ON pi.product_id = p.product_id;