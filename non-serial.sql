SET autocommit = 0;

-- Transaction 1
START TRANSACTION;
SELECT * from student3;
UPDATE student3 SET marks = marks + 2.45 WHERE roll = 1;

	-- Transaction 2
	START TRANSACTION;
	UPDATE student3 SET marks = marks + 0.56 WHERE roll = 2;
	INSERT INTO student3 values (13,'FY','Nita',67.93);

	-- Commit Transaction 2
	COMMIT;

-- Commit Transaction 1
COMMIT;
SELECT * from student3;
