DROP VIEW IF EXISTS dbo.BudgetView;
GO

CREATE VIEW dbo.BudgetView
AS

/*****************************************************************************************************************
NAME:    dbo.BudgetView
PURPOSE: Present the Budget - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/16/2024   ORTENEY       1. Built this script to present the Budget


RUNTIME: 
1s

NOTES: 
The script exists to help you understand the purpose and construction of the Budget community, there are two data tables, one with specific information for each month and your expenses divided into categories so that there can be an average of information, the other has the income , expense and remainder of the month as profit for each specified month.

******************************************************************************************************************/

-- Q: What is the average spending for the last 3 months?
-- A: we can do the average and search using SQL. Let's ask SQL Server and find out...


SELECT 
    'The average for the last 3 months' AS my_message,
    AVG(Gasto) AS average_budget
FROM 
    Budget
WHERE 
    date >= DATEADD(MONTH, -3, GETDATE());
GO