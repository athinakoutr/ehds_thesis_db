CREATE TABLE ALERTS (
    alert_id INT AUTO_INCREMENT,
    statement_id INT NOT NULL,
    alert_code VARCHAR(100) NULL,
    alert_display VARCHAR(255) NULL,
    description TEXT NULL,
    priority_code VARCHAR(50) NULL,
    priority_display VARCHAR(100) NULL,
    period_start DATETIME NULL,
    period_end DATETIME NULL,
    CONSTRAINT PK_ALERTS PRIMARY KEY (alert_id),
    CONSTRAINT FK_ALERTS_STATEMENT FOREIGN KEY (statement_id) REFERENCES CLINICAL_STATEMENT(statement_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;