-- 1.
SELECT firstname, lastname
FROM student
WHERE firstname LIKE 'J%';

-- 2.
SELECT firstname, lastname
FROM student
WHERE length(firstname) <= 5;

-- 3.
SELECT firstname, lastname
FROM student
WHERE firstname ILIKE 'aRnAuD';
