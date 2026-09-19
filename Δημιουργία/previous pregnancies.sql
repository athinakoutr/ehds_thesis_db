CREATE TABLE PREVIOUS_PREGNANCIES (
    prev_pregn_id INT AUTO_INCREMENT,
    pregn_history_id INT NOT NULL,
    end_date DATE NULL,
    outcome_code VARCHAR(100) NULL,
    outcome_display VARCHAR(255) NULL,
    num_of_fetus INT NULL,
    note TEXT NULL,
    CONSTRAINT PK_PREVIOUS_PREGNANCIES PRIMARY KEY (prev_pregn_id),
    CONSTRAINT FK_PREV_PREGN_HIST FOREIGN KEY (pregn_history_id) REFERENCES PREGNANCY_HISTORY(pregn_history_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;