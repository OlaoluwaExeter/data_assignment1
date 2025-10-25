
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

The workflow encompassed the entire **database lifecycle** — importing raw data, creating tables, normalizing the data to reduce redundancy, and writing SQL queries to retrieve insights. All steps were executed via the **command line** to support automation, ensure reproducibility, and facilitate **version-controlled collaboration** through GitHub.

## Project Structure

health-data-analytics/
├── data/
│   ├── doctors.csv
│   ├── hospitals.csv
│   ├── patients.csv
│   └── prescriptions.csv
├── docs/
│   ├── ERD.md
│   ├── Project_Report.md
│   ├── README.md
│   └── flowchart.md
├── output/
│   └── screen_output.txt
└── sql/


## Pseudocode

 BEGIN
  ↓
  CONNECT to MySQL server
  ↓
  CREATE DATABASE health_db
  ↓
  CREATE tables → (hospitals, doctors, patients, prescriptions)
  ↓
  LOAD data from CSV files → INTO tables
  ↓
  CHECK for missing or duplicate data
  ↓
  DEFINE foreign key relationships → (set up links between tables)
  ↓
  RUN analytical queries → to extract insights
  ↓
  COMMIT all project files → to GitHub repository
  ↓
END

## Objectives

-       Create a MySQL database from pre-populated .csv files.
-       Perform data normalization and ensure referential integrity using primary and foreign keys.
-       Run SQL queries to retrieve and analyze data relationships.
-       Maintain a version-controlled project using Git and GitHub.
-       Document the workflow with pseudocode, flowchart, and ERD (Entity Relationship Diagram).

## Dataset Overview

| File Name                    | Description                                      |
|-------------------------------|------------------------------------------------|
| data/hospitals.csv            | Contains hospital details                      |
| data/doctors.csv              | Contains doctor records linked to hospitals   |
| data/patients.csv             | Contains patient records linked to doctors    |
| data/prescriptions.csv        | Contains prescriptions linked to patients/doctors 


## Database Desig

The system consists of four main tables:

| Table Name    | Description             | Key Fields                     |
|---------------|------------------------|--------------------------------|
| hospitals     | Stores hospital details | hospital_id (Primary Key)      |
| doctors       | Contains doctor records | doctor_id, hospital_id         |
| patients      | Patient information    | patient_id, doctor_id          |
| prescriptions | Prescribed medications | prescription_id, doctor_id     |



## Entity-Relationship Diagram (ERD)

Hospitals (1) ────< (M) Doctors (1) ────< (M) Patients (1) ────< (M) Prescriptions

## SQL Implementation

All SQL files were stored in the /sql/ directory:

## Data Normalization and Verification

* To ensure data consistency:

* Checked for missing values:
*  Checked for duplicates:
* Verified foreign key integrity:
* No missing references were found, confirming successful normalization:

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


•       MySQL Documentation: https://dev.mysql.com/doc/.
•       GitHub Guides: https://guides.github.com/.
•       ChatGPT (OpenAI) Assistance for structure and syntax.
•       SQL Tutorial:  https://www.w3schools.com.
•       SQL Tutorial:  https://www.tutorialspoint.com/mysql/index.htm.


         



## Project Structure

