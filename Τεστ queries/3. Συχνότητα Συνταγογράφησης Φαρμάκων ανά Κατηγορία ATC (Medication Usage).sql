USE ehds_thesis_db;

# 3. Συχνότητα Συνταγογράφησης Φαρμάκων ανά Κατηγορία ATC (Medication Usage)
# Αναλύει ποια σκευάσματα και κατηγορίες ATC χορηγούνται συχνότερα:

SELECT 
    pc.classification_atc AS atc_code,
    pc.product_name,
    COUNT(ms.med_summary_id) AS prescription_count,
    ROUND(COUNT(ms.med_summary_id) * 100.0 / (SELECT COUNT(*) FROM MEDICATION_SUMMARY), 2) AS percentage_of_total
FROM MEDICATION_SUMMARY ms
JOIN PRODUCT_CATALOG pc ON ms.product_id = pc.product_id
WHERE ms.summary_status = 'active'
GROUP BY pc.classification_atc, pc.product_name
ORDER BY prescription_count DESC;