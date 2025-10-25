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

# Hospitals Table
create table hospitals (hospital_id INT PRIMARY KEY, name VARCHAR(100),
address VARCHAR(200),
size INT,
type VARCHAR(50),
accreditation_status VARCHAR(50)
);

# Doctors
create table doctors (
person_id INT PRIMARY KEY,
name VARCHAR(100),
date_of_birth DATE,
address VARCHAR(200),
role VARCHAR(50),
FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id)
);


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

ubuntu@oa413:~$ cd ~/health_project
ubuntu@oa413:~/health_project$ mysql --local-infile=1 -u hds -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 72
Server version: 8.0.43-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

mysql> USE healthdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| assessment1        |
| healthdb           |
| information_schema |
| librar             |
| library            |
| mysql              |
| mytest             |
| performance_schema |
| sys                |
+--------------------+
9 rows in set (0.01 sec)

mysql> show tables;
+--------------------+
| Tables_in_healthdb |
+--------------------+
| doctors            |
| hospitals          |
| patients           |
| prescriptions      |
+--------------------+
4 rows in set (0.01 sec)

mysql> # Hospitals Table
mysql> create table hospitals (hospital_id INT PRIMARY KEY, name VARCHAR(100),
    -> address VARCHAR(200),
    -> size INT,
    -> type VARCHAR(50),
    -> accreditation_status VARCHAR(50)
    -> );
ERROR 1050 (42S01): Table 'hospitals' already exists
mysql> # all doctors at a specific hospital.
mysql> 
mysql> SELECT * FROM doctors WHERE hospital_id = 3;
+-----------+------------------------+---------------+-------------------------------------------------------+--------+-------------+
| person_id | name                   | date_of_birth | address                                               | role   | hospital_id |
+-----------+------------------------+---------------+-------------------------------------------------------+--------+-------------+
|        20 | Dr. Noah Miller        | 1968-08-18    | 90569 Moore Expressway Apt. 529 South James, PA 55545 | Doctor |           3 |
|        56 | Dr. Tonya Fletcher DDS | 1982-05-31    | 001 Jamie Haven Apt. 830 Weberton, GA 88082           | Doctor |           3 |
|        71 | Dr. Kaitlyn Fowler     | 1969-01-02    | 743 Nash Knoll Port Daniel, MO 71334                  | Doctor |           3 |
+-----------+------------------------+---------------+-------------------------------------------------------+--------+-------------+
3 rows in set (0.00 sec)

mysql> # patient's prescription history
mysql> SELECT p.name, pr.medication FROM prescriptions pr JOIN patients p ON pr.patient_id=p.patient_id;
ERROR 1054 (42S22): Unknown column 'p.patient_id' in 'on clause'
mysql> SELECT doctor_id, COUNT(*) AS total_prescriptions FROM prescriptions GROUP BY doctor_id ORDER BY total_prescriptions DESC LIMIT 1;
+-----------+---------------------+
| doctor_id | total_prescriptions |
+-----------+---------------------+
|        19 |                  13 |
+-----------+---------------------+
1 row in set (0.00 sec)

mysql> # most active prescribing doctor.
mysql> SELECT doctor_id, COUNT(*) AS total_prescriptions FROM prescriptions GROUP BY doctor_id ORDER BY total_prescriptions DESC LIMIT 1;
+-----------+---------------------+
| doctor_id | total_prescriptions |
+-----------+---------------------+
|        19 |                  13 |
+-----------+---------------------+
1 row in set (0.01 sec)

mysql> # The hospital with the highest capacity.
mysql> SELECT h.name, h.size FROM hospitals h ORDER BY h.size DESC LIMIT 1;
+-------------------------------------+------+
| name                                | size |
+-------------------------------------+------+
| Peters, Anderson and Baker Hospital |  494 |
+-------------------------------------+------+
1 row in set (0.01 sec)

