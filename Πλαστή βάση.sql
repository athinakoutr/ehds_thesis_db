USE ehds_thesis_db;

-- 1. Βασικοί Πίνακες Αναφοράς (Lookups / Master Data)
INSERT IGNORE INTO ORGANISATION (org_id, org_identifier, org_name) 
VALUES (1, 'ORG-001', 'Γενικό Πανεπιστημιακό Νοσοκομείο');

INSERT IGNORE INTO HEALTH_PROFESSIONAL (hp_id, hp_identifier, first_name, last_name) 
VALUES (1, 'HP-100', 'Νικόλαος', 'Ιωαννίδης');

INSERT IGNORE INTO BODY_STRUCTURE (body_site_id, morphology, location) 
VALUES (1, 'Normal structure', 'Left Arm');

INSERT IGNORE INTO PRODUCT_CATALOG (product_id, identifying_code, product_name, classification_atc) 
VALUES 
(1, 'ATC-C09AA02', 'Enalapril 20mg', 'C09AA02'),
(2, 'ATC-A10BA02', 'Metformin 850mg', 'A10BA02'),
(3, 'ATC-C10AA05', 'Atorvastatin 20mg', 'C10AA05'),
(4, 'ATC-R03AC02', 'Salbutamol Inhaler', 'R03AC02'),
(5, 'ATC-N02BE01', 'Paracetamol 500mg', 'N02BE01');

-- 2. Stored Procedure για παραγωγή 100 πλήρων Ασθενών
DELIMITER $$

DROP PROCEDURE IF EXISTS Generate100EHDSPatients$$

