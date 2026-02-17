
-- Exercise 6: Altering a Table
ALTER TABLE Student 
ADD COLUMN BirthDate DATE;

-- Adding a new column with a default value
ALTER TABLE Course 
ADD COLUMN Description VARCHAR(255) DEFAULT 'No Description';

-- Modifying an existing column's data type
ALTER TABLE Professor 
ALTER COLUMN employee_nr TYPE VARCHAR(255);

-- Adding a new constraint to an existing column
ALTER TABLE Exam 
ADD CONSTRAINT chk_mark_range CHECK (mark >= 18 AND mark <= 30);

-- Removing a column from a table
ALTER TABLE Course 
DROP COLUMN Description;

-- Renaming a column
ALTER TABLE Professor 
RENAME COLUMN employee_nr TO EmployeeNr;

-- Renaming tables
ALTER TABLE Professor RENAME TO T_Professor;
ALTER TABLE Course RENAME TO T_Course;
ALTER TABLE Student RENAME TO T_Student;
ALTER TABLE StudyPlan RENAME TO T_StudyPlan;
ALTER TABLE Exam RENAME TO T_Exam;