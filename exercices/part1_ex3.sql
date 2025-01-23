-- 1.
-- INSERT INTO can
-- VALUES (DEFAULT, 'Red Bull', 33),
--        (DEFAULT, 'jus de pomme', 33);
INSERT INTO can (name, capacity_cl)
VALUES ('Red Bull', 33),
       ('jus de pomme', 33);

-- 2.
INSERT INTO student (login, firstname, lastname, male, address_id)
VALUES ('edemots', 'Eliot', 'Demots', TRUE, NULL),
       ('julien', 'Julien', 'D', TRUE, NULL),
       ('julie', 'Julie', 'D', FALSE, NULL);

-- 3.
UPDATE can
SET name = 'jus d''ananas'
-- WHERE name = 'jus de pomme';
WHERE id = 12;

-- 4.
DELETE FROM can
-- WHERE name = 'Red Bull';
WHERE id = 11;
