create database if not exists SHIVA;
use shiva;
create table STUDENT (
	Roll_No char(6) primary key,
    StudentName varchar(50),
    Course varchar(30),
    DOB date
);

select * from Enrollment;
create table SOCIETY (
	SocID char(6) primary key,
    SocName varchar(50),
    MentorName varchar(15),
    TotalSeats int(3)
);
    
create table ENROLLMENT (
	Roll_No char(6),
    SID char(6),
    DoE date,
    foreign key (Roll_NO) references student(Roll_No),
    foreign key (SID) references society(SocID)
);

insert into STUDENT 
(Roll_No, StudentName, Course, DOB)
values
('x10001', 'Alice', 'Computer Science', '2002-03-23'),
('x10002', 'Zachary', "Computer Science", '2002-02-12'),
('x10003', 'John', 'Computer Science', '2001-12-09'),
('x10004', 'Shiv', "Computer Science", "2003-05-18"),
('x10005', "Sunder", "Computer Science", "2002-08-28"),
('y10001', "Anil", "History", "2005-05-22"),
('y10002', "Babli", "History", "2000-01-01"),
('y10003', "Somya", "History", "1999-06-23"),
('y10004', "Amrit", "History", "2004-07-23"),
('y10005', "Sanskar", "History","2003-03-15");


insert into STUDENT
(Roll_No, StudentName, Course, DOB)
values
('z4002', 'Lakshmi','Political Science','2004-12-15'),
('z4001', 'Shiv', 'Political Science',"2000-12-05"),
('z4003', 'Radha', "Political Science", "2005-11-17"),
('z4004', "Manoj", "Political Science", "2002-01-24"),
('z4005', 'Sharita', "Political Science", "2003-04-15"),
('h50011', 'Sharita', "Maths", "2004-02-05"),
('h50012', "Babli", "Maths", "2000-05-28"),
('h50013', "Shubham", "Maths", "2005-02-23"),
('h50014', "Aryan", "Maths", "2001-10-15"),
('h50015', "Nikhil",  "Maths", "2003-11-04");


insert into SOCIETY
(SocID, SocName, MentorName, TotalSeats)
values
('s1', "NSS", "Dr. Gupta", 50),
('s2', "Debating", "Ms. Smith", 30),
('s3', "Dancing", "Mr. Sharma", 40),
('s4', "Sanskrit", "Mr. Verma", 20),
('s5', "Robotics", "Dr. Gupta", 25),
('s6', "Music", "Ms. Roy", 25),
('s7', "Art", "Mr. Kumar", 30),
('s8', "Drama", "Mr. Singh", 20);


insert into ENROLLMENT
(Roll_No, SID, DoE)
values
('x10001','s1','2022-01-15'),
('x10005','s4','2022-12-06'),
('x10004','s2','2022-11-05'),
('x10003','s4','2022-05-29'),
('y10004','s7','2022-05-13'),
('y10005','s2','2023-01-23'),
('y10003','s3',"2022-10-16"),
('y10002','s3','2023-11-08'),
('y10001','s6', '2022-06-19'),
('z4005','s5','2022-04-12'),
('z4004', 's3',"2022-04-18"),
('z4003','s1','2022-01-23'),
('z4001','s4','2022-08-17'),
('h50012', 's1','2022-04-15'),
('h50014','s2','2022-08-15'),
('h50013','s3','2013-01-11'),
('h50011','s4','2022-12-04'),
('h50012','s7','2023-01-29');

select * from SOCIETY;
/*1. Retrieve Names of Students Enrolled in Any Society*/
select distinct StudentName
from STUDENT S
JOIN ENROLLMENT E
on S.Roll_No = E.Roll_No;

/*2. Retrieve all society Names*/
select SocName
from SOCIETY; 

/*3. Retrieve Student Names Starting with 'A'*/
select StudentName
from STUDENT
where StudentName like 'A%';

/*4. Retrieve students' details studying in 'Computer Science' or 'Chemistry'*/
select * 
from STUDENT
where Course in ('Computer Science','Chemistry');

/*5. Retrieve students' names whose roll no either starts with 'X' or 'Z' and ends with '9'*/
select StudentName
from STUDENT 
where (Roll_No like 'X%' or Roll_No like 'Z%')
and Roll_No like '%9';

/*6. Find society details with more than N TotalSeats where N is to be input by the user.*/
select *
from SOCIETY
where TotalSeats > 35;

/*7. Update society table for the metor name of a specific society*/
update SOCIETY
set MentorName = "Shruti Sarma"
where SocID = 's4';

/*8. Find society names in which more than five students have enrolled*/
select SocName
from SOCIETY
where TotalSeats > 5;

/*9. Find the name of the youngest student enrolled in society "NSS"*/
select StudentName
from STUDENT s
join ENROLLMENT e on s.Roll_NO = e.Roll_No
where e.SID = 's1' 
order by s.DOB desc
limit 1;

/*10. Find the name of the most popula society (on the basis of enrolled students)*/
select SocName
from SOCIETY soc
join ENROLLMENT e on soc.SocID = e.SID
group by soc.SocName
order by count(e.Roll_No) desc
limit 1;

