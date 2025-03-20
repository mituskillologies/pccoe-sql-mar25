set autocommit = 0;
-- Set the isolation level to REPEATABLE READ (default in MySQL)
-- SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Transaction 1
START TRANSACTION;
set autocommit = 0;
SELECT * from student3;
UPDATE student3 SET marks = marks + 0.46 WHERE roll = 1;
-- Transaction 1 does not commit yet

-- Transaction 2
START TRANSACTION;
set autocommit = 0;
SELECT marks FROM student3 WHERE roll = 1;  
-- Transaction 2 reads the updated value
UPDATE student3 SET marks = marks - 0.78 WHERE roll = 1;
COMMIT;  -- Transaction 2 commits only after Transaction 1 commits

-- Transaction 1 commits
-- 	COMMIT;
SELECT * from student3;
