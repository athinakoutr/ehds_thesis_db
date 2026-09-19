USE ehds_thesis_db;

-- 1. Εισαγωγή Ασθενούς
INSERT INTO PATIENT (last_name, first_name, birth_date, gender_code)
VALUES ('Παπαδόπουλος', 'Γεώργιος', '1985-05-12', 'male');

DELETE FROM PATIENT WHERE patient_id > 1;

SELECT * FROM PATIENT;