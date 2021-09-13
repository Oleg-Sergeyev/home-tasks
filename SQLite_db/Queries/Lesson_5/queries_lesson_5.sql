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

    SELECT * FROM streams;
    SELECT * FROM courses;

    SELECT
      (SELECT number FROM streams WHERE students_amount >= 40) AS num,
      name,
      (SELECT students_amount FROM streams WHERE students_amount > 40) AS amount
    FROM courses;