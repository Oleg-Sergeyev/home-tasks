-- 1. Показать информацию по потокам. В отчет вывести номер потока, название курса и дату начала занятий.
-- 2. Найти общее количество учеников для каждого курса. В отчет вывести название курса и количество учеников 
-- по всем потокам курса.
-- 3. Найти среднюю оценку по всем потокам для всех учителей. В отчет вывести идентификатор, фамилию и имя учителя, 
-- среднюю оценку по всем проведенным потокам. Учителя, у которых не было потов, также должны попасть в выборку.

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
SELECT
  number,
  courses.name,
  started_at
FROM streams 
  JOIN courses
  ON streams.course_id = courses.id;
-- task 2
SELECT
  courses.name,
  SUM(students_amount)
FROM streams JOIN courses
  ON streams.course_id = courses.id
  GROUP BY courses.name;
-- task 3
SELECT
  id, 
  surname || ' ' || name AS full_name,
  AVG(academic_perfomance.perfomance) AS avg_perfomane
FROM teachers
  LEFT JOIN academic_perfomance
  ON teachers.id = academic_perfomance.teacher_id
  GROUP BY id;