-- 1.
-- SELECT firstname, lastname, country
-- FROM student
-- INNER JOIN address ON address.id = student.address_id
-- WHERE country = 'United Kingdom';
SELECT firstname, lastname, country
FROM student, address
WHERE student.address_id = address.id
    AND country = 'United Kingdom';

-- 2.
SELECT login, can.name AS can_name, shop.name AS shop_name
FROM student_can_shop
INNER JOIN can ON can.id = student_can_shop.can_id
INNER JOIN shop ON shop.id = student_can_shop.shop_id;

-- 3.
SELECT firstname, lastname, purchase_time::date AS purchase_date
FROM student_can_shop
-- INNER JOIN student ON student.login = student_can_shop.login
INNER JOIN student USING(login)
INNER JOIN can ON can.id = student_can_shop.can_id
WHERE can.name = 'Coke' OR can.name = 'Diet Coke';

-- 4.
SELECT shop.name AS shop_name, can.name AS can_name
FROM shop_can
INNER JOIN shop ON shop.id = shop_can.shop_id
INNER JOIN can ON can.id = shop_can.can_id
ORDER BY shop_name ASC, can_name DESC;
