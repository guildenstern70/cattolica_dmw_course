-- PostgreSQL DDL for University Database

-- Create Professor table
CREATE TABLE Professor (
    employee_nr SERIAL PRIMARY KEY,
    surname VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- Create Course table
CREATE TABLE Course (
    cod_course VARCHAR(20) PRIMARY KEY,
    faculty VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    employee_nr INTEGER NOT NULL,
    FOREIGN KEY (employee_nr) REFERENCES Professor(employee_nr) ON DELETE RESTRICT
);

-- Create Student table
CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    surname VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    faculty VARCHAR(100) NOT NULL
);

-- Create StudyPlan table (many-to-many relationship between Student and Course)
CREATE TABLE StudyPlan (
    student_id INTEGER NOT NULL,
    cod_course VARCHAR(20) NOT NULL,
    year INTEGER NOT NULL CHECK (year > 0),
    PRIMARY KEY (student_id, cod_course),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (cod_course) REFERENCES Course(cod_course) ON DELETE CASCADE
);

-- Create Exam table
CREATE TABLE Exam (
    student_id INTEGER NOT NULL,
    cod_course VARCHAR(20) NOT NULL,
    mark INTEGER NOT NULL CHECK (mark >= 0 AND mark <= 30),
    date DATE NOT NULL,
    PRIMARY KEY (student_id, cod_course),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (cod_course) REFERENCES Course(cod_course) ON DELETE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX idx_course_employee ON Course(employee_nr);
CREATE INDEX idx_course_faculty ON Course(faculty);
CREATE INDEX idx_student_faculty ON Student(faculty);
CREATE INDEX idx_studyplan_student ON StudyPlan(student_id);
CREATE INDEX idx_studyplan_course ON StudyPlan(cod_course);
CREATE INDEX idx_exam_student ON Exam(student_id);
CREATE INDEX idx_exam_course ON Exam(cod_course);
CREATE INDEX idx_exam_date ON Exam(date);
