DROP TABLE IF EXISTS dbo.t_budget;
GO

CREATE TABLE dbo.t_budget (
    my_message VARCHAR(50) NOT NULL,
    average_budget DECIMAL(18, 2) NOT NULL,
    CONSTRAINT PK_t_budget PRIMARY KEY CLUSTERED (my_message ASC)
);
GO
