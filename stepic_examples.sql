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
WHERE name = 'Гертруда' --найдите количество Биотехнологов и Кондитеров. Реализуйте это с помощью вложенного запроса.
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