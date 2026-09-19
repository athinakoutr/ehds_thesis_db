USE ehds_thesis_db;

# 1. Επιπολασμός Διαγνώσεων και Κατανομή Φύλου (Prevalence & Demographics)
# Υπολογίζει πόσοι ασθενείς έχουν κάθε πάθηση, ταξινομημένοι ανά συχνότητα και φύλο:

SELECT 
    hc.condition_code AS icd10_code,
    hc.condition_display AS condition_name,
    COUNT(DISTINCT p.patient_id) AS total_patients,
    SUM(CASE WHEN p.gender_code = 'female' THEN 1 ELSE 0 END) AS female_count,
    SUM(CASE WHEN p.gender_code = 'male' THEN 1 ELSE 0 END) AS male_count
FROM HEALTH_CONDITIONS hc
JOIN CLINICAL_STATEMENT cs ON hc.statement_id = cs.statement_id
JOIN PATIENT p ON cs.patient_id = p.patient_id
GROUP BY hc.condition_code, hc.condition_display
ORDER BY total_patients DESC;