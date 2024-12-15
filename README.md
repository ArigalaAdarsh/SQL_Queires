# SQL Queries for Studies, Software, and Programmer Databases

## Overview

This repository contains SQL queries for managing and analyzing data from three different databases:

1. **studies**: A database containing information about individuals, their institutes, courses, and course fees.
2. **software**: A database containing details about software products, including the product name, title, development language, and cost-related data.
3. **programmer**: A database containing data about programmers, including personal details, professional skills, and salary information.

The project includes a variety of SQL queries used for data manipulation, analysis, and reporting. The objective is to provide insights from the data using these queries.

## Database Structure

### `studies` Table

The `studies` table contains information about students, their respective institutes, courses, and course fees.

#### Columns:
- **PNAME**: Name of the person.
- **INSTITUTE**: Name of the institute.
- **COURSE**: Name of the course.
- **COURSE_FEE**: The fee for the course.

```sql
CREATE TABLE studies(
    PNAME varchar(20),
    INSTITUTE varchar(20),
    COURSE varchar(20),
    COURSE_FEE int
);

INSERT INTO studies
VALUES 
('ANAND', 'SABHARI', 'PGDCA', 4500),
('ALTAF', 'COIT', 'DCA', 7200),
('JULIANA', 'BDPS', 'MCA', 22000),
('KAMALA', 'PRAGATHI', 'DCA', 5000),
('MARY', 'SABHARI', 'PGDCA', 4500);

### `software` Table

The `software` table stores information about software products, including the product name, title, development language, and cost-related data.

#### Columns:
- **PNAME**: Name of the person.
- **TITLE**: Title of the software product.
- **DEVELOPIN**: The language in which the software was developed.
- **SCOST**: Software cost.
- **DCOST**: Development cost.
- **SOLD**: Number of units sold.

```sql
CREATE TABLE software(
    PNAME varchar(20),
    TITLE varchar(20),
    DEVELOPIN varchar(20),
    SCOST decimal(10,2),
    DCOST int,
    SOLD int
);

INSERT INTO software 
VALUES 
('MARY', 'README', 'CPP', 300, 1200, 84),
('ANAND', 'PARACHUTES', 'BASIC', 399.95, 600, 43),
('VIMALA', 'VIDEO TITLING', 'PASCAL', 7500, 16000, 9),
('JULIANA', 'INVENTORY', 'COBOL', 3000, 3500, 1),
('KAMALA', 'PAYROLL PKG.', 'DBASE', 9000, 20000, 7),
('MARY', 'FINANCIAL ACCT.', 'ORACLE', 18000, 85000, 4),
('HONEY', 'CODE_GENERATOR', 'C', 4500, 20000, 23),
('RAM', 'CODE', 'C', 450, 2000, 2);

### `programmer` Table

The `programmer` table contains details about programmers, including their personal information, professional skills, and salary.

#### Columns:
- **PNAME**: Name of the person.
- **DOB**: Date of birth.
- **DOJ**: Date of joining the company.
- **GENDER**: Gender of the programmer.
- **PROF1**: First professional skill.
- **PROF2**: Second professional skill.
- **SALARY**: Salary of the programmer.

```sql
CREATE TABLE programmer(
    PNAME varchar(20),
    DOB date,
    DOJ date,
    GENDER varchar(1),
    PROF1 varchar(15),
    PROF2 varchar(15),
    SALARY int
);

INSERT INTO programmer 
VALUES 
('ANAND', '12-Apr-66', '21-Apr-92', 'M', 'PASCAL', 'BASIC', 3200),
('ALTAF', '02-Jul-64', '13-Nov-90', 'M', 'CLIPPER', 'COBOL', 2800),
('JULIANA', '31-Jan-60', '21-Apr-90', 'F', 'COBOL', 'COBOL', 3000),
('KAMALA', '30-Oct-65', '02-Jan-92', 'F', 'C', 'C', 2900),
('MARY', '24-Jun-65', '01-Feb-65', 'F', 'C', 'ORACLE', 4500);
```
### Conclusion
- This repository contains SQL scripts to create, insert, and query data for three different databases: studies, software, and programmer. The dataset provides a detailed analysis of various aspects like education, software development, and programmer profiles. You can extend this project by adding more queries to analyze trends, averages, and correlations within the data.
- This repository serves as a foundation for building queries to perform deeper analysis and insights on the data.
