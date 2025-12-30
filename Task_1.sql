--DATABASE CREATION
CREATE DATABASE kesavan_db
GO

--USE DATABASE
use kesavan_db
GO


/*
CREATE TABLE Employees (
   EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50)
);
*/
--Project Table
CREATE TABLE project
(
	project_id INT IDENTITY(1,1) PRIMARY KEY,
	project_name VARCHAR(150) UNIQUE NOT NULL,
	starts_date DATE NOT NULL,
	end_date DATE NOT NULL,
	budget MONEY ,
	statuss VARCHAR(50) DEFAULT 'Not Started',

	--Constraints for end date field
	    CONSTRAINT CHECK_end_date_After_starts_date 
        CHECK (end_date >= starts_date),
)
GO

--Inserting values:
INSERT INTO project (project_name, starts_date, end_date, budget, statuss)
VALUES 
    ('Website Redesign', '2024-01-01', '2024-06-30', 15000.00, 'In Progress'),
    ('Mobile App Development', '2024-02-15', '2024-07-15', 25000.00, 'Not Started'),
    ('Market Research', '2024-03-01', '2024-05-31', 10000.00, 'Completed'),
    ('Annual Report Preparation', '2024-04-01', '2024-12-31', 12000.00, 'In Progress')
GO

--Display Output;
SELECT *
FROM project
GO

--checking if the default values are set or not
INSERT INTO project (project_name, starts_date, end_date, budget, statuss)
VALUES 
    ('Website design', '2025-04-08', '2026-06-30', 15040.00,'check');

SELECT *
FROM project

--EXEC sp_help 'project';

--task table creation
CREATE TABLE task(
	task_id INT IDENTITY(1,1) PRIMARY KEY,
	task_name VARCHAR(150) NOT NULL,
	descriptions VARCHAR(255) NOT NULL,
	starts_date DATE NOT NULL,
	due_date DATE NOT NULL,
		--Constraints for end date field
	    CONSTRAINT CHECK_end_date_After_starts_date 
          CHECK (due_date >= starts_date),
	prioritys VARCHAR(150) 
		CONSTRAINT CK_Task_Priority CHECK (prioritys IN ('Low', 'Medium', 'High')),
	statuss VARCHAR(70) DEFAULT 'Pending',
	project_id INT FOREIGN KEY REFERENCES project(project_id)
);

