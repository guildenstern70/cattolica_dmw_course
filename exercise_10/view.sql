CREATE VIEW StudentStudyPlanView AS
SELECT 
    S.Surname AS StudentSurname, 
    C.Title AS CourseTitle, 
    P.Surname AS ProfessorSurname, 
    E.Mark
FROM 
    StudyPlan SP
JOIN 
    Student S ON SP.StudentId = S.StudentId
JOIN 
    Course C ON SP.CourseId = C.CourseId
JOIN 
    Professor P ON C.Professor = P.ProfessorId
LEFT JOIN 
    Exam E ON SP.StudentId = E.StudentId AND SP.CourseId = E.CourseId;