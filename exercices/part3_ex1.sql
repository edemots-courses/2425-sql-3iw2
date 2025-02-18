-- 1.
SELECT male, count(*)
FROM student
GROUP BY male;

-- 2.
SELECT
    shop.name as shop_name,
    ROUND(CAST(AVG(price) AS numeric), 2) AS avg_price
FROM shop_can
INNER JOIN shop ON shop_can.shop_id = shop.id
GROUP BY shop_name, shop.id
ORDER BY avg_price DESC;

-- 3.
SELECT
    login,
    ROUND(CAST(SUM(price) AS numeric), 2) AS total_price
FROM student_can_shop
-- INNER JOIN shop_can
--     ON shop_can.shop_id = student_can_shop.shop_id
--     AND shop_can.can_id = student_can_shop.can_id
INNER JOIN shop_can USING(shop_id, can_id)
GROUP BY login
ORDER BY total_price DESC, login ASC;
