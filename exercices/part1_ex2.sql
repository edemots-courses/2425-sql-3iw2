-- 1.
SELECT name AS can FROM can
ORDER BY name ASC;

-- 2.
SELECT name, capacity_cl FROM can
WHERE capacity_cl > 30;

-- 3.
SELECT login FROM student
WHERE male = true
ORDER BY login ASC;

-- 4.
SELECT firstname FROM student
ORDER BY firstname ASC
LIMIT 10;

-- 5.
SELECT firstname FROM student
ORDER BY firstname ASC
LIMIT 10 OFFSET 2;
