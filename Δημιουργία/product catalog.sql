CREATE TABLE PRODUCT_CATALOG (
    product_id INT AUTO_INCREMENT,
    identifying_code VARCHAR(100) NULL,
    product_name VARCHAR(255) NOT NULL,
    classification_atc VARCHAR(50) NULL,
    description TEXT NULL,
    item_dose_form VARCHAR(100) NULL,
    active_substances VARCHAR(255) NULL,
    is_active_ing BOOLEAN NULL,
    strength_info VARCHAR(100) NULL,
    basis_of_strength VARCHAR(100) NULL,
    unit_presentation VARCHAR(100) NULL,
    contained_quant DECIMAL(10,2) NULL,
    total_amount DECIMAL(10,2) NULL,
    package_type VARCHAR(100) NULL,
    char_type VARCHAR(100) NULL,
    char_value VARCHAR(255) NULL,
    CONSTRAINT PK_PRODUCT_CATALOG PRIMARY KEY (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;