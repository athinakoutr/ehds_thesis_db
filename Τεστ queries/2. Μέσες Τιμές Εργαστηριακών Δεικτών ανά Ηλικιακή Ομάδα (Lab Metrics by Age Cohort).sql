USE ehds_thesis_db;

# 2. Μέσες Τιμές Εργαστηριακών Δεικτών ανά Ηλικιακή Ομάδα (Lab Metrics by Age Cohort)
# Ομαδοποιεί τους ασθενείς σε ηλικιακά γκρουπ και υπολογίζει ελάχιστη, μέγιστη και μέση τιμή για κάθε τύπο εξέτασης:

SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, p.birth_date, CURDATE()) < 40 THEN '20-39'
        WHEN TIMESTAMPDIFF(YEAR, p.birth_date, CURDATE()) BETWEEN 40 AND 60 THEN '40-60'
        ELSE '60+' 
    END AS age_group,
    obs.obs_type_display AS lab_test,
    obs.value_unit AS unit,
    COUNT(obs.obs_result_id) AS total_tests,
    ROUND(AVG(obs.value_quantity), 2) AS avg_value,
    MIN(obs.value_quantity) AS min_value,
    MAX(obs.value_quantity) AS max_value
FROM PATIENT p
JOIN OBSERVATION_STATEMENT os ON p.patient_id = os.patient_id
JOIN OBSERVATION_RESULTS obs ON os.obs_statement_id = obs.obs_statement_id
GROUP BY age_group, obs.obs_type_display, obs.value_unit
ORDER BY lab_test, age_group;