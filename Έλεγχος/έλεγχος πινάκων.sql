USE ehds_thesis_db;
#Έλεγχος ότι όλοι οι πίνακες και τα Foreign Keys δημιουργήθηκαν σωστά
SELECT 
    TABLE_NAME AS 'Child Table',
    CONSTRAINT_NAME AS 'Foreign Key Name',
    COLUMN_NAME AS 'FK Column',
    REFERENCED_TABLE_NAME AS 'Parent Table',
    REFERENCED_COLUMN_NAME AS 'Parent Column'
FROM
    information_schema.KEY_COLUMN_USAGE
WHERE
    REFERENCED_TABLE_SCHEMA = DATABASE()
ORDER BY 
    TABLE_NAME;