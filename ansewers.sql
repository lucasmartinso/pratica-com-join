--Exercício 1: 
SELECT u.id,u.name,c.name AS city 
FROM users u 
JOIN cities c 
ON u."cityId" = c.id 
WHERE c.name= 'Rio de Janeiro' 
ORDER BY u.id ASC; 


--Exercício 2:  
SELECT t.id,u1.name AS writer, u2.name AS recipient, t.message 
FROM testimonials t 
JOIN users u1 
ON t."writerId"= u1.id 
JOIN users u2 
ON t."recipientId" = u2.id 
ORDER BY t.id ASC;

--Exercício 3:
  SELECT u.id, u.name, c.name AS course, s.name AS school, e."endDate" 
  FROM users u 
  JOIN educations e 
  ON u.id = e."userId" 
  JOIN schools s 
  ON e."schoolId" = s.id 
  JOIN courses c 
  ON e."courseId" = c.id 
  WHERE u.id=30 AND e.status= 'finished';

--Exercício 4:
  SELECT u.id, u.name, r.name AS "role", c.name AS company, e."startDate" 
  FROM experiences e 
  JOIN users u 
  ON e."userId" = u.id 
  JOIN roles r 
  ON r.id = e."roleId" 
  JOIN companies c 
  ON e."companyId" = c.id 
  WHERE u.id= 50 AND e."endDate" IS NULL;

  --Bônus: 
  SELECT s.id, s.name AS school, c.name AS course, co.name AS company, r.name AS role
    FROM educations edu
    JOIN schools s ON s.id = edu."schoolId"
    JOIN courses c ON c.id = edu."courseId"
    JOIN users u ON u.id= edu."userId"
    JOIN applicants app ON u.id= app."userId"
    JOIN jobs j ON j.id = app."jobId"
    JOIN companies co ON co.id = j."companyId"
    JOIN roles r ON r.id = j."roleId"
    WHERE r.name = 'Software Engineer' 
    AND co.id = 10 
    AND j.active = 'true';
