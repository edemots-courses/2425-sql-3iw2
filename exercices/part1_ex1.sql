DROP TABLE IF EXISTS can;
DROP TABLE IF EXISTS student;

-- 1.
CREATE TABLE can (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    capacity_cl INTEGER NOT NULL
    -- PRIMARY KEY(id)
);

-- 2.
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(64),
    lastname VARCHAR(64)
);

-- 3.
-- ALTER TABLE student
--     DROP COLUMN id,
--     ADD COLUMN login VARCHAR(8) PRIMARY KEY;
ALTER TABLE student
    RENAME COLUMN id TO login;
ALTER TABLE student
    ALTER COLUMN login TYPE VARCHAR(8),
    ALTER COLUMN login DROP DEFAULT;

-- 4.
CREATE TABLE student_can (
    student_id VARCHAR(8) REFERENCES student(login),
    can_id INTEGER,
    FOREIGN KEY(can_id) REFERENCES can(id)
);
