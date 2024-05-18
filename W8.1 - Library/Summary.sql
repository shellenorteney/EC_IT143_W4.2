-- Step 1
SELECT * FROM LibraryStore.dbo.StoreInformation
WHERE Category = 'Romantic';

-- Step 4
DROP VIEW IF EXISTS dbo.libraryview;
GO

CREATE VIEW dbo.libraryview
AS
/*****************************************************************************************************************
NAME:    LibraryStore.dbo.LibraryView
PURPOSE: Introduce the Library - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/16/2024   ORTENEY       1. Built this script to introduce the Library

RUNTIME: 
1s

NOTES: 
The script exists to help you understand the purpose and construction of the Library community. There are two data tables: 
one with specific information about each book in the library, such as Title, summary, and edition; 
another with store category information for organizing information by sections.
******************************************************************************************************************/

SELECT GETDATE() AS library_session;

-- Step 5.1
SELECT v.my_message, v.library_session
INTO dbo.t_libraryview
FROM dbo.libraryview AS v;

-- Step 5.2
DROP TABLE IF EXISTS dbo.t_libraryview;
GO

CREATE TABLE dbo.t_libraryview
(
    my_message VARCHAR(25) NOT NULL,
    library_session DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_t_library PRIMARY KEY CLUSTERED (my_message ASC)
);
GO

-- Step 6
-- 1) Reload data
TRUNCATE TABLE dbo.t_libraryview;

INSERT INTO dbo.t_libraryview
SELECT v.my_message, v.library_session
FROM dbo.libraryview AS v;

-- 2) Review results
SELECT t.*
FROM dbo.t_libraryview AS t;

-- Step 7
CREATE PROCEDURE dbo.usp_Libraryview
AS
/*****************************************************************************************************************
NAME:    LibraryStore.dbo.LibraryView
PURPOSE: Introduce the Library - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/16/2024   ORTENEY       1. Built this script to introduce the Library

RUNTIME: 
1s

NOTES: 
The script exists to help you understand the purpose and construction of the Library community. There are two data tables: 
one with specific information about each book in the library, such as Title, summary, and edition; 
another with store category information for organizing information by sections.
******************************************************************************************************************/

BEGIN
    -- 1) Reload data
    TRUNCATE TABLE dbo.t_libraryview;

    INSERT INTO dbo.t_libraryview
    SELECT v.my_message, v.library_session
    FROM dbo.libraryview AS v;

    -- 2) Review results
    SELECT t.*
    FROM dbo.t_libraryview AS t;
END
GO

-- Step 8
EXEC dbo.usp_Libraryview;
