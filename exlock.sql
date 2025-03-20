-- Start a transaction
START TRANSACTION;
-- Acquire an exclusive lock on a specific row in the 'student3' table.
-- This prevents other transactions from modifying or reading that row.
SELECT * FROM student3 WHERE roll = 1 FOR UPDATE;
-- Perform operations on the locked row (e.g., update the marks).
UPDATE student3 SET marks = 95.5 WHERE roll = 1;
-- Commit the transaction to release the lock.
COMMIT;

-- Example of a lock on multiple rows.
START TRANSACTION;
SELECT * FROM student3 WHERE class = 'SY' FOR UPDATE;
UPDATE student3 SET marks = marks + 5 WHERE class = 'SY';
COMMIT;

-- Example of a lock on entire table.
START TRANSACTION;
LOCK TABLE student3 WRITE;
UPDATE student3 SET marks = marks + 1;
UNLOCK TABLES;
COMMIT;

-- Example of using NOWAIT to avoid waiting for a lock.

START TRANSACTION;
SELECT * FROM student3 WHERE roll = 2 FOR UPDATE NOWAIT;
-- If the lock is acquired, perform operations. otherwise error will be thrown.
UPDATE student3 SET marks = 89.0 WHERE roll = 2;
COMMIT;

-- Example of using SKIP LOCKED to skip rows that are locked.
START TRANSACTION;
SELECT * FROM student3 FOR UPDATE SKIP LOCKED;
-- operate on the unlocked rows.
UPDATE student3 SET marks = marks + 2 WHERE roll IN (SELECT roll FROM student3 FOR UPDATE SKIP LOCKED);
COMMIT;
