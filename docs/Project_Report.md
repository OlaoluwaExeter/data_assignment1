
# Computing Skills and Pythons Assignment (HPDM206Z_A_ONT1_202526)

## Student Id: 750095679


## Introduction

This project involves the development of a **Health Data Analytics System** using **MySQL** as the relational database management system, with all operations performed via **command-line tools** and **GitHub** used for version control to ensure reproducibility and proper tracking of changes.

The dataset is structured around four primary entities: **Hospitals**, **Doctors**, **Patients**, and **Prescriptions**. These entities are interrelated, forming a **normalized relational database** that allows complex queries to extract meaningful insights.

Using this system, it is possible to answer analytical questions such as:

- Which doctors are associated with which hospitals  
- The prescription history for individual patients  
- Identification of the most active prescribing doctors  
- Determination of the hospital with the highest patient capacity  

The workflow encompassed the entire database lifecycle — importing raw data, creating tables, normalizing the data to reduce redundancy, and writing SQL queries to retrieve insights. All steps were executed via the command line to support automation, ensure reproducibility, and facilitate version-controlled collaboration through GitHub.


## Objectives

- Create a MySQL database from pre-populated `.csv` files.  
- Perform data normalization and ensure referential integrity using foreign keys.  
- Run SQL queries to retrieve and analyze data relationships.  
- Maintain a version-controlled project using Git and GitHub.  
- Document the workflow with pseudocode, flowchart, and ERD (Entity-Relationship Diagram).


## Dataset Overview

| File Name                    | Description                                      |
|-------------------------------|------------------------------------------------|
| data/hospitals.csv            | Contains hospital details                      |
| data/doctors.csv              | Contains doctor records linked to hospitals   |
| data/patients.csv             | Contains patient records linked to doctors    |
| data/prescriptions.csv        | Contains prescriptions linked to patients/doctors 


## Database Design

The system consists of four main tables:

| Table Name    | Description             | Key Fields                     |
|---------------|------------------------|--------------------------------|
| hospitals     | Stores hospital details | hospital_id (Primary Key)      |
| doctors       | Contains doctor records | doctor_id, hospital_id         |
| patients      | Patient information    | patient_id, doctor_id          |
| prescriptions | Prescribed medications | prescription_id, doctor_id     |



## Entity-Relationship Diagram (ERD)

Hospitals (1) ────< (M) Doctors (1) ────< (M) Patients (1) ────< (M) Prescriptions

*	One HOSPITAL → Many DOCTORS
* 	One DOCTOR → Many PATIENTS
*	One PATIENT → Many PRESCRIPTIONS
*	One DOCTOR → Many PRESCRIPTIONS

## Database Creation  
   * A new database called `health_db` was created using `CREATE DATABASE health_db;`.
   * All subsequent tables and queries were executed within this database.

## Data Loading  
   * Pre-populated CSV files were imported into each table using `LOAD DATA INFILE`.
   * Data was checked for missing values and duplicates before analysis.

## Command-Line Execution  
   * All SQL commands were executed via the MySQL command line.
   * Output was stored in a log file (`screen_output.txt`) for reproducibility.

## Version Control  
   * SQL scripts and command outputs were maintained in the project repository on GitHub.
   This ensured that all database operations, queries, and results were **reproducible** and **tracked for changes**.

## Data Normalization and Verification

* To ensure data consistency.
* Checked for missing values.
* Checked for duplicates.
* Verified foreign key integrity.
* No missing references were found, confirming successful normalization. 

## Analytical Queries

| Query | Purpose | Importance / Insight Gained |
|-------|---------|-----------------------------|
| `SELECT d.name AS DoctorName, h.name AS HospitalName FROM doctors d JOIN hospitals h ON d.hospital_id = h.hospital_id WHERE d.hospital_id = 1;` | List all doctors in a specific hospital | Helps administrators understand which doctors work in a particular hospital for staffing and resource management |
| `SELECT p.prescription_id, pa.name AS PatientName, p.medication, p.prescription_date FROM prescriptions p JOIN patients pa ON p.patient_id = pa.person_id WHERE p.doctor_id = 5 ORDER BY p.prescription_date;` | List all prescriptions issued by a specific doctor | Useful for monitoring a doctor’s prescribing patterns and patient care history |
| `SELECT p.prescription_id, p.medication, p.prescription_date, d.name AS DoctorName FROM prescriptions p JOIN doctors d ON p.doctor_id = d.person_id WHERE p.patient_id = 105 ORDER BY p.prescription_date;` | Show prescription history for a specific patient | Ensures accurate patient records and helps prevent drug interactions or duplication |
| `INSERT INTO patients (person_id, name, date_of_birth, address, role, doctor_id) VALUES (1099, 'John Doe', '1992-07-10', '23 Main Street', 'patient', 5); SELECT * FROM patients WHERE person_id = 999;` | Register a new patient and verify entry | Ensures new patients are added correctly and linked to a doctor for accountability |
| `SELECT d.person_id AS DoctorID, d.name AS DoctorName, COUNT(p.prescription_id) AS TotalPrescriptions FROM prescriptions p JOIN doctors d ON p.doctor_id = d.person_id GROUP BY d.person_id, d.name ORDER BY TotalPrescriptions DESC LIMIT 1;` | Identify the most active prescribing doctor | Highlights workload, performance, and trends in prescribing practices |
| `SELECT d.person_id AS DoctorID, d.name AS DoctorName, d.role AS DoctorRole, h.name AS HospitalName, h.size AS HospitalBeds FROM doctors d JOIN hospitals h ON d.hospital_id = h.hospital_id WHERE h.size = (SELECT MAX(size) FROM hospitals) ORDER BY d.name;` | List doctors working at the hospital with the largest capacity | Helps in planning staff distribution, understanding resource allocation, and managing hospital capacity effectively |


## Version Control (Git & GitHub)

All project files were version-controlled using Git.

## Conclusion

This project successfully designed and implemented a structured health database with well-defined relationship.

## Declaration of AI Integration
* This project was developed with assistance from ChatGPT (OpenAI) to guide with syntax, documentation.
* All commands and scripts were verified and executed manually the me.
*  AI-supported/AI-integrated use is permitted in this assessment. 
* I acknowledge the following uses :

- I have used GenAI tools to help me understand key theories and concepts.
- I have used GenAI tools to suggest a plan or structure for my assessment.
- I have used GenAI tool to generate images, figures or diagrams.
- I have used GenAI to deal with error in my Database implementation.


## References

- MySQL Documentation: [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)  
- GitHub Guides: [https://guides.github.com/](https://guides.github.com/)  
- ChatGPT (OpenAI) Assistance for structure and syntax  
- SQL Tutorial: [https://www.w3schools.com](https://www.w3schools.com)  
