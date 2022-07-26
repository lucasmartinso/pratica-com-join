--Exercício 1: 
SELECT u.id,u.name,c.name AS city 
FROM users u 
JOIN cities c 
ON u."cityId" = c.id 
WHERE c.name= 'Rio de Janeiro' 
ORDER BY u.id ASC; 


--Exercício 2:  
SELECT t.id,u.name AS writer, u.name AS recipient, t.message 
FROM users u 
JOIN testimonials ts 
ON u.id = ts."recipientId" 
JOIN testimonials t 
ON u.id = t."writerId" 
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