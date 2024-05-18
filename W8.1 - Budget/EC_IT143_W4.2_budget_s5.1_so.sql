-- Q: What is the average spending for the last 3 months?

-- A: we can do the average and search using SQL. Let's ask SQL Server and find out...


SELECT v.my_message
	, v.average_budget
	INTO dbo.t_budget
  FROM dbo.v_budget AS v;