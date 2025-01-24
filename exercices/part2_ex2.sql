-- 1.
SELECT login, purchase_time
FROM student_can_shop
-- WHERE purchase_time::date = '2016-01-25'
WHERE purchase_time >= timestamp '2016-01-25 00:00:00'
    AND purchase_time <= timestamp '2016-01-25 23:59:59';

-- 2.
SELECT timestamp '2016-06-01 10:56:00';

-- 3.
SELECT timestamp '2016-06-01 10:56:00' - timestamp '2016-05-19' AS interval;

-- 4.
SELECT
    extract(day from purchase_time) AS day,
    extract(month from purchase_time) AS month,
    extract(year from purchase_time) AS year
FROM student_can_shop
