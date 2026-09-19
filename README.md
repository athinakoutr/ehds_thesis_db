# EHDS Thesis Database (ehds_thesis_db)

Αυτό το αποθετήριο περιέχει τη σχεδίαση και τα scripts της βάσης δεδομένων για την πτυχιακή εργασία με θέμα τον **Ευρωπαϊκό Χώρο Δεδομένων Υγείας (European Health Data Space - EHDS)**.

## Περιεχόμενα Αρχείων
Η βάση δεδομένων έχει σχεδιαστεί σύμφωνα με τις προδιαγραφές του Patient Summary του EHDS και περιλαμβάνει ενδεικτικά πίνακες όπως:
* `PATIENT`: Στοιχεία ασθενών και δημογραφικά δεδομένα.
* `CLINICAL_STATEMENT`: Κλινικές δηλώσεις και ιατρικό ιστορικό.
* `HEALTH_CONDITIONS`: Διαγνώσεις και καταστάσεις υγείας.
* `OBSERVATION_STATEMENT`: Παρατηρήσεις και μετρήσεις υγείας.
* `MEDICATION_SUMMARY`: Σύνοψη φαρμακευτικής αγωγής.

## Τεχνολογίες
* **DBMS:** MySQL
* **Πρότυπα:** EHDS Patient Summary / HL7 FHIR Logical Models
