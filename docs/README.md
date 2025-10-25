
#                   Computing Skills and Pythons Assignment (HPDM206Z_A_ONT1_202526)

## Student Id: 750095679


## Overview
This project demonstrates a complete beginner-friendly workflow for analyzing **healthcare data** using **MySQL** and the **Linux command line**.  
The dataset includes **Hospitals, Doctors, Patients, and Prescriptions**, with relationships linking them together.

All operations (database creation, table setup, data loading, and queries) are performed from the **command line**, and all screen outputs are saved for reproducibility.

--- 

##  Objectives
- Build a properly structured MySQL database using CSV files.
- Create tables with relationships between hospitals, doctors, patients, and prescritions
- Load, check, and analyze the data using MySQL queries. 
- Save all terminal outputs for reproducibility. 
- Upload the entire project to GitHub for version control.


---

## Data Structure

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


# Pseudocode

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

