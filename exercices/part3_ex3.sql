-- 1.
SELECT *
FROM student
WHERE NOT EXISTS (
    SELECT * FROM student_can_shop
    WHERE student_can_shop.login = student.login
)
ORDER BY login;
-- =
SELECT *
FROM student
WHERE student.login NOT IN (
    SELECT login FROM student_can_shop
)
ORDER BY login;

-- 2.
SELECT *
FROM can
WHERE EXISTS (
    SELECT * FROM shop_can
    WHERE shop_can.shop_id = 1
        AND shop_can.can_id = can.id
);
-- =
SELECT *
FROM can
WHERE id IN (
    SELECT can_id
    FROM shop_can
    WHERE shop_id = 1
);

-- 3.
SELECT *
FROM student
WHERE login IN (
    SELECT login
    FROM student_can_shop
    ORDER BY purchase_time
    LIMIT 1
);
