-- 1. Найдите потоки, количество учеников в которых больше или равно 40. В отчет выведите номер потока, 
-- название курса и количество учеников.
-- 2. Найдите два потока с самыми низкими значениями успеваемости. В отчет выведите номер потока, название 
-- курса, фамилию и имя преподавателя (одним столбцом), оценку успеваемости.
-- 3. Найдите среднюю успеваемость всех потоков преподавателя Николая Савельева. В отчёт выведите идентификатор 
-- преподавателя и среднюю оценку по потокам.
-- 4. Найдите потоки преподавателя Натальи Петровой, а также потоки, по которым успеваемость ниже 4.8. В отчёт
-- выведите идентификатор потока, фамилию и имя преподавателя.  
-- 5. Дополнительное задание. Найдите разницу между средней успеваемостью преподавателя с наивысшим соответствующим 
-- значением и средней успеваемостью преподавателя с наименьшим значением. 
-- Средняя успеваемость считается по всем потокам преподавателя.

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
  number AS num,
  (SELECT name FROM courses WHERE course_id = id) AS name,
  students_amount AS amount
FROM streams
WHERE students_amount >= 40;

-- task 2
SELECT
  (SELECT number FROM streams WHERE id = academic_perfomance.stream_id) AS stream_number,
  (SELECT name FROM courses WHERE academic_perfomance.stream_id = id) AS course_name,
  (SELECT surname || ' ' || name FROM teachers WHERE id = academic_perfomance.teacher_id ) AS full_name,
  perfomance
FROM academic_perfomance
ORDER BY perfomance ASC LIMIT 2;

-- task 3
SELECT
  teacher_id,
  AVG(perfomance) AS avg_perfomane
  FROM academic_perfomance
WHERE teacher_id = (SELECT id FROM teachers WHERE name = 'Николай' AND surname = 'Савельев');

-- task 4
SELECT
  (SELECT number FROM streams WHERE id = academic_perfomance.stream_id) AS stream_number,
  (SELECT surname || ' ' || name FROM teachers WHERE id = academic_perfomance.teacher_id ) AS full_name,
    perfomance
    FROM academic_perfomance
    WHERE teacher_id = (SELECT id FROM teachers WHERE name = 'Наталья' AND surname = 'Петрова')
    UNION
    SELECT
      (SELECT number FROM streams WHERE id = academic_perfomance.stream_id) AS stream_number,
      (SELECT surname || ' ' || name FROM teachers WHERE id = academic_perfomance.teacher_id ) AS full_name,
      perfomance
FROM academic_perfomance
WHERE perfomance < 4.8;

-- task 5

SELECT
  surname || ' ' || name AS full_name,
  (SELECT round((MAX(perfomance) - MIN(perfomance)) / COUNT(*), 2)
    FROM academic_perfomance
    WHERE teacher_id = id) AS '(max-min)/count'
FROM teachers;
