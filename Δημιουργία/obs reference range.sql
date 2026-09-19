CREATE TABLE OBS_REFERENCE_RANGE (
    range_id INT AUTO_INCREMENT,
    component_id INT NULL,
    obs_result_id INT NULL,
    low_value DECIMAL(15,4) NULL,
    high_value DECIMAL(15,4) NULL,
    unit VARCHAR(50) NULL,
    normal_value_code VARCHAR(100) NULL,
    normal_value_display VARCHAR(255) NULL,
    range_type_code VARCHAR(100) NULL,
    applies_to_code VARCHAR(100) NULL,
    gender VARCHAR(20) NULL,
    age_low DECIMAL(5,2) NULL,
    age_high DECIMAL(5,2) NULL,
    range_text TEXT NULL,
    CONSTRAINT PK_OBS_REFERENCE_RANGE PRIMARY KEY (range_id),
    CONSTRAINT FK_REF_RANGE_COMPONENT FOREIGN KEY (component_id) REFERENCES OBSERVATION_COMPONENT(component_id) ON DELETE CASCADE,
    CONSTRAINT FK_REF_RANGE_RESULT FOREIGN KEY (obs_result_id) REFERENCES OBSERVATION_RESULTS(obs_result_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;