/*11.  Find the name of two least popular societies (on the basis of enrolled students)*/
select SocName
from SOCIETY sc
join ENROLLMENT e on sc.SocId = e.SID
group by sc.SocName
order by count(e.Roll_No)
limit 2;

/*12. Find the students names who are not enrolled in any society.*/
select StudentName
from STUDENT s
left join enrollment e on s.Roll_No = e.Roll_No
where e.Roll_No is null;

/*13. Find the students names enrolled in at least two societies*/
select StudentName
from STUDENT s
join ENROLLMENT e 
on s.Roll_No = e.Roll_No
group by s.StudentName
having count(distinct e.Roll_No) > 1;

/*14. Find society names in which maximum students are enrolled*/
select SocName
from SOCIETY soc
join ENROLLMENT e
on soc.SocID = e.SID
group by soc.SocName
order by count(e.Roll_No) desc
limit 1;

/*15. Find names of all students who have enrolled in any society and society names in which 
at least one student has enrolled*/
select StudentName
from STUDENT s
join ENROLLMENT e 
on e.Roll_No = s.Roll_No
where e.SID is not null;

/*16. Find names of student who are enrolled in any of the three societies "Debating",
"Dancing" and "Sashkant".*/
select StudentName
from STUDENT s
join ENROLLMENT e
on e.ROLL_NO = s.Roll_No
join SOCIETY soc
on e.SID = soc.SocID
where soc.SocName in ("Dancing", "Debating", "Sandhkant");

/*17. Find society names such that its mentor has a name with "Gupta" in it.*/
select SocName
from SOCIETY
where MentorName like "%Gupta";

/*18. Find the society names in which the number of enrolled students is 
only 10% of its capacity. */
select SocName
from SOCIETY soc
join ENROLLMENT e
on soc.SocID = e.SID
group by soc.SocName, soc.TotalSeats
having count(e.Roll_No) = 0.1 * soc.TotalSeats;

/*19. Display the vacant seats for each society.*/
select SocName, TotalSeats - count(e.Roll_no) as VacantSeat
from SOCIETY soc
left join ENROLLMENT e 
on soc.SocID = e.SID
group by soc.SocName, soc.TotalSeats;

/*20. Increment Total Seats of each society by 10%.alter*/
update SOCIETY
set TotalSeats = TotalSeats * 1.1;

/*21. Add the enrollement fee paid ('yes/no') field in the enrollment table*/
alter table ENROLLMENT
add column Enrollment_fee enum('yes','no') default 'no';

/*22. Update date of enrollment of society id 's1' to '2018-01-15', 's2' to 
the current date and 's3' to 2018-01-02'*/
update ENROLLMENT
set DoE = case
	when SID = 's1' then '2018-01-15'
    when SID = 's2' then curdate()
    when SID = 's3' then '2018-02-02'
end
where SID in ('s1','s2','s3');

/*23. Create a view to keep track of society names with the total number of 
students enrolled in it*/
create view society_enrollment_summary as 
select s.SocName,
count(e.Roll_No) as total_students
from SOCIETY s
left join ENROLLMENT e
on s.SocID = e.SID
group by s.SocName;

/*24. Find student names enrolled in all the societies.*/
select s.StudentName
from STUDENT s
join enrollment e on s.Roll_No = s.Roll_No
join SOCIETY soc
on soc.SocId = e.SID
group by s.Roll_No, s.StudentName;

/*25. Count the number of societies with more than 5 students enrolled in it*/
select count(*) as socities_count 
from (
	select 
    from enrollment
    group by society_id
    having count(student_id)>5
) as socities_with_more_than_5_students;


/*26. Add Column Mobile number in student table with default  value '9999999999'*/
alter table student
add Mobile_Number varchar(10) default '9999999999';

/*27. Find the total number of students whose age is >20 years.*/
select count(*) as total_Students_Above_20
from student
where datediff(curdate(), DOB) / 365 > 20;

/*28. Find names of students who were born in 2001 and are enrolled in at least one society.*/
select distinct S.StudentName
from student S
join enrollment E
on S.Roll_No = E.Roll_No
where year(S.DOB) = 2001;

/*29. Count all societties whose name starts with 'S' and ends with 't' and at least 5 students
are enrolled in the society*/
select count(*) as Total_Societies
from society S
join enrollment E 
on S.SocID = E.SID
where S.SocName like 'S%t'
group by S.SocID
having count(E.Roll_No) >= 5;

/*30. Display the followig information: 
1. Society name  2.Mentor Name 3. Ttoal Capacity  4. Total Enrolled 5.Unifilled Seats 
*/
select S.SocName as Society_Name,
	S.MentorName as Mentor_Name,
    S.TotalSeats as Total_Capacity,
    count(E.Roll_No) as Total_Enrolled,
    (S.TotalSeats - count(E.Roll_No)) as Unfilled_Seats
from society S
left join enrollment E on S.SocID = E.SID
group by S.SocID;

select * from ENROLLMENT;

show tables;
select * from society_enrollment_summary;