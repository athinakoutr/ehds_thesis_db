USE ehds_thesis_db;

-- 3. Εισαγωγή Clinical Statement (Κεντρικός πίνακας κλινικών συμβάντων)
INSERT INTO CLINICAL_STATEMENT (statement_id, patient_id, encounter_id, statement_type)
VALUES (2, 1, NULL, 'Diagnostic & Medication Record');

SELECT * FROM CLINICAL_STATEMENT;