-- Step 1: Create the Budget Table
CREATE TABLE Budget (
    BudgetID INT IDENTITY(1,1) PRIMARY KEY,
    Gasto DECIMAL(18, 2) NOT NULL,
    Date DATE NOT NULL
);

-- Step 2: Insert Sample Data
INSERT INTO Budget (Gasto, Date)
VALUES
    (100.00, '2024-03-15'),
    (150.00, '2024-04-10'),
    (200.00, '2024-05-05'),
    (250.00, '2024-05-10'),
    (300.00, '2024-05-15');

-- Step 3: Create the View
DROP VIEW IF EXISTS dbo.BudgetView;
GO

CREATE VIEW dbo.BudgetView
AS
SELECT 
    'The average for the last 3 months' AS my_message,
    AVG(Gasto) AS average_budget
FROM 
    Budget
WHERE 
    Date >= DATEADD(MONTH, -3, GETDATE());
GO

-- Step 4: Create the Results Table
DROP TABLE IF EXISTS dbo.t_budget;
GO

CREATE TABLE dbo.t_budget (
    my_message VARCHAR(50) NOT NULL,
    average_budget DECIMAL(18, 2) NOT NULL,
    CONSTRAINT PK_t_budget PRIMARY KEY CLUSTERED (my_message ASC)
);
GO

-- Step 5: Populate the Results Table from the View
TRUNCATE TABLE dbo.t_budget;

INSERT INTO dbo.t_budget (my_message, average_budget)
SELECT my_message, average_budget
FROM dbo.BudgetView;

-- Step 6: Create the Stored Procedure
CREATE PROCEDURE dbo.usp_budget
AS
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

-- Step 7: Execute the Stored Procedure
EXEC dbo.usp_budget;