mysql> # PPatients not assigned to a doctor.
mysql> SELECT h.name, h.size FROM hospitals h ORDER BY h.size DESC LIMIT 1;^C
mysql> describe patients
    -> ;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| person_id     | int          | NO   | PRI | NULL    |       |
| name          | varchar(100) | YES  |     | NULL    |       |
| date_of_birth | date         | YES  |     | NULL    |       |
| address       | varchar(200) | YES  |     | NULL    |       |
| role          | varchar(50)  | YES  |     | NULL    |       |
| doctor_id     | int          | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> show patient;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'patient' at line 1
mysql> 
mysql> show patients;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'patients' at line 1
mysql> show doctors;;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'doctors' at line 1
ERROR: 
No query specified

mysql> describe  doctors;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| person_id     | int          | NO   | PRI | NULL    |       |
| name          | varchar(100) | YES  |     | NULL    |       |
| date_of_birth | date         | YES  |     | NULL    |       |
| address       | varchar(200) | YES  |     | NULL    |       |
| role          | varchar(50)  | YES  |     | NULL    |       |
| hospital_id   | int          | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> describe  prescriptions;;
+-------------------+--------------+------+-----+---------+-------+
| Field             | Type         | Null | Key | Default | Extra |
+-------------------+--------------+------+-----+---------+-------+
| prescription_id   | int          | NO   | PRI | NULL    |       |
| patient_id        | int          | YES  | MUL | NULL    |       |
| doctor_id         | int          | YES  | MUL | NULL    |       |
| medication        | varchar(100) | YES  |     | NULL    |       |
| prescription_date | date         | YES  |     | NULL    |       |
+-------------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

ERROR: 
No query specified

mysql> describe hospitals;
+----------------------+--------------+------+-----+---------+-------+
| Field                | Type         | Null | Key | Default | Extra |
+----------------------+--------------+------+-----+---------+-------+
| hospital_id          | int          | NO   | PRI | NULL    |       |
| name                 | varchar(100) | YES  |     | NULL    |       |
| address              | varchar(200) | YES  |     | NULL    |       |
| size                 | int          | YES  |     | NULL    |       |
| type                 | varchar(50)  | YES  |     | NULL    |       |
| accreditation_status | varchar(50)  | YES  |     | NULL    |       |
+----------------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> head hospitals
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'head hospitals' at line 1
mysql> Read from remote host 10.121.4.235: Operation timed out
Connection to 10.121.4.235 closed.
client_loop: send disconnect: Broken pipe
(base) ola@Olaoluwas-MacBook-Pro ~ % ssh -X -i/"Users/ola/Desktop/oa413/oa413.pem" ubuntu@10.121.4.235
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-153-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Oct 25 08:23:54 UTC 2025

  System load:  0.0                Processes:             218
  Usage of /:   70.6% of 48.27GB   Users logged in:       1
  Memory usage: 6%                 IPv4 address for ens3: 10.121.4.235
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

3 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

12 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


