CREATE VIEW View_Top_Students AS
WITH MaxMarks AS (
    SELECT 
        c.title AS course_title,
        s.faculty AS student_faculty,
        s.name,
        s.surname,
        e.mark,
        e.date,
        -- Rank students by mark within each course
        RANK() OVER (PARTITION BY e.cod_course ORDER BY e.mark DESC) as mark_rank
    FROM Exam e
    JOIN Student s ON e.student_id = s.student_id
    JOIN Course c ON e.cod_course = c.cod_course
)
SELECT 
    course_title,
    student_faculty,
    name,
    surname,
    mark,
    date
FROM MaxMarks
WHERE mark_rank = 1;