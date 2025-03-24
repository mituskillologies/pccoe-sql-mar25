-- Create a log table
CREATE TABLE IF NOT EXISTS student_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    roll INT,
    action VARCHAR(10), -- 'INSERT', 'UPDATE', 'DELETE'
    old_marks FLOAT,
    new_marks FLOAT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a trigger for INSERT operations
DELIMITER //
CREATE TRIGGER student3_after_insert
AFTER INSERT ON student3
FOR EACH ROW
BEGIN
    INSERT INTO student_log (roll, action, new_marks) VALUES (NEW.roll, 'INSERT', NEW.marks);
END //

-- Create a trigger for UPDATE operations
CREATE TRIGGER student3_after_update
AFTER UPDATE ON student3
FOR EACH ROW
BEGIN
    INSERT INTO student_log (roll, action, old_marks, new_marks) VALUES (NEW.roll, 'UPDATE', OLD.marks, NEW.marks);
END //

-- Create a trigger for DELETE operations
CREATE TRIGGER student3_after_delete
AFTER DELETE ON student3
FOR EACH ROW
BEGIN
    INSERT INTO student_log (roll, action, old_marks) VALUES (OLD.roll, 'DELETE', OLD.marks);
END //
DELIMITER ;

-- Example usage
INSERT INTO student3 (roll, class, name, marks) VALUES (5, '12A', 'Eve', 95.0);
UPDATE student3 SET marks = 98.0 WHERE roll = 5;
DELETE FROM student3 WHERE roll = 5;

-- Check the log table
SELECT * FROM student_log;
