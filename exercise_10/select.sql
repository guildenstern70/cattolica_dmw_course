SELECT 
    S.StudentId, 
    S.Surname, 
    S.Name, 
    AVG(E.Mark) AS GlobalAverage
FROM 
    Student S
JOIN 
    Exam E ON S.StudentId = E.StudentId
GROUP BY 
    S.StudentId, 
    S.Surname, 
    S.Name;