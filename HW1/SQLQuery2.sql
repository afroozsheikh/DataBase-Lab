-------------------- Part 1 of second question

SELECT Departments.Name, Departments.ID, Budget, Departments.Category
FROM Students, Departments
WHERE Departments.ID = Students.DepartmentID and Students.StudentNumber = '123';


-------------------- Part 2 of second question

UPDATE Taken_Courses
SET Grade = Grade + 1

-------------------- Part 3 of second question

SELECT S.FirstName, S.LastName, S.StudentNumber
FROM Students as S, Taken_Courses
WHERE Taken_Courses.StudentID = S.StudentNumber and '876' not in
(SELECT CourseID
FROM Taken_Courses
WHERE S.StudentNumber = Taken_Courses.StudentID
)


