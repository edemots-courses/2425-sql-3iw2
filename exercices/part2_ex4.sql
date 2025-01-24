-- 1.
SELECT
    login,
    purchase_time,
    CASE
        WHEN purchase_time < date '2016-01-31' THEN 'ancien'
        WHEN purchase_time BETWEEN date '2016-02-01' AND date '2016-02-10' THEN 'périmé'
        ELSE 'actuel'
    END AS label
FROM student_can_shop
ORDER BY purchase_time;

-- 2.
SELECT
    name,
    CASE id
        WHEN 1 THEN 'lab_yaka'
        WHEN 2 THEN 'crocus'
        WHEN 3 THEN 'dispenser'
    END AS label
FROM shop
ORDER BY label;
