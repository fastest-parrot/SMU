SELECT 
	s.name
FROM takes t
LEFT JOIN course c ON c.course_id = t.course_id
LEFT JOIN department d ON d.dept_name = c.dept_name
LEFT JOIN student s ON s.ID = t.ID
WHERE d.dept_name = 'Comp. Sci.'
GROUP BY s.name;

#OR USING DISTINCT

SELECT DISTINCT
	s.name
FROM takes t
LEFT JOIN course c ON c.course_id = t.course_id
LEFT JOIN department d ON d.dept_name = c.dept_name
LEFT JOIN student s ON s.ID = t.ID
WHERE d.dept_name = 'Comp. Sci.';

#this should be section_id not sec_id (fuck this book)
SELECT 
   st.ID, 
   Name
FROM takes t 
LEFT JOIN section s ON s.sec_id = t.sec_id AND s.course_id = t.course_id
LEFT JOIN student st ON st.ID = t.ID 
GROUP BY st.ID, st.Name
HAVING MIN(s.year) >= 2009;

SELECT
d.dept_name,
MAX(i.salary) as 'Max Salary'
FROM department d 
LEFT JOIN instructor i ON i.dept_name = d.dept_name
GROUP BY d.dept_name;

SELECT * FROM (
SELECT
d.dept_name,
MAX(i.salary) as 'MaxSalary'
FROM department d 
LEFT JOIN instructor i ON i.dept_name = d.dept_name
GROUP BY d.dept_name) AS temp ORDER BY MaxSalary ASC LIMIT 1

