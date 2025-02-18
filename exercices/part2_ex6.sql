-- 1.
SELECT login, address.*
FROM student LEFT JOIN address ON address.id = student.address_id;
-- =
SELECT login, address.*
FROM address RIGHT JOIN student ON student.address_id = address.id;
