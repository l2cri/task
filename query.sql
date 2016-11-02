-- Task 1
SELECT c.Name, count(o.Id) AS CNT, DATE_FORMAT(FROM_UNIXTIME(o.CTime), '%Y-%m') AS Date_order, p.id
FROM Clients AS c
LEFT JOIN Orders AS o ON c.id = o.Clients_id
LEFT JOIN Products AS p ON o.id = p.Order_id
where p.id IN (151515,151617,151514)
group by c.Email
having Date_order = '2015-03' and cnt > 0
order by CNT desc;

-- Task 2
SELECT c.*, count(o.Id) AS CNT
FROM Clients AS c
LEFT JOIN Orders AS o ON c.id = o.Clients_id
WHERE c.Email LIKE '%@mail.ru'
GROUP BY c.Email
HAVING cnt = 0