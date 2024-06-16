CREATE TABLE student_names(
    student_id INT,
    name VARCHAR(50)
);
INSERT INTO student_names (student_id, name) VALUES
(1, 'RAM'),
(2, 'ROBERT'),
(3, 'ROHIM'),
(4, 'RAM'),
(5, 'ROBERT');

/* Get the count of distint student that are not unique */

-- ANSWER

select * from student_names;

select count(*) from
(select name,
       count(*) as cnt
from  student_names
group by name 
having count(*) =1)as a ;
