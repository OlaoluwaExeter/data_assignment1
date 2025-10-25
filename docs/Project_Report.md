
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

## Database Creation**  
   * A new database called `health_db` was created using `CREATE DATABASE health_db;`.
   * All subsequent tables and queries were executed within this database.

## Data Loading**  
   * Pre-populated CSV files were imported into each table using `LOAD DATA INFILE`.
   * Data was checked for missing values and duplicates before analysis.

## Command-Line Execution**  
   * All SQL commands were executed via the MySQL command line.
   * Output was stored in a log file (`screen_output.txt`) for reproducibility.

## Version Control**  
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
|-------|---------|----------------------------|
| `SELECT * FROM doctors WHERE hospital_id = 3;` | Find all doctors at a specific hospital. | Helps hospital admin manage staff and schedules. |
| `SELECT p.name, pr.medication FROM prescriptions pr JOIN patients p ON pr.patient_id=p.patient_id;` | View each patient's prescription history. | Useful for monitoring medication patterns and preventing duplication. |
| `SELECT doctor_id, COUNT(*) AS total_prescriptions FROM prescriptions GROUP BY doctor_id ORDER BY total_prescriptions DESC LIMIT 1;` | Identify the most active prescribing doctor. | Recognizes high-performing or overworked doctors. |
| `SELECT h.name, h.size FROM hospitals h ORDER BY h.size DESC LIMIT 1;` | Find the hospital with the highest capacity. | Helps management understand resource distribution. |
| `SELECT * FROM patients WHERE doctor_id IS NULL;` | Detect patients not assigned to a doctor. | Ensures every patient is linked to a healthcare provider. |


## Version Control (Git & GitHub)

All project files were version-controlled using Git.

## Conclusion

This project successfully designed and implemented a structured health database with well-defined relationship.

## Declaration of AI Integration
•       This project was developed with assistance from ChatGPT (OpenAI) to guide with syntax, documentation.
• 	All commands and scripts were verified and executed manually the me.
•       AI-supported/AI-integrated use is permitted in this assessment. 
•	I acknowledge the following uses :

         - I have used GenAI tools to help me understand key theories and concepts.
         - I have used GenAI tools to suggest a plan or structure for my assessment.
         - I have used GenAI tool to generate images, figures or diagrams.
         - I have used GenAI to deal with error in my Database implementatio.


## References

- MySQL Documentation: [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)  
- GitHub Guides: [https://guides.github.com/](https://guides.github.com/)  
- ChatGPT (OpenAI) Assistance for structure and syntax  
- SQL Tutorial: [https://www.w3schools.com](https://www.w3schools.com)  
