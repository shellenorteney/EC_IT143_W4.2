-- Q: What is the average spending for the last 3 months?

-- A: we can do the average and search using SQL. Let's ask SQL Server and find out...


 -- 1) Reload data

-- Reload data
TRUNCATE TABLE dbo.t_budget;

INSERT INTO dbo.t_budget (my_message, average_budget)
SELECT my_message, average_budget
FROM dbo.BudgetView;
