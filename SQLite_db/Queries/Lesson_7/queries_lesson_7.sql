-- 1. Создать представление, которое выводит название курса, номер последнего потока, дату начала обучения и 
-- среднюю успеваемость курса по всем потокам.
-- 2. Удалить из базы данных всю информацию, которая относится к преподавателю с идентификатором, равным 3. 
-- Выполнить все необходимые действия в транзакции.
-- 3. Создать триггер для таблицы academic_performance, который проверяет значение успеваемости на соответствие 
-- диапазону чисел между 0.1 и 5 включительно.

.tables
.header on
.mode column

SELECT * FROM streams;
SELECT * FROM courses;
SELECT * FROM teachers;
SELECT * FROM academic_perfomance;

-- task 1
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
    ON streams.course_id = courses.id;
SELECT * FROM last_course;
DROP VIEW last_course;

-- task 2