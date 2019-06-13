use folizyuk;

-- канали, які маю в описі слово популярний
SELECT * FROM Chanel
WHERE
    Description LIKE '%попул_рний%';
    
    
-- де працюють/працювали працівники
SELECT 
     company.name,group_concat(workers.name)
FROM
    workers
        JOIN
    company on company.idcompany=workers.company_idcompany
    group by company.name;



-- телепередачі, тривалість яких менша за середню
SELECT 
    *
FROM
    telecast
WHERE
    duration < (SELECT 
            AVG(duration)
        FROM
            telecast);



-- запит виводить жанр, та телепередачі цього жанру
SELECT 
    genre.name, GROUP_CONCAT(telecast.name)
FROM
    genre
        JOIN
    telecast_has_genre ON genre.idgenre = telecast_has_genre.genre_idgenre
        JOIN
    telecast ON telecast.idtelecast = telecast_has_genre.telecast_idtelecast
GROUP BY genre.name;


-- компанії, які існують більше 70-ти років
select * from company
where creating_date < now()-interval 70 year


