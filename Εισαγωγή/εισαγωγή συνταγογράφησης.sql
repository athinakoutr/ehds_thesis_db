USE ehds_thesis_db;

SELECT * FROM MEDICATION_PRESCRIPTION;

-- 7. Εισαγωγή Συνταγογράφησης (Medication Prescription)
INSERT INTO MEDICATION_PRESCRIPTION (
    prescription_id, med_summary_id, dosage_id, hp_id, 
    status_code, quantity_prescribed, quantity_unit, subst_allowed
)
VALUES (10, 11, 12, 13, 'active', 30.00, 'tablet', TRUE);