-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/VunISl
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(85)   NOT NULL,
    "last_name" varcahr(85)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salary" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "title" (
    "emp_no" int   NOT NULL,
    "title" varchar(85)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar(85)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

--##########################################
--	Data insertion from CSV through script
--##########################################

-- COPY employee FROM 'C:\Users\sonal\Documents\DSSubmission\sql-challenge\EmployeeSQL\data\employees.csv' DELIMITER ',' CSV HEADER;

-- COPY departments FROM 'C:\Users\sonal\Documents\DSSubmission\sql-challenge\EmployeeSQL\data\departments.csv' DELIMITER ',' CSV HEADER;

-- COPY dept_manager FROM 'C:\Users\sonal\Documents\DSSubmission\sql-challenge\EmployeeSQL\data\dept_manager.csv' DELIMITER ',' CSV HEADER;

-- COPY dept_emp FROM 'C:\Users\sonal\Documents\DSSubmission\sql-challenge\EmployeeSQL\data\dept_emp.csv' DELIMITER ',' CSV HEADER;

-- COPY title FROM 'C:\Users\sonal\Documents\DSSubmission\sql-challenge\EmployeeSQL\data\titles.csv' DELIMITER ',' CSV HEADER;

-- COPY salary FROM 'C:\Users\sonal\Documents\DSSubmission\sql-challenge\EmployeeSQL\data\salaries.csv' DELIMITER ',' CSV HEADER;