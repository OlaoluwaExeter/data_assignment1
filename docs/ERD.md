# ASCII ERD - Health Data Analytics Project

```text
+----------------+       +----------------+       +----------------+
|   Hospitals    |       |     Doctors    |       |     Patients   |
+----------------+       +----------------+       +----------------+
| hospital_id PK |<----- | hospital_id FK |       | doctor_id FK   |
| name           |       | person_id PK   |<----- | person_id PK   |
| address        |       | name           |       | name           |
| size           |       | date_of_birth  |       | date_of_birth  |
| type           |       | address        |       | address        |
| accreditation  |       | role           |       | role           |
+----------------+       +----------------+       +----------------+
                               |
                               |
                               v
                       +----------------+
                       |  Prescriptions |
                       +----------------+
                       | prescription_id PK |
                       | patient_id FK      |
                       | doctor_id FK       |
                       | medication         |
                       | prescription_date  |
                       +----------------+
