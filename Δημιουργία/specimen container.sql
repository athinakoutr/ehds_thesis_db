CREATE TABLE SPECIMEN_CONTAINER (
    specimen_cont_id INT AUTO_INCREMENT,
    specimen_id INT NOT NULL,
    device_id INT NULL,
    quantity_value DECIMAL(10,3) NULL,
    quantity_comparator VARCHAR(10) NULL,
    quantity_unit VARCHAR(50) NULL,
    quantity_system VARCHAR(255) NULL,
    quantity_code VARCHAR(50) NULL,
    cont_type_code VARCHAR(100) NULL,
    cont_type_display VARCHAR(255) NULL,
    additive_code VARCHAR(100) NULL,
    additive_display VARCHAR(255) NULL,
    CONSTRAINT PK_SPECIMEN_CONTAINER PRIMARY KEY (specimen_cont_id),
    CONSTRAINT FK_SPEC_CONT_SPECIMEN FOREIGN KEY (specimen_id) REFERENCES SPECIMEN(specimen_id) ON DELETE CASCADE,
    CONSTRAINT FK_SPEC_CONT_DEVICE FOREIGN KEY (device_id) REFERENCES MEDICAL_DEVICES_AND_IMPLANTS(device_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;