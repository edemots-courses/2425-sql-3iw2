-- 1.
CREATE OR REPLACE VIEW v_student_can (login, can_name) AS
    SELECT login, can.name
    FROM student_can_shop
    INNER JOIN can ON student_can_shop.can_id = can.id
    ORDER BY login ASC, can.name ASC;

-- SELECT * FROM v_student_can;

-- 2.
CREATE OR REPLACE VIEW v_shop_time (can_name, shop_name, purchase_hour) AS
    SELECT can.name, shop.name, EXTRACT(hour from purchase_time) AS purchase_hour
    FROM student_can_shop
    INNER JOIN can ON student_can_shop.can_id = can.id
    INNER JOIN shop ON student_can_shop.shop_id = shop.id
    ORDER BY shop.name ASC, purchase_hour ASC;

SELECT * FROM v_shop_time;
