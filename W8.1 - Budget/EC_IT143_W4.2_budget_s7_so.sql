CREATE PROCEDURE dbo.usp_budget
AS

/*****************************************************************************************************************
NAME:    dbo.BudgetView
PURPOSE: Present the Budget - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/16/2024   ORTENEY       1. Built this script to present the Budget


RUNTIME: 
1s

NOTES: 
The script exists to help you understand the purpose and construction of the Budget community, there are two data tables, one with specific information for each month and your expenses divided into categories so that there can be an average of information, the other has the income , expense and remainder of the month as profit for each specified month.

******************************************************************************************************************/

BEGIN
    -- 1) Reload data
    TRUNCATE TABLE dbo.t_budget;

    INSERT INTO dbo.t_budget (my_message, average_budget)
    SELECT my_message, average_budget
    FROM dbo.BudgetView;

    -- 2) Review results
    SELECT *
    FROM dbo.t_budget;
END;
GO