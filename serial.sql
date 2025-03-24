set autocommit = 0;
-- Set the isolation level to SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Transaction 1
START TRANSACTION;
SELECT * from student3;
UPDATE student3
SET marks = marks + 2.08 WHERE roll = 1;
SELECT * from student3;
COMMIT;

-- Transaction 2
START TRANSACTION;
UPDATE student3
SET marks = marks - 0.67 WHERE roll = 2;
SELECT * from student3;
COMMIT;
