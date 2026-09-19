CREATE TABLE ADVANCE_DIRECTIVE (
    ad_id INT AUTO_INCREMENT,
    statement_id INT NOT NULL,
    category VARCHAR(100) NULL,
    attachment_content_type VARCHAR(100) NULL,
    attachment_language VARCHAR(50) NULL,
    attachment_data LONGBLOB NULL,
    attachment_url VARCHAR(500) NULL,
    attachment_size INT NULL,
    attachment_title VARCHAR(255) NULL,
    attachment_creation_date DATETIME NULL,
    status VARCHAR(50) NULL,
    period_start DATETIME NULL,
    period_end DATETIME NULL,
    CONSTRAINT PK_ADVANCE_DIRECTIVE PRIMARY KEY (ad_id),
    CONSTRAINT FK_AD_STATEMENT FOREIGN KEY (statement_id) REFERENCES CLINICAL_STATEMENT(statement_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;