USE ehds_thesis_db;

DESCRIBE HEALTH_CONDITIONS;

SELECT * FROM HEALTH_CONDITIONS;

-- 4. Εισαγωγή Διάγνωσης (Health Condition)
INSERT INTO HEALTH_CONDITIONS (condition_id, statement_id, condition_code, clinical_status, verification_status, onset_date)
VALUES (10, 1, 'I10', 'active', 'confirmed', '2023-01-15 10:00:00');