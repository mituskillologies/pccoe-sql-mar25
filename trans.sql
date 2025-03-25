use college;
set autocommit = 0;
select * from student3;
start transaction;
savepoint first;  -- First Savepoint
insert into student3 values (9,'SY','Asha',56.78);
insert into student3 values (10,'TY','Ashish',73.37);
savepoint second; -- Second Savepoint
delete from student3 where roll = 3;
savepoint third;  -- third savepoint
update student3 set class = 'FY' where roll = 1;