*** System restart required ***
Last login: Sat Oct 25 07:27:52 2025 from 10.46.73.208
ubuntu@oa413:~$ HDSOnline
HDSOnline: command not found
ubuntu@oa413:~$ cd ~health_project;
-bash: cd: ~health_project: No such file or directory
ubuntu@oa413:~$ cd ~/health_project;
ubuntu@oa413:~/health_project$ mysql --local-infile=1 -u hds -p

Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 73
Server version: 8.0.43-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use healhdb;
ERROR 1049 (42000): Unknown database 'healhdb'
mysql> use healthdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT * FROM hospitals LIMIT 5;
+-------------+-------------------------+-----------------------------------------------------------+------+-----------+----------------------+
| hospital_id | name                    | address                                                   | size | type      | accreditation_status |
+-------------+-------------------------+-----------------------------------------------------------+------+-----------+----------------------+
|           1 | Acevedo-Lee Hospital    | 2696 Robinson Flat Lake Nicholas, ID 92919                |  169 | Community | Not Accredited       |
|           2 | Kramer LLC Hospital     | 86649 Michael Groves Jonesmouth, VA 80169                 |   72 | Specialty | Accredited           |
|           3 | Le-Adkins Hospital      | 59769 Williams Meadows Apt. 326 South Lynnmouth, TX 78053 |   61 | Teaching  | Accredited           |
|           4 | Warren-Vasquez Hospital | 70076 Johnathan Station Suite 610 North Kathryn, RI 46802 |  169 | Community | Not Accredited       |
|           5 | Gonzalez PLC Hospital   | 2315 Mark Road Apt. 063 Debraview, MA 58537               |  187 | Research  | Accredited           |
+-------------+-------------------------+-----------------------------------------------------------+------+-----------+----------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM patients LIMIT 5;
+-----------+------------------+---------------+---------------------------------------------------+---------+-----------+
| person_id | name             | date_of_birth | address                                           | role    | doctor_id |
+-----------+------------------+---------------+---------------------------------------------------+---------+-----------+
|       101 | Anna Gregory     | 1963-07-10    | 138 Campbell Club Apt. 735 Port Phyllis, WI 61401 | Patient |        42 |
|       102 | Jeremiah Leonard | 2023-11-04    | PSC 6146, Box 5584 APO AA 17845                   | Patient |        68 |
|       103 | Debra Wise DDS   | 1960-07-14    | 74803 Paul Cape Suite 036 Brownshire, WA 51187    | Patient |        23 |
|       104 | Yvonne Powers    | 1998-03-09    | 21790 Jennifer Crescent Brookebury, OR 75432      | Patient |        13 |
|       105 | April Jones      | 1957-12-05    | 4838 Daniel Throughway East John, IN 22089        | Patient |        14 |
+-----------+------------------+---------------+---------------------------------------------------+---------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM doctors LIMIT 5;
+-----------+----------------------+---------------+----------------------------------------------------------+--------+-------------+
| person_id | name                 | date_of_birth | address                                                  | role   | hospital_id |
+-----------+----------------------+---------------+----------------------------------------------------------+--------+-------------+
|         1 | Dr. Joshua Wright    | 1971-10-11    | 291 Davis Drives Lake Sueside, MI 33513                  | Doctor |          22 |
|         2 | Dr. Ashley Hooper    | 1991-12-19    | 34614 Trevino Camp Andrewside, VT 84933                  | Doctor |          23 |
|         3 | Dr. Michael Robinson | 1968-09-24    | 12118 Fields Skyway Suite 213 West Carolynport, RI 59587 | Doctor |           2 |
|         4 | Dr. Brittany Zuniga  | 1970-09-11    | 16577 Martinez Estate Jennifershire, IL 24006            | Doctor |           7 |
|         5 | Dr. Lisa Gonzalez    | 1971-08-28    | 555 Torres Loop Reynoldsstad, SD 73282                   | Doctor |          30 |
+-----------+----------------------+---------------+----------------------------------------------------------+--------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM presriptions LIMIT 5;
ERROR 1146 (42S02): Table 'healthdb.presriptions' doesn't exist
mysql> SELECT * FROM prescriptions LIMIT 5;
+-----------------+------------+-----------+--------------+-------------------+
| prescription_id | patient_id | doctor_id | medication   | prescription_date |
+-----------------+------------+-----------+--------------+-------------------+
|               1 |        345 |        68 | Lisinopril   | 2023-10-23        |
|               2 |        631 |        12 | Atorvastatin | 2023-04-11        |
|               3 |        500 |        81 | Lisinopril   | 2023-10-26        |
|               4 |        570 |        69 | Omeprazole   | 2023-08-08        |
|               5 |        303 |         3 | Aspirin      | 2023-12-10        |
+-----------------+------------+-----------+--------------+-------------------+
5 rows in set (0.00 sec)

