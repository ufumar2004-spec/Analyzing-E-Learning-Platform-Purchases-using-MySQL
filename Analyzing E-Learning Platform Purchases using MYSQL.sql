create database if not exists online_learning;
use online_learning;

create table learners(
learner_Id INT Primary Key auto_increment,
full_name varchar(100),
country varchar(50)
);

create table courses(
course_Id INT primary key auto_increment,
course_name varchar(100),
category varchar(100),
unit_price decimal(10,2)
);

create table purchase(
purchase_Id INT Primary key auto_increment,
learner_ID INT,
course_Id INT,
quantity INT,
purchase_date date,
foreign key (learner_Id) references learners(learner_Id),
foreign key (course_Id) references courses(course_Id)
);


INSERT INTO learners(full_name,country)
VALUES('Ajith Kumar','India'),('John Peter','USA'),
('Mark Putin','Russia'),('Maria','UK'),('Adam Smith','Germany'),
('Andrew San','Japan'),('Adam william','Australia'),('John wilson','Africa');


INSERT INTO courses(course_name,category,unit_price)
VALUES('Data Analyst','Intermediate',500.00),('Data Scientist','Beginner',700.00),
('Software Testing','Advanced',450.00),('Full Stack','Intermediate',600.00),
('Cloud Computing','Beginner',650.00),('cyber securiy','Advanced',900.00),
('Devops','Intermediate',1000.00),('Ai Basics','Intermediate',800.00);

INSERT INTO purchase(learner_id,course_id,quantity,purchase_date)
VALUES(1,1,3,'2026-04-01'),(2,2,4,'2026-04-02'),(3,3,1,'2026-04-03'),(4,7,16,'2026-04-20'),
(5,5,1,'2026-05-01'),(6,6,5,'2026-04-24'),(7,7,3,'2026-04-14'),(8,8,5,'2026-04-30');

select * from learners;
select*from courses;
select * from purchase;

-- Data exploration using Joins
select l.learner_Id,l.full_name,
format(sum(p.quantity * c.unit_price) ,2) as total_spent
from learners l
join purchase p on l.learner_Id=p.learner_Id
join courses c on c.course_Id =p.course_Id
Group by l.learner_Id,l.full_name
order by total_spent desc;

-- Inner Join
select l.full_name as learner_name,c.course_name,
c.category,p.quantity,
ROUND(Sum(p.quantity * c.unit_price), 2) as total_amount,
p.purchase_date 
from learners l
Inner Join purchase p on l.learner_Id = p.learner_Id
Inner Join courses c on p.course_Id = c.course_Id
Group by l.full_name,c.course_name,c.category,p.quantity,p.purchase_date
order by total_amount desc;

-- Left Join
select l.full_name as learner_name, c.course_name,
c.category,p.quantity,
ROUND(Sum(p.quantity * c.unit_price), 2) as total_amount,
p.purchase_date 
from learners l
Left Join purchase p on l.learner_Id = p.learner_Id
Left Join courses c on p.course_Id = c.course_Id
Group by l.full_name,c.course_name,c.category,p.quantity,p.purchase_date
order by total_amount desc;

-- Right Join
select l.full_name as learner_name,c.course_name,
c.category,p.quantity,
ROUND(Sum(p.quantity * c.unit_price), 2) as total_amount,
p.purchase_date 
from learners l
Right Join purchase p on l.learner_Id = p.learner_Id
Right  Join courses c on p.course_Id = c.course_Id
Group by l.full_name,c.course_name,c.category,p.quantity,p.purchase_date
order by total_amount desc;

-- Analytical Query

select l.full_name as learner_name,l.country,
ROUND(Sum(p.quantity * c.unit_price) ,2) as total_spending
from learners l
Inner join purchase p on p.learner_id = l.learner_Id
Inner join courses c on c.course_Id = p.course_Id
Group by l.full_name,l.country
order by total_spending DESC;

select c.course_Id,c.course_name,
(Sum(p.quantity)) as total_quantity_sold
from courses c 
Inner join purchase p on c.course_Id = p.course_Id
Group by c.course_Id,c.course_name
order by total_quantity_sold desc
Limit 3;

select c.category,
ROUND(Sum(p.quantity * c.unit_price) ,2) as total_revenue,
count(DISTINCT (p.learner_Id)) as Unique_learner
from courses c
Inner join purchase p on p.course_Id=c.course_Id
Group by c.category
order by unique_learner DESC;

select l.learner_Id,l.full_name as learner_name
from learners l
join purchase p on p.learner_Id = l.learner_Id
 Join courses c  on c.course_Id = p.course_Id
Group by l.learner_Id,l.full_name
Having count(Distinct c.category>1);

select c.course_Id,c.course_name,c.category
from courses c
left join purchase p on p.course_Id = c.course_Id
where p.course_Id IS NULL;






