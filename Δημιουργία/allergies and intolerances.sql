CREATE TABLE ALLERGIES_AND_INTOLERANCES (
    al_int_id INT AUTO_INCREMENT,
    statement_id INT NOT NULL,
    agent_code VARCHAR(100) NULL,
    agent_display VARCHAR(255) NULL,
    clinical_status VARCHAR(50) NULL,
    verification_status VARCHAR(50) NULL,
    criticality VARCHAR(50) NULL,
    onset_date DATETIME NULL,
    end_date DATETIME NULL,
    manifestation_code VARCHAR(100) NULL,
    manifestation_display VARCHAR(255) NULL,
    reaction_severity VARCHAR(50) NULL,
    CONSTRAINT PK_ALLERGIES_AND_INTOLERANCES PRIMARY KEY (al_int_id),
    CONSTRAINT FK_ALLERGIES_STATEMENT FOREIGN KEY (statement_id) REFERENCES CLINICAL_STATEMENT(statement_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;