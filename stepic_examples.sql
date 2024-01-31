-- https://stepik.org/lesson/499065/step/2?unit=490593
-- Введите запрос, который выведет только профессии из БД, приведённой в уроке, которые заканчиваются на букву "а". Эти профессии должны быть выведены по алфавиту. 
--Введите запрос в одну строку. Все слова в запросе разделяйте ровно одним пробелом. 
--ASC дописывать не надо. Используйте одинарные кавычки.
SELECT profession
FROM professions
WHERE profession like '%а' 
    

    
ORDER BY profession --Найдите количество людей с именем Андрей в возрасте от 45 до 55 лет включительно. 
SELECT COUNT()
FROM users
WHERE age BETWEEN 45 AND 55
    AND name = 'Андрей' 


   
    -- Найдите количество людей с именами: Никита, Антон, Ольга, Елена в возрасте младше 60 лет. Совет: Используйте "IN".
SELECT COUNT()
FROM users
WHERE name IN ('Никита', 'Антон', 'Ольга', 'Елена')
    AND age < 60;
SELECT COUNT(*) AS row_count
FROM users
WHERE age BETWEEN 0 AND 59
    AND name IN ('Никита', 'Антон', 'Ольга', 'Елена');


--Найдите средний возраст людей, с именем Гертруда.
SELECT AVG(age)
FROM users
WHERE name = 'Гертруда' 


--найдите количество Биотехнологов и Кондитеров. Реализуйте это с помощью вложенного запроса.
SELECT COUNT()
FROM users
WHERE prof_id IN (
        SELECT id
        FROM professions
        WHERE profession IN ('Биотехнолог', 'Кондитер')
    );


/*Найдите количество людей, в имени которых есть буква "э" (в любом регистре), 
 которые младше, чем средний возраст всех людей, 
 которые работают Нефрологами или Геодезистами. Решите задачу, используя один запрос.*/
SELECT COUNT(*) AS row_count
FROM users
WHERE age < (
        SELECT AVG(age)
        FROM users
        WHERE prof_id IN (
                SELECT id
                FROM professions
                WHERE profession IN ('Нефролог', 'Геодезист')
            )
    )
    AND (
        name LIKE '%Э%'
        OR name LIKE '%э%'
    )


-- Измените возраст всех людей, младше 30 лет на 30 лет. После чего найдите средний возраст всех Архипов.
UPDATE users
SET age = 30
WHERE age < 30;

SELECT AVG(age)
FROM users
where name = 'Архип'


/*
Все Инженеры - технологи моложе 45, но старше 25 лет прошли курсы повышения квалификации и выучились на Инженера-конструктора. 
Внесите эти изменения в Базу данных и найдите после этого количество Инженеров - конструкторов, с именами, которые содержат букву "п".
*/

UPDATE users
set prof_id = 9
WHERE prof_id IN (
        SELECT id
        FROM professions
        WHERE profession = 'Инженер-технолог'
    ) AND age BETWEEN 25 AND 45


SELECT COUNT(prof_id) 
  FROM users
 WHERE prof_id IN (
           SELECT id
             FROM professions
            WHERE profession = 'Инженер-конструктор'
       )
AND 
       name LIKE '%п%';

-- without changing database
SELECT count(name)
FROM users
WHERE name LIKE '%п%'
  AND (prof_id = (SELECT id
                 FROM professions
                 WHERE profession='Инженер-конструктор')
        OR (prof_id = (SELECT id
                       FROM professions
                       WHERE profession='Инженер-технолог')
                AND age BETWEEN 25 AND 45))


/*
Как известно, возраст, в котором был распят Христос - 33 года. 
Удалите из базы данных всех Лжехристосов (люди с именем Христос, которым больше 33 лет). 
После этого среди всех Христосов найдите запись с наибольшим id. В качестве ответа укажите этот самый  id.
*/
DELETE FROM users
WHERE name = 'Христос' AND age > 33

SELECT MAX(id)
FROM users
WHERE name = 'Христос' 

-- without changing database
SELECT MAX(id)
FROM users
WHERE name = 'Христос'
AND age < 34


/*
Для безупречного баланса и идеальной гармонии удалите из вашей базы данных половину всех людей (всех людей с чётными id). 
После этого найдите сумму возрастов всех людей, чьё имя заканчивается на "а", но не начинается с буквы "Г"
*/
SELECT SUM(age) 
  FROM users
 WHERE MOD(id, 2) != 0 AND 
       name LIKE '%а' AND 
       NOT name LIKE 'Г%';
