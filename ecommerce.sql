
-- Create brand table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create product_category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Create product_image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(500) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(100) UNIQUE NOT NULL,
    hex_code CHAR(7)
);

-- Create size_category table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create size_option table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    size_label VARCHAR(50),
    description TEXT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Create product_item table
CREATE TABLE product_item (
    product_item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    quantity_in_stock INT DEFAULT 0,
    price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Create product_variation table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    variation_type VARCHAR(50),
    variation_value VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create attribute_category table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create attribute_type table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('text', 'number', 'boolean') NOT NULL
);

-- Create product_attribute table
CREATE TABLE product_attribute (
    product_attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
