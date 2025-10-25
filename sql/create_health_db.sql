-- create_health_db.sql
CREATE DATABASE IF NOT EXISTS health_db;
USE health_db;

CREATE TABLE hospitals (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(200),
    size INT,
    type VARCHAR(50),
    accreditation_status VARCHAR(50)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100),
    hospital_id INT,
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    address VARCHAR(200),
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    medication VARCHAR(100),
    prescription_date DATE,
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
