--Exercício 1: 
SELECT COUNT(id) AS "currentExperiences"
FROM experiences
WHERE "endDate" IS NOT NULL;

--Exercício 2:  
SELECT u.id, COUNT(e."schoolId") AS educations 
FROM educations e 
JOIN users u 
ON u.id= e."userId"
GROUP BY u.id;

--Exercício 3: 
SELECT u.name, COUNT(t."writerId") AS "testimonialCount"
FROM users u 
JOIN testimonials t
ON t."writerId" = u.id
WHERE t."writerId" = 435
GROUP BY u.name;

--Exercício 4: 
SELECT MAX(j.salary) AS "maximumSalary", r.name
FROM jobs j
JOIN roles r
ON j."roleId" = r.id
WHERE j.active = true
GROUP BY r.name
ORDER BY "maximumSalary" ASC;

--Bônus: 
SELECT s.name AS school, c.name AS course , COUNT(e.status) AS "studentsCount", e.status AS role
FROM educations e 
JOIN  schools s 
ON s.id = e."schoolId"
JOIN courses c 
ON c.id = e."courseId"
GROUP BY s.name, c.name, role
ORDER BY "studentsCount" DESC
OFFSET 0 LIMIT 3;