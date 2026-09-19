CREATE TABLE BODY_STRUCTURE (
    body_site_id INT AUTO_INCREMENT,
    morphology VARCHAR(255) NULL,
    location VARCHAR(255) NULL,
    loc_qual VARCHAR(255) NULL,
    laterality VARCHAR(100) NULL,
    description TEXT NULL,
    CONSTRAINT PK_BODY_STRUCTURE PRIMARY KEY (body_site_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;