-- 1. Найдите общее количество учеников для каждого курса. В отчёт выведите название курса и количество учеников 
-- по всем потокам курса. Решите задание с применением оконных функций.
-- 2. Найдите среднюю оценку по всем потокам для всех учителей. В отчёт выведите идентификатор, фамилию и 
-- имя учителя, среднюю оценку по всем проведённым потокам. Учителя, у которых не было потоков, также должны попасть в 
-- выборку. Решите задание с применением оконных функций.
-- 3. Какие индексы надо создать для максимально быстрого выполнения представленного запроса?

.tables
.header on
.mode column

SELECT * FROM streams;
--id  number  started_at  students_amount  course_id  finished_at
----  ------  ----------  ---------------  ---------  -----------
--1   165     2020-08-18  34               3                     
--2   178     2020-10-02  37               2                     
--3   203     2020-12-11  35               1                     
--4   210     2020-03-12  41               1           

SELECT * FROM courses;
--id  name                  
----  ----------------------
--1   Базы данных           
--2   Основы Python         
--3   Linux. Рабочая станция

SELECT * FROM teachers;
--id  name     surname   email                   email2
----  -------  --------  ----------------------  ------
--1   Николай  Савельев  saveliev.n@mai.ru             
--2   Наталья  Петрова   petrova.n@yandex.ru           
--3   Елена    Малышева  malisheva.e@google.com  

SELECT * FROM academic_perfomance;
--teacher_id  stream_id  perfomance
------------  ---------  ----------
--3           1.0        4.7       
--2           2.0        4.9       
--1           3.0        4.8       
--1           4.0        4.9  

-- task 1
--SELECT
--(SELECT name FROM courses WHERE streams.course_id = courses.id) AS name,
--SUM(students_amount) AS 'sum'
--FROM streams
--GROUP BY course_id;

SELECT DISTINCT
(SELECT name FROM courses WHERE streams.course_id = courses.id) AS name,
SUM(students_amount) OVER(PARTITION BY course_id) AS 'sum'
FROM streams;