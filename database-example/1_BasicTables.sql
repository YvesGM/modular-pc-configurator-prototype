-- Phase 3 - Database Schema
-- Pricing-Details
CREATE TABLE
    currencies (
        id INT AUTO_INCREMENT PRIMARY KEY,
        code VARCHAR(3) NOT NULL,
        symbol VARCHAR(5),
        name VARCHAR(50),
        exchange_rate DECIMAL(5, 2) NOT NULL,
        is_base BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    tax_classes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    tax_rates (
        id INT AUTO_INCREMENT PRIMARY KEY,
        tax_class_id INT NOT NULL,
        country_code VARCHAR(2) NOT NULL,
        rate DECIMAL(5, 2) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (tax_class_id) REFERENCES tax_classes (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

-- Components
CREATE TABLE
    component_categories (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    component_types (
        id INT AUTO_INCREMENT PRIMARY KEY,
        category_id INT NOT NULL,
        name VARCHAR(255) NOT NULL,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (category_id) REFERENCES component_categories (id) ON DELETE CASCADE
    );

CREATE TABLE
    components (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        type_id INT NOT NULL,
        brand VARCHAR(255),
        model VARCHAR(255),
        net_price DECIMAL(10, 2) NOT NULL,
        currency_id INT NOT NULL,
        tax_class_id INT NOT NULL,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (type_id) REFERENCES component_types (id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (currency_id) REFERENCES currencies (id) ON DELETE RESTRICT ON UPDATE CASCADE,
        FOREIGN KEY (tax_class_id) REFERENCES tax_classes (id) ON DELETE RESTRICT ON UPDATE CASCADE
    );

CREATE TABLE
    attribute_definitions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        attribute_name VARCHAR(255) NOT NULL,
        attribute_unit VARCHAR(50),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    component_attributes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        component_id INT NOT NULL,
        attribute_id INT NOT NULL,
        attribute_value VARCHAR(255),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (component_id) REFERENCES components (id) ON DELETE CASCADE,
        FOREIGN KEY (attribute_id) REFERENCES attribute_definitions (id) ON DELETE CASCADE
    );

-- Discounts
CREATE TABLE
    promotions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        discount_type VARCHAR(50),
        discount_value DECIMAL(10, 2),
        start_date DATETIME,
        end_date DATETIME,
        active BOOLEAN DEFAULT TRUE
    );

CREATE TABLE
    promotion_components (
        id INT AUTO_INCREMENT PRIMARY KEY,
        promotion_id INT,
        component_id INT,
        FOREIGN KEY (promotion_id) REFERENCES promotions (id) ON DELETE CASCADE,
        FOREIGN KEY (component_id) REFERENCES components (id) ON DELETE CASCADE
    );

-- Compatibility Rules
CREATE TABLE
    compatibility_rules (
        id INT AUTO_INCREMENT PRIMARY KEY,
        component_type_a INT NOT NULL,
        component_type_b INT NOT NULL,
        attribute_a INT NOT NULL,
        attribute_b INT NOT NULL,
        rule_type ENUM('equals','less_equal','greater_equal') NOT NULL,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (component_type_a) REFERENCES component_types (id),
        FOREIGN KEY (component_type_b) REFERENCES component_types (id),
        FOREIGN KEY (attribute_a) REFERENCES attribute_definitions (id),
        FOREIGN KEY (attribute_b) REFERENCES attribute_definitions (id)
    );

-- Configurations
CREATE TABLE
    configurations (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description TEXT,
        total_price DECIMAL(10, 2) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE
    configuration_components (
        id INT AUTO_INCREMENT PRIMARY KEY,
        configuration_id INT NOT NULL,
        component_id INT NOT NULL,
        quantity INT DEFAULT 1,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (configuration_id) REFERENCES configurations (id) ON DELETE CASCADE,
        FOREIGN KEY (component_id) REFERENCES components (id) ON DELETE CASCADE
    );