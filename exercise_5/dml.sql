-- PostgreSQL DML for University Database

-- Insert Professors
INSERT INTO Professor (surname, name) VALUES
('Rossi', 'Marco'),
('Bianchi', 'Laura'),
('Verdi', 'Giuseppe'),
('Neri', 'Anna'),
('Ferrari', 'Paolo');

-- Insert Courses
INSERT INTO Course (cod_course, faculty, title, employee_nr) VALUES
('CS101', 'Computer Science', 'Introduction to Programming', 1),
('CS201', 'Computer Science', 'Data Structures and Algorithms', 1),
('MATH101', 'Mathematics', 'Calculus I', 2),
('PHYS101', 'Physics', 'General Physics', 3),
('ENG101', 'Engineering', 'Engineering Fundamentals', 4),
('CS301', 'Computer Science', 'Database Systems', 5);

-- Insert Students
INSERT INTO Student (surname, name, faculty) VALUES
('Colombo', 'Giovanni', 'Computer Science'),
('Ricci', 'Maria', 'Computer Science'),
('Russo', 'Alessandro', 'Engineering'),
('Marino', 'Sofia', 'Mathematics'),
('Bruno', 'Luca', 'Computer Science'),
('Greco', 'Chiara', 'Physics');

-- Insert Study Plans (students enrolled in courses)
INSERT INTO StudyPlan (student_id, cod_course, year) VALUES
-- Giovanni Colombo
(1, 'CS101', 1),
(1, 'CS201', 1),
(1, 'MATH101', 1),
-- Maria Ricci
(2, 'CS101', 1),
(2, 'CS301', 2),
(2, 'MATH101', 1),
-- Alessandro Russo
(3, 'ENG101', 1),
(3, 'PHYS101', 1),
(3, 'MATH101', 1),
-- Sofia Marino
(4, 'MATH101', 1),
(4, 'PHYS101', 1),
(4, 'CS101', 2),
-- Luca Bruno
(5, 'CS101', 1),
(5, 'CS201', 1),
(5, 'CS301', 2),
-- Chiara Greco
(6, 'PHYS101', 1),
(6, 'MATH101', 1),
(6, 'CS101', 2);

-- Insert Exams (completed courses with marks)
INSERT INTO Exam (student_id, cod_course, mark, date) VALUES
-- Giovanni Colombo
(1, 'CS101', 28, '2024-06-15'),
(1, 'MATH101', 25, '2024-07-10'),
-- Maria Ricci
(2, 'CS101', 30, '2024-06-15'),
(2, 'MATH101', 27, '2024-07-10'),
-- Alessandro Russo
(3, 'ENG101', 26, '2024-06-20'),
(3, 'PHYS101', 24, '2024-07-05'),
-- Sofia Marino
(4, 'MATH101', 30, '2024-07-10'),
-- Luca Bruno
(5, 'CS101', 29, '2024-06-15'),
-- Chiara Greco
(6, 'PHYS101', 27, '2024-07-05');

-- Query to list the study plan of the first student
SELECT 
    s.name AS student_name,
    s.surname AS student_surname,
    c.title AS course_name,
    c.cod_course AS course_code,
    p.name AS professor_name,
    p.surname AS professor_surname
FROM StudyPlan sp
JOIN Student s ON sp.student_id = s.student_id
JOIN Course c ON sp.cod_course = c.cod_course
JOIN Professor p ON c.employee_nr = p.employee_nr
WHERE s.student_id = 1
ORDER BY sp.year, c.title;
