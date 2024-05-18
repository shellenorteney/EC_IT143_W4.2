-- Q: What is the average spending for the last 3 months?

-- A: we can do the average and search using SQL. Let's ask SQL Server and find out...


SELECT AVG(Gasto) AS Budget
FROM Budget
WHERE date >= DATEADD(MONTH, -3, GETDATE());

