CREATE TABLE TRAVEL_HISTORY_COUNTRY (
    travel_country_id INT AUTO_INCREMENT,
    travel_history_id INT NOT NULL,
    country_code VARCHAR(10) NULL,
    country_display VARCHAR(255) NULL,
    period_start DATETIME NULL,
    period_end DATETIME NULL,
    CONSTRAINT PK_TRAVEL_HISTORY_COUNTRY PRIMARY KEY (travel_country_id),
    CONSTRAINT FK_TRAVEL_COUNTRY_HIST FOREIGN KEY (travel_history_id) REFERENCES TRAVEL_HISTORY(travel_history_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;