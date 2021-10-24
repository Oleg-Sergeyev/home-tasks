-- 1. Создать представление, которое выводит название курса, номер последнего потока, дату начала обучения и 
-- среднюю успеваемость курса по всем потокам.
-- 2. Удалить из базы данных всю информацию, которая относится к преподавателю с идентификатором, равным 3. 
-- Выполнить все необходимые действия в транзакции.
-- 3. Создать триггер для таблицы academic_performance, который проверяет значение успеваемости на соответствие 
-- диапазону чисел между 0.1 и 5 включительно.
-- 4. Дополнительное задание. Создайте триггер для таблицы потоков, который проверяет, что дата начала потока больше 
-- текущей даты, а номер потока имеет наибольшее значение среди существующих номеров. При невыполнении условий необходимо 
-- вызвать ошибку с информативным сообщением.

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
-- Нам нужно получить данные по каждому курсу, добавьте группировку по курсу.
-- Для streams.number также нужно найти максимальное значение, для каждой группы это будет номер последнего потока курса.
CREATE VIEW last_course AS
  SELECT
    courses.name,
    streams.number,
    MAX(started_at) AS 'started_at',
    AVG(academic_perfomance.perfomance) AS avg_perfomane
  FROM streams
    JOIN academic_perfomance
    ON academic_perfomance.stream_id = streams.id
    JOIN courses
    ON streams.course_id = courses.id
    GROUP BY streams.course_id HAVING MAX(streams.number);
SELECT * FROM last_course;
DROP VIEW last_course;

-- task 2
BEGIN TRANSACTION;
  DELETE FROM academic_perfomance WHERE teachers_id = 3;
  DELETE FROM teachers WHERE id = 3;
--COMMIT;  
ROLLBACK;

-- task 3
CREATE TRIGGER check_perfomance BEFORE INSERT
ON academic_perfomance
BEGIN
  SELECT CASE 
    WHEN    
      (NEW.perfomance NOT BETWEEN 0.5 AND 5)
    THEN
    RAISE(ABORT, 'Perfomance is out of range (0.5 - 5)!')
  END;
END;
INSERT INTO academic_perfomance (teacher_id, stream_id, perfomance) VALUES (3, 1, 7);
--sqlite> INSERT INTO academic_perfomance (teacher_id, stream_id, perfomance) VALUES (3, 1, 7);
--Error: Perfomance is out of range (0.5 - 5)!

-- task 4
CREATE TRIGGER check_new_stream BEFORE INSERT
ON streams
BEGIN
  SELECT CASE
    WHEN    
      (datetime(NEW.started_at,'localtime') < (SELECT CURRENT_TIMESTAMP))
    THEN
    RAISE(ABORT, 'Started date is not correct!')
    WHEN    
      (NEW.number < (SELECT MAX(number) FROM streams))
    THEN
    RAISE(ABORT, 'Stream number less than existing!')
  END;
END;
INSERT INTO streams (`number`, started_at, students_amount, course_id) VALUES (209, '2020-10-02', 75, 3);
--sqlite> INSERT INTO streams (`number`, started_at, students_amount, course_id) VALUES (209, '2020-10-02', 75, 3);
--Error: Started date is not correct!
INSERT INTO streams (`number`, started_at, students_amount, course_id) VALUES (209, '2021-10-30', 75, 3);
--sqlite> INSERT INTO streams (`number`, started_at, students_amount, course_id) VALUES (209, '2021-10-30', 75, 3);
--Error: Stream number less than existing!
DROP TRIGGER check_new_stream;