CREATE PROCEDURE Generate100EHDSPatients()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE p_id INT;
    DECLARE enc_id INT;
    DECLARE stmt_id INT;
    DECLARE obs_stmt_id_val INT;
    DECLARE obs_res_id INT;
    DECLARE cond_id INT;
    DECLARE med_sum_id INT;
    DECLARE sr_id INT;
    
    DECLARE v_gender VARCHAR(10);
    DECLARE v_first_name VARCHAR(100);
    DECLARE v_last_name VARCHAR(100);
    DECLARE v_diag_code VARCHAR(50);
    DECLARE v_diag_desc VARCHAR(255);
    DECLARE v_loinc_code VARCHAR(50);
    DECLARE v_loinc_desc VARCHAR(255);
    DECLARE v_loinc_unit VARCHAR(50);
    DECLARE v_loinc_val DECIMAL(15,4);
    DECLARE v_prod_id INT;

    WHILE i <= 100 DO
        -- Δημιουργία μοναδικών IDs
        SET p_id = 1000 + i;
        SET enc_id = 1000 + i;
        SET stmt_id = 1000 + i;
        SET obs_stmt_id_val = 1000 + i;
        SET obs_res_id = 1000 + i;
        SET cond_id = 1000 + i;
        SET med_sum_id = 1000 + i;
        SET sr_id = 1000 + i;

        -- Τυχαία επιλογή στοιχείων ασθενούς
        IF RAND() > 0.5 THEN
            SET v_gender = 'female';
            SET v_first_name = ELT(1 + FLOOR(RAND() * 5), 'Μαρία', 'Ελένη', 'Αικατερίνη', 'Βασιλική', 'Σοφία');
        ELSE
            SET v_gender = 'male';
            SET v_first_name = ELT(1 + FLOOR(RAND() * 5), 'Γεώργιος', 'Νικόλαος', 'Δημήτριος', 'Κωνσταντίνος', 'Ιωάννης');
        END IF;

        SET v_last_name = ELT(1 + FLOOR(RAND() * 5), 'Παπαδόπουλος', 'Οικονόμου', 'Γεωργίου', 'Δημητριάδης', 'Αθανασίου');

        -- 1. PATIENT
        INSERT INTO PATIENT (
            patient_id, national_id, first_name, last_name, display_name, 
            birth_date, gender_code, gender_display, is_deceased
        ) VALUES (
            p_id, 
            CONCAT('AMKA-', p_id), 
            v_first_name, 
            v_last_name, 
            CONCAT(v_last_name, ' ', v_first_name),
            DATE_SUB(CURDATE(), INTERVAL FLOOR(20 + RAND() * 60) YEAR),
            v_gender,
            v_gender,
            FALSE
        );

        -- 2. ENCOUNTER
        INSERT INTO ENCOUNTER (
            encounter_id, patient_id, hp_id, org_id, start_date, end_date, 
            visit_type_code, visit_type_display, status
        ) VALUES (
            enc_id, 
            p_id, 
            1, 
            1, 
            NOW() - INTERVAL FLOOR(RAND() * 180) DAY,
            NOW() - INTERVAL FLOOR(RAND() * 180) DAY + INTERVAL 1 HOUR,
            'AMB', 
            'Ambulatory Encounter', 
            'finished'
        );

        -- 3. CLINICAL_STATEMENT
        INSERT INTO CLINICAL_STATEMENT (
            statement_id, encounter_id, patient_id, statement_type, gen_narr
        ) VALUES (
            stmt_id, 
            enc_id, 
            p_id, 
            'Patient Summary Record', 
            'Επίσημο απόσπασμα συνοπτικού ιατρικού ιστορικού ασθενούς.'
        );

        -- Τυχαία επιλογή διάγνωσης ICD-10
        SET v_diag_code = ELT(1 + FLOOR(RAND() * 5), 'I10', 'E11.9', 'J45.0', 'K21.9', 'M54.5');
        SET v_diag_desc = ELT(1 + FLOOR(RAND() * 5), 
            'Essential (primary) hypertension', 
            'Type 2 diabetes mellitus without complications', 
            'Predominantly allergic asthma', 
            'Gastro-esophageal reflux disease without esophagitis', 
            'Low back pain');

        -- 4. HEALTH_CONDITIONS
        INSERT INTO HEALTH_CONDITIONS (
            condition_id, statement_id, clinical_status, verification_status, 
            condition_code, condition_display, severity, onset_date, body_site_id, hp_id
        ) VALUES (
            cond_id, 
            stmt_id, 
            'active', 
            'confirmed', 
            v_diag_code, 
            v_diag_desc, 
            'moderate', 
            NOW() - INTERVAL 1 YEAR, 
            1, 
            1
        );

        -- 5. OBSERVATION_STATEMENT
        INSERT INTO OBSERVATION_STATEMENT (
            obs_statement_id, patient_id, encounter_id, hp_id, obs_type, status, issued
        ) VALUES (
            obs_stmt_id_val, 
            p_id, 
            enc_id, 
            1, 
            'Laboratory & Vital Signs', 
            'final', 
            NOW()
        );

        -- Τυχαία επιλογή μέτρησης LOINC
        IF RAND() > 0.5 THEN
            SET v_loinc_code = '15074-8';
            SET v_loinc_desc = 'Glucose [Mass/volume] in Blood';
            SET v_loinc_unit = 'mg/dL';
            SET v_loinc_val = ROUND(75.0000 + (RAND() * 110.0000), 4);
        ELSE
            SET v_loinc_code = '8480-6';
            SET v_loinc_desc = 'Systolic blood pressure';
            SET v_loinc_unit = 'mm[Hg]';
            SET v_loinc_val = ROUND(115.0000 + (RAND() * 35.0000), 4);
        END IF;

        -- 6. OBSERVATION_RESULTS
        INSERT INTO OBSERVATION_RESULTS (
            obs_result_id, obs_statement_id, body_site_id, obs_date_start, 
            obs_type_code, obs_type_display, value_quantity, value_unit
        ) VALUES (
            obs_res_id, 
            obs_stmt_id_val, 
            1, 
            NOW() - INTERVAL 2 HOUR, 
            v_loinc_code, 
            v_loinc_desc, 
            v_loinc_val, 
            v_loinc_unit
        );

        -- 7. MEDICATION_SUMMARY
        SET v_prod_id = 1 + FLOOR(RAND() * 5);
        INSERT INTO MEDICATION_SUMMARY (
            med_summary_id, statement_id, product_id, summary_status, condition_id, obs_id
        ) VALUES (
            med_sum_id, 
            stmt_id, 
            v_prod_id, 
            'active', 
            cond_id, 
            obs_res_id
        );

        -- 8. SERVICE_REQUEST
        INSERT INTO SERVICE_REQUEST (
            service_req_id, description, status, intent, encounter_id, patient_id, requester_hp_id, requester_org_id
        ) VALUES (
            sr_id, 
            'Εργαστηριακός επανέλεγχος ρουτίνας', 
            'active', 
            'order', 
            enc_id, 
            p_id, 
            1, 
            1
        );

        -- 9. ALLERGIES_AND_INTOLERANCES
        INSERT INTO ALLERGIES_AND_INTOLERANCES (
            statement_id, agent_code, agent_display, clinical_status, verification_status, criticality
        ) VALUES (
            stmt_id, 
            '373270004', 
            'Penicillin', 
            'active', 
            'confirmed', 
            'high'
        );

        -- 10. SOCIAL_HISTORY
        INSERT INTO SOCIAL_HISTORY (
            patient_id, generated_narr, dated_recorded
        ) VALUES (
            p_id, 
            'Μη καπνιστής, φυσιολογική φυσική δραστηριότητα.', 
            NOW()
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- 3. Εκτέλεση της διαδικασίας
CALL Generate100EHDSPatients();



SELECT 
    p.patient_id,
    p.national_id,
    CONCAT(p.last_name, ' ', p.first_name) AS full_name,
    p.gender_code,
    TIMESTAMPDIFF(YEAR, p.birth_date, CURDATE()) AS age,
    hc.condition_code AS diagnosis,
    pc.product_name AS active_medication,
    obs.obs_type_display AS lab_test,
    obs.value_quantity AS result_value,
    obs.value_unit AS unit,
    sr.description AS request_description
FROM PATIENT p
JOIN ENCOUNTER e ON p.patient_id = e.patient_id
JOIN CLINICAL_STATEMENT cs ON p.patient_id = cs.patient_id
JOIN HEALTH_CONDITIONS hc ON cs.statement_id = hc.statement_id
JOIN MEDICATION_SUMMARY ms ON cs.statement_id = ms.statement_id
JOIN PRODUCT_CATALOG pc ON ms.product_id = pc.product_id
JOIN OBSERVATION_STATEMENT os ON p.patient_id = os.patient_id
JOIN OBSERVATION_RESULTS obs ON os.obs_statement_id = obs.obs_statement_id
JOIN SERVICE_REQUEST sr ON p.patient_id = sr.patient_id
WHERE p.patient_id BETWEEN 1001 AND 1100
ORDER BY p.patient_id;