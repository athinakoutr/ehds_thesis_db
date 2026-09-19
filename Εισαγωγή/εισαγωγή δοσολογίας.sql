USE ehds_thesis_db;

SELECT * FROM DOSAGE_DETAILS;
-- 6. Εισαγωγή Δοσολογίας (Dosage Details)
INSERT INTO DOSAGE_DETAILS (dosage_id, med_summary_id, dose_value, dose_unit_code, as_needed)
VALUES (4, 1, 1.0, 'tablet', FALSE);

DESCRIBE DOSAGE_DETAILS;