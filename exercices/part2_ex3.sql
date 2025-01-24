-- 1.
SELECT name AS can_name, capacity_cl
FROM can
-- WHERE capacity_cl >= 30 AND capacity_cl <= 40;
WHERE capacity_cl BETWEEN 30 AND 40;

-- 2.
SELECT login, firstname, lastname
FROM student
WHERE firstname IS NULL;

-- 3.
SELECT login, purchase_time::date as purchase_date
FROM student_can_shop
WHERE purchase_time BETWEEN date '2016-02-01' AND date '2016-02-11'
ORDER BY login;

-- 4.
SELECT COALESCE(firstname, 'no_name') AS firstname
FROM student;
