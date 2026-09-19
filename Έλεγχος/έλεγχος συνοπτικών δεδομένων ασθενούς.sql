USE ehds_thesis_db;

DESCRIBE OBSERVATION_RESULTS;

SELECT 
    p.patient_id,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    COUNT(DISTINCT hc.condition_id) AS total_active_conditions,
    COUNT(DISTINCT ms.med_summary_id) AS total_medications,
    COUNT(DISTINCT obs.obs_result_id) AS total_observations,
    COUNT(DISTINCT sr.service_req_id) AS total_service_requests
FROM PATIENT p
LEFT JOIN CLINICAL_STATEMENT cs 
    ON p.patient_id = cs.patient_id
LEFT JOIN HEALTH_CONDITIONS hc 
    ON cs.statement_id = hc.statement_id AND hc.clinical_status = 'active'
LEFT JOIN MEDICATION_SUMMARY ms 
    ON cs.statement_id = ms.statement_id
LEFT JOIN OBSERVATION_RESULTS obs 
    ON cs.statement_id = obs.obs_statement_id
LEFT JOIN SERVICE_REQUEST sr 
    ON p.patient_id = sr.patient_id
GROUP BY 
    p.patient_id, p.last_name, p.first_name;