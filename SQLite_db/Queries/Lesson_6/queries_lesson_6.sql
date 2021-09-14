-- 1. Показать информацию по потокам. В отчет вывести номер потока, название курса и дату начала занятий.
-- 2. Найти общее количество учеников для каждого курса. В отчет вывести название курса и количество учеников 
-- по всем потокам курса.
-- 3. Найти среднюю оценку по всем потокам для всех учителей. В отчет вывести идентификатор, фамилию и имя учителя, 
-- среднюю оценку по всем проведенным потокам. Учителя, у которых не было потов, также должны попасть в выборку.

.tables
.header on
.mode column

SELECT * FROM streams;
SELECT * FROM courses;
SELECT * FROM teachers;
SELECT * FROM academic_perfomance;
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