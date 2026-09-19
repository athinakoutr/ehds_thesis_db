CREATE TABLE PREGNANCY_HISTORY (
    pregn_history_id INT AUTO_INCREMENT,
    patient_id INT NOT NULL,
    gener_narr TEXT NULL,
    section_note TEXT NULL,
    curr_status_code VARCHAR(100) NULL,
    curr_status_display VARCHAR(255) NULL,
    date_of_status DATETIME NULL,
    expected_date_of_delivery DATE NULL,
    gestational_age_value DECIMAL(5,2) NULL,
    gestational_age_unit VARCHAR(50) NULL,
    curr_pregn_note TEXT NULL,
    CONSTRAINT PK_PREGNANCY_HISTORY PRIMARY KEY (pregn_history_id),
    CONSTRAINT FK_PREGN_HIST_PATIENT FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;