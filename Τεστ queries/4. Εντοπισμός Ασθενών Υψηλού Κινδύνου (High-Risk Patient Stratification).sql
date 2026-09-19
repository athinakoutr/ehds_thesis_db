USE ehds_thesis_db;

# 4. Εντοπισμός Ασθενών Υψηλού Κινδύνου (High-Risk Patient Stratification)
# Εντοπίζει ασθενείς με υψηλή συστολική πίεση (>= 140 mmHg) ή αυξημένο σάκχαρο (>= 126 mg/dL):

SELECT 
    p.patient_id,
    CONCAT(p.last_name, ' ', p.first_name) AS full_name,
    TIMESTAMPDIFF(YEAR, p.birth_date, CURDATE()) AS age,
    obs.obs_type_display AS metric,
    obs.value_quantity AS measured_value,
    obs.value_unit AS unit
FROM PATIENT p
JOIN OBSERVATION_STATEMENT os ON p.patient_id = os.patient_id
JOIN OBSERVATION_RESULTS obs ON os.obs_statement_id = obs.obs_statement_id
WHERE (obs.obs_type_code = '8480-6' AND obs.value_quantity >= 140)
   OR (obs.obs_type_code = '15074-8' AND obs.value_quantity >= 126)
ORDER BY obs.value_quantity DESC;