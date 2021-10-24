-- 1. Выведите для каждого потока номер, год, месяц и день начала потока. Каждое значение отобразите в 
-- отдельном столбце.
-- 2. Получите идентификатор и номер потока, запланированного на самую позднюю дату.
-- 3. Покажите уникальные значения года по датам начала потоков обучения.
-- 4. Найдите количество преподавателей в базе данных. Выведите искомое значение в столбец с именем 
-- total_teachers.
-- 5. Покажите даты начала двух последних по времени потоков.
-- 6. Найдите среднюю успеваемости учеников по потокам преподавателя с идентификатором равным 1.
-- 7. Дополнительное задание (выполняется по желанию): найдите идентификаторы преподавателей, у которых 
-- средняя успеваемость по всем потокам меньше 4.8.

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
SELECT number, SUBSTR(started_at, 1, 4) || '-' || SUBSTR(started_at, 6, 2) || '-' || SUBSTR(started_at, 9, 2) FROM streams;

-- task 2
SELECT id, MAX(started_at) AS 'max_date' FROM streams ORDER BY ID DESC LIMIT 2;

-- task 3
SELECT DISTINCT(SUBSTR(started_at, 1, 4)) AS uniq_year FROM streams;

-- task 4
SELECT COUNT(*) AS 'total_teachers' FROM teachers;

-- task 5
SELECT number, started_at FROM streams ORDER BY ID DESC LIMIT 2;

-- task 6
SELECT teacher_id, AVG(perfomance) FROM academic_perfomance WHERE teacher_id = 1;

-- task 7
SELECT teacher_id FROM academic_perfomance GROUP BY teacher_id HAVING AVG(perfomance) < 4.8;
