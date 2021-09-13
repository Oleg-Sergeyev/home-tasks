    # 1. Найдите потоки, количество учеников в которых больше или равно 40. В отчет выведите номер потока, 
    # название курса и количество учеников.
    # 2. Найдите два потока с самыми низкими значениями успеваемости. В отчет выведите номер потока, название 
    # курса, фамилию и имя преподавателя (одним столбцом), оценку успеваемости.
    # 3. Найдите среднюю успеваемость всех потоков преподавателя Николая Савельева. В отчёт выведите идентификатор 
    # преподавателя и среднюю оценку по потокам.
    # 4. Найдите потоки преподавателя Натальи Петровой, а также потоки, по которым успеваемость ниже 4.8. В отчёт
    # выведите идентификатор потока, фамилию и имя преподавателя.  
    # 5. Дополнительное задание. Найдите разницу между средней успеваемостью преподавателя с наивысшим соответствующим 
    # значением и средней успеваемостью преподавателя с наименьшим значением. 
    # Средняя успеваемость считается по всем потокам преподавателя.

    .tables
    .header on
    .mode column

    SELECT * FROM streams;
    SELECT * FROM courses;
    SELECT * FROM teachers;
    SELECT * FROM academic_perfomance;

# task 1
    SELECT
      (SELECT number FROM streams WHERE students_amount >= 40) AS num,
      name,
      (SELECT students_amount FROM streams WHERE students_amount > 40) AS amount
    FROM courses;
# task 2
    SELECT
      (SELECT number FROM streams WHERE id = academic_perfomance.stream_id) AS stream_number,
      (SELECT name FROM courses WHERE academic_perfomance.stream_id = id) AS course_name,
      (SELECT surname || ' ' || name FROM teachers WHERE id = academic_perfomance.teacher_id ) AS full_name,
      perfomance
    FROM academic_perfomance
    GROUP BY perfomance HAVING MIN(perfomance) LIMIT 2;
# task 3
    SELECT
      teacher_id,
      AVG(perfomance) AS avg_perfomane
    FROM academic_perfomance
    WHERE teacher_id = (SELECT id FROM teachers WHERE name = 'Николай' AND surname = 'Савельев');
# task 4
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
    GROUP BY perfomance HAVING AVG(perfomance) < 4.8;
# task 5
      SELECT
        surname || ' ' || name AS full_name,
        (SELECT
          (AVG(perfomance)) || ' : ' ||
          (AVG(perfomance) - (SELECT MAX(perfomance) FROM academic_perfomance)) || ' : ' ||
          (AVG(perfomance) - (SELECT MIN(perfomance) FROM academic_perfomance))
        FROM academic_perfomance
        WHERE teacher_id = id) AS 'avg : avg - max : avg - min'
      FROM teachers;
