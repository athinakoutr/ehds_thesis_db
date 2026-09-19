CREATE TABLE IMAGING_STUDY (
    imag_study_id INT AUTO_INCREMENT,
    encounter_id INT NULL,
    org_id INT NOT NULL,
    procedure_id INT NULL,
    status VARCHAR(50) NOT NULL,
    started_at DATETIME NULL,
    number_of_series INT NULL,
    number_of_instances INT NULL,
    description TEXT NULL,
    CONSTRAINT PK_IMAGING_STUDY PRIMARY KEY (imag_study_id),
    CONSTRAINT FK_IMAG_STUDY_ENCOUNTER FOREIGN KEY (encounter_id) REFERENCES ENCOUNTER(encounter_id) ON DELETE SET NULL,
    CONSTRAINT FK_IMAG_STUDY_ORG FOREIGN KEY (org_id) REFERENCES ORGANISATION(org_id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;