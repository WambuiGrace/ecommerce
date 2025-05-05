Collecting workspace information# E-commerce Database System

## Overview

This project implements a comprehensive database schema for an e-commerce application. It's designed to handle various product types with multiple variations (size, color) and detailed attribute tracking.

![ERD Diagram](ERD.svg)

## Database Structure

The database consists of the following tables:

### Core Tables
- **Product**: Stores basic product information
- **Brand**: Stores brand information
- **Product_Category**: Product classifications
- **Product_Variation**: Specific product combinations of size and color
- **Product_Item**: Individual inventory items with stock levels
- **Product_Image**: Images associated with products

### Attribute Tables
- **Attribute_Type**: Types of product attributes (Material, Feature, etc.)
- **Attribute_Category**: Categories for attributes (Performance, Style, etc.)
- **Product_Attribute**: Specific attributes for products

### Sizing and Color Tables
- **Size_Category**: Categories for sizes (Footwear, Clothing, etc.)
- **Size_Option**: Specific size options within categories
- **Color**: Color information with name and hex value

## Getting Started

1. Create a MySQL database:
```sql
CREATE DATABASE EcommerceDB;
```

2. Run the schema creation script:
```sql
mysql -u username -p EcommerceDB < ecommerce.sql
```

3. Populate with test data:
```sql
mysql -u username -p EcommerceDB < test.sql
```

## Features

- **Flexible Product Structure**: Supports different product types with various attributes
- **Complex Variations**: Handles multiple variations of the same product (size/color)
- **Inventory Management**: Tracks stock at the specific variation level
- **Rich Attribute System**: Custom attributes organized by type and category
- **Image Support**: Multiple images per product

## Example Queries

The test.sql file includes sample queries:

- List all product variations with their details
- View attributes for each product
- View images for each product

## Schema Design

The database follows a normalized design with:
- Clear separation of products, variations, and inventory items
- Hierarchical organization of attributes
- Flexible sizing system that supports different product categories

## Entity Relationship Diagram

The database schema is visualized in the included ERD.svg file, created with draw.io.