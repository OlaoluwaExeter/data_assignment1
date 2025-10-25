# Checking for duplicate data
SELECT person_id, COUNT(*) FROM doctors GROUP BY person_id HAVING COUNT(*) > 1;

# Checking for empty data
SELECT * FROM doctors WHERE hospital_id IS NULL;

# Checking for empty data
SELECT * FROM patients WHERE doctor_id IS NULL;

# Check for missing hospital_id in doctors
SELECT * FROM doctors WHERE hospital_id IS NULL;
