-- Example of a deadlock scenario (requires two separate MySQL client sessions):

-- Session 1:
START TRANSACTION;
UPDATE student3 SET marks = 86.0 WHERE roll = 1; -- Locks row with roll = 1
-- DO NOT COMMIT YET

-- Session 2:
START TRANSACTION;
UPDATE student3 SET marks = 91.0 WHERE roll = 2; -- Locks row with roll = 2
-- DO NOT COMMIT YET

-- Session 1 (after Session 2 has started):
UPDATE student3 SET marks = 87.0 WHERE roll = 2; -- Waits for Session 2 to release lock on roll = 2

-- Session 2 (after Session 1 has attempted to lock roll=2):
UPDATE student3 SET marks = 93.0 WHERE roll = 1; -- Waits for Session 1 to release lock on roll = 1

