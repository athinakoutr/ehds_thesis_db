CREATE DATABASE ehds_thesis_db;
USE ehds_thesis_db;

CREATE TABLE PATIENT (
    patient_id INT AUTO_INCREMENT,
    national_id VARCHAR(50) NULL,
    name_preferix VARCHAR(50) NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    name_suffix VARCHAR(50) NULL,
    display_name VARCHAR(255) NULL,
    name_use VARCHAR(50) NULL,
    birth_date DATE NOT NULL,
    gender_code VARCHAR(50) NOT NULL,
    gender_display VARCHAR(100) NULL,
    is_deceased BOOLEAN DEFAULT FALSE,
    death_date DATETIME NULL,
    addr_street VARCHAR(150) NULL,
    addr_num VARCHAR(20) NULL,
    addr_postbox VARCHAR(50) NULL,
    addr_city VARCHAR(100) NULL,
    addr_zip VARCHAR(20) NULL,
    addr_country VARCHAR(100) NULL,
    addr_display_text VARCHAR(255) NULL,
    addr_use VARCHAR(50) NULL,
    addr_type VARCHAR(50) NULL,
    phone_contact VARCHAR(50) NULL,
    phone_use VARCHAR(50) NULL,
    email_contact VARCHAR(100) NULL,
    email_use VARCHAR(50) NULL,
    preferred_language VARCHAR(50) NULL,
    preferred_language_display VARCHAR(100) NULL,
    CONSTRAINT PK_PATIENT PRIMARY KEY (patient_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;