USE ehds_thesis_db;

DESCRIBE MEDICATION_SUMMARY;

SELECT * FROM MEDICATION_SUMMARY;

-- 5. Εισαγωγή Σύνοψης Φαρμακοθεραπείας (Medication Summary)
INSERT INTO MEDICATION_SUMMARY (med_summary_id, statement_id, product_id, summary_status)
VALUES (2, 1, NULL, 'active');