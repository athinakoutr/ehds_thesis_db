CREATE TABLE IMAGING_STUDY_SERIES (
    series_id INT AUTO_INCREMENT,
    imag_study_id INT NOT NULL,
    series_uid VARCHAR(128) NULL,
    series_number INT NULL,
    modality_code VARCHAR(100) NULL,
    modality_display VARCHAR(255) NULL,
    description TEXT NULL,
    num_of_instances INT NULL,
    body_site_id INT NULL,
    started DATETIME NULL,
    CONSTRAINT PK_IMAGING_STUDY_SERIES PRIMARY KEY (series_id),
    CONSTRAINT FK_SERIES_IMAG_STUDY FOREIGN KEY (imag_study_id) REFERENCES IMAGING_STUDY(imag_study_id) ON DELETE CASCADE,
    CONSTRAINT FK_SERIES_BODY_SITE FOREIGN KEY (body_site_id) REFERENCES BODY_STRUCTURE(body_site_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;