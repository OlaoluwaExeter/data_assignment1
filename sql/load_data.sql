
 # LOAD DATA INTO DATABLE TABLE

load data infile '/var/lib/mysql-files/hospitals.csv'
into table hospitals
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(hospital_id, name, address, size, type, accreditation_status);
# verify the data loaded
select * from hospitals limit 5;


load data infile '/var/lib/mysql-files/doctors.csv'
into table doctors
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(person_id, name, date_of_birth, address, role, hospital_id);

# verify the data loaded
select * from doctors limit 5;


load data infile '/var/lib/mysql-files/patients.csv'
into table patients
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(person_id, name, date_of_birth, address, role, doctor_id);

# verify the data loaded
select * from patients limit 5;

load data infile '/var/lib/mysql-files/prescriptions.csv'
into table prescriptions
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(prescription_id, patient_id, doctor_id, medication, prescription_date);

# verify the data loaded
select * from prescriptions limit 5;
