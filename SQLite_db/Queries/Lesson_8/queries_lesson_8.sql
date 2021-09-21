-- 1. Найдите общее количество учеников для каждого курса. В отчёт выведите название курса и количество учеников 
-- по всем потокам курса. Решите задание с применением оконных функций.
-- 2. Найдите среднюю оценку по всем потокам для всех учителей. В отчёт выведите идентификатор, фамилию и 
-- имя учителя, среднюю оценку по всем проведённым потокам. Учителя, у которых не было потоков, также должны попасть в 
-- выборку. Решите задание с применением оконных функций.
-- 3. Какие индексы надо создать для максимально быстрого выполнения представленного запроса?
-- 5. Дополнительное задание. Для каждого преподавателя выведите имя, фамилию, минимальное значение успеваемости по 
-- всем потокам преподавателя, название курса, который соответствует потоку с минимальным значением успеваемости, максимальное 
-- значение успеваемости по всем потокам преподавателя, название курса, соответствующий потоку с максимальным значением 
-- успеваемости, дату начала следующего потока. Выполните задачу с использованием оконных функций.

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

--task2
-- INSERT INTO teachers (id, name, surname, email) VALUES( 4,	'Сергей' , 'Филимонов' , 'philimonov.s@gmail.com');

--SELECT
--id,
--name,
--surname,
--AVG(academic_perfomance.perfomance) AS 'avg'
--FROM teachers
--LEFT JOIN academic_perfomance
--ON academic_perfomance.teacher_id = teachers.id
--GROUP BY id;

SELECT DISTINCT
  id,
  name,
  surname,
  AVG(academic_perfomance.perfomance) OVER(PARTITION BY teacher_id) AS 'avg'
FROM teachers
  LEFT JOIN academic_perfomance
  ON academic_perfomance.teacher_id = teachers.id;

--task 3
-- 3. Какие индексы надо создать для максимально быстрого выполнения представленного запроса?
--SELECT
-- surname,
--  name,
--  number,
--  perfomance
--FROM academic_perfomance
--  JOIN teachers 
--    ON academic_perfomance.teacher_id = teachers.id
-- JOIN streams
--    ON academic_perfomance.stream_id = streams.id
--WHERE number >= 200;  

CREATE INDEX streams_number_idx ON streams(number);
-- Для ключей xxxxx_id, xxxxx.id индескы создаются автоматически, т.к СУБД построит индексы на такие 
-- столбцы без участия пользователя, согласно методичке. А если не создаст можно создать вручную.

-- task 5
-- Скорее всего не верно понял задание, реализавол не правильно.
-- А точнее не понял про -> 'дату начала следующего потока'.
CREATE VIEW min_perfomance AS
  SELECT
    teachers.id AS id,
    teachers.name AS name,
    teachers.surname AS surname,
    courses.name AS course,
    MIN(academic_perfomance.perfomance) AS min_
  FROM teachers
    JOIN courses
    ON courses.id = (SELECT course_id FROM streams WHERE streams.id = academic_perfomance.stream_id)
    JOIN academic_perfomance
    ON academic_perfomance.teacher_id = teachers.id
    JOIN streams
    ON academic_perfomance.stream_id = streams.id
    GROUP BY teachers.id;

CREATE VIEW max_perfomance AS
  SELECT
    teachers.id AS id,
    courses.name AS course,
    MAX(academic_perfomance.perfomance) AS max_,
    streams.started_at AS started_at
  FROM teachers
    JOIN courses
    ON courses.id = (SELECT course_id FROM streams WHERE streams.id = academic_perfomance.stream_id)
    JOIN academic_perfomance
    ON academic_perfomance.teacher_id = teachers.id
    JOIN streams
    ON academic_perfomance.stream_id = streams.id
    GROUP BY teachers.id;

SELECT DISTINCT
  min_perfomance.id AS id,
  min_perfomance.name AS name,
  min_perfomance.surname AS surname,
  min_perfomance.course AS course,
  min_perfomance.min_ AS min_,
  max_perfomance.course AS course,
  max_perfomance.max_ AS max_,
  max_perfomance.started_at AS started_at
FROM min_perfomance
JOIN max_perfomance
ON min_perfomance.id = max_perfomance.id;

DROP VIEW max_perfomance;
DROP VIEW min_perfomance;

-- Сообствено говоря вот тут не понятно, что делать с датой из потока... там только started_at, не следующая.
SELECT DISTINCT
  teachers.id AS id,
  teachers.name AS name,
  teachers.surname AS surname,
  courses.name AS course,
  MIN(academic_perfomance.perfomance) OVER(PARTITION BY academic_perfomance.teacher_id) AS min_,
  MAX(academic_perfomance.perfomance) OVER(PARTITION BY academic_perfomance.teacher_id) AS max_
FROM teachers
  JOIN courses
  ON courses.id = (SELECT course_id FROM streams WHERE streams.id = academic_perfomance.stream_id)
  JOIN academic_perfomance
  ON academic_perfomance.teacher_id = teachers.id
  JOIN streams
  ON academic_perfomance.stream_id = streams.id;
