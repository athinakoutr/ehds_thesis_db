CREATE TABLE OBSERVATION_COMPONENT (
    component_id INT AUTO_INCREMENT,
    obs_result_id INT NOT NULL,
    type_code VARCHAR(100) NULL,
    type_display VARCHAR(255) NULL,
    original_name VARCHAR(255) NULL,
    result_string TEXT NULL,
    quant_value DECIMAL(15,4) NULL,
    quant_unit VARCHAR(50) NULL,
    result_code VARCHAR(100) NULL,
    result_display VARCHAR(255) NULL,
    uncertainty_value DECIMAL(10,4) NULL,
    uncertainty_type_code VARCHAR(100) NULL,
    data_absent_reason_code VARCHAR(100) NULL,
    data_absent_reason_display VARCHAR(255) NULL,
    CONSTRAINT PK_OBSERVATION_COMPONENT PRIMARY KEY (component_id),
    CONSTRAINT FK_OBS_COMP_RESULT FOREIGN KEY (obs_result_id) REFERENCES OBSERVATION_RESULTS(obs_result_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;