```plaintext
health-data-analytics/
│
├── data/
│   ├── doctors.csv
│   ├── hospitals.csv
│   ├── patients.csv
│   └── prescriptions.csv
│
├── docs/
│   ├── ERD.md
│   ├── Project_Report.md
│   ├── README.md
│   └── flowchart.md
│
├── output/
│   └── screen_output.txt
│
└── sql/



## Pseudocode

 BEGIN
  ↓
  CONNECT to MySQL server
  ↓
  CREATE DATABASE health_db
  ↓
  CREATE tables → (hospitals, doctors, patients, prescriptions)
  ↓
  LOAD data from CSV files → INTO tables
  ↓
  CHECK for missing or duplicate data
  ↓
  DEFINE foreign key relationships → (set up links between tables)
  ↓
  RUN analytical queries → to extract insights
  ↓
  COMMIT all project files → to GitHub repository
  ↓
END

## Objectives

-       Create a MySQL database from pre-populated .csv files.
-       Perform data normalization and ensure referential integrity using primary and foreign keys.
-       Run SQL queries to retrieve and analyze data relationships.
-       Maintain a version-controlled project using Git and GitHub.
-       Document the workflow with pseudocode, flowchart, and ERD (Entity Relationship Diagram).


## Dataset Overview

| File Name                    | Description                                      |
|-------------------------------|------------------------------------------------|
| data/hospitals.csv            | Contains hospital details                      |
| data/doctors.csv              | Contains doctor records linked to hospitals   |
| data/patients.csv             | Contains patient records linked to doctors    |
| data/prescriptions.csv        | Contains prescriptions linked to patients/doctors |


## Database Desig

The system consists of four main tables:

| Table Name    | Description             | Key Fields                     |
|---------------|------------------------|--------------------------------|
| hospitals     | Stores hospital details | hospital_id (Primary Key)      |
| doctors       | Contains doctor records | doctor_id, hospital_id         |
| patients      | Patient information    | patient_id, doctor_id          |
| prescriptions | Prescribed medications | prescription_id, doctor_id     |


## Entity-Relationship Diagram (ERD)

Hospitals (1) ────< (M) Doctors (1) ────< (M) Patients (1) ────< (M) Prescriptions

## SQL Implementation

All SQL files were stored in the /sql/ directory:

## Data Normalization and Verification

* To ensure data consistency:

* Checked for missing values:
*  Checked for duplicates:
* Verified foreign key integrity:
* No missing references were found, confirming successful normalization:

## Analytical Queries


## Analytical Queries


| Query | Purpose | Importance / Insight Gained |
|-------|---------|-----------------------------|
| `SELECT d.name, h.name FROM doctors d JOIN hospitals h ON d.hospital_id=h.hospital_id WHERE h.name='Central City Hospital';` | Retrieve all doctors based at a specific hospital | Helps administrators see which doctors work at which hospital,<br>useful for staff management and resource allocation |
| `SELECT p.name, pr.medication, pr.prescription_date FROM prescriptions pr JOIN patients p ON pr.patient_id=p.patient_id WHERE p.name='John Doe' ORDER BY pr.prescription_date DESC;` | List a patient’s prescription history ordered by date | Allows doctors and pharmacists to review patient medication history,<br>and prevent duplication or drug interactions |
| `INSERT INTO patients (patient_id, name, date_of_birth, address, role, doctor_id) VALUES (301, 'Jane Smith', '1990-02-18', '15 River Street', 'Patient', 105);` | Register new patients in the system | Ensures new patients are added and linked to a doctor for accountability |
| `SELECT doctor_id, COUNT(*) AS total_prescriptions FROM prescriptions GROUP BY doctor_id ORDER BY total_prescriptions DESC LIMIT 1;` | Identify the most active prescribing doctor | Highlights workload and prescribing patterns,<br>useful for performance monitoring and workload management |
| `SELECT d.name, h.size FROM doctors d JOIN hospitals h ON d.hospital_id=h.hospital_id WHERE h.size=(SELECT MAX(size) FROM hospitals);` | Find doctors working at the hospital with maximum capacity | Helps in understanding staff distribution across facilities,<br>and resource planning |
| `SELECT * FROM patients WHERE name IS NULL OR doctor_id IS NULL;` | Check for missing or incomplete patient data | Ensures data quality and consistency;<br>prevents incomplete records from affecting analytics |
| `SELECT name, date_of_birth, COUNT(*) AS duplicate_count FROM patients GROUP BY name, date_of_birth HAVING COUNT(*) > 1;` | Detect duplicate patient records | Maintains a clean and accurate dataset;<br>prevents double counting or inconsistent medical histories |


## Version Control (Git & GitHub)

All project files were version-controlled using Git.

## Conclusion

This project successfully designed and implemented a structured health database with well-defined relationships and integrity constraints. It developed efficient analytical SQL queries to generate meaningful insights and included complete documentation with Git-based version control for collaborative and reproducible development.

## Declaration of AI Integration
•	This project was developed with assistance from ChatGPT (OpenAI) to guide with syntax, documentation structure, and explanations.
• 	All commands and scripts were verified and executed manually the me.
•	AI-supported/AI-integrated use is permitted in this assessment. I acknowledge the following uses of GenAI tools in this assessment:

         - I have used GenAI tools to help me understand key theories and concepts.
         - I have used GenAI tools to suggest a plan or structure for my assessment.
         - I have used GenAI tool to generate images, figures or diagrams.
         - I have used GenAI to deal with error in my Database implementation
         
## References

- MySQL Documentation: [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)  
- GitHub Guides: [https://guides.github.com/](https://guides.github.com/)  
- ChatGPT (OpenAI) Assistance for structure and syntax  
- SQL Tutorial: [https://www.w3schools.com](https://www.w3schools.com)  

