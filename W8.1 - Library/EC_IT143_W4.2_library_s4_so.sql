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
The script exists to help you understand the purpose and construction of the Library community, there are two data tables, one with specific information about each book in the library, such as Title, summary and edition and another with store category information so that there may be organization of information by sections.
 
******************************************************************************************************************/

-- Q:How many books are there about a given session?
-- A: We can select and search by writing the category in the search. Let's ask SQL Server and find out...

SELECT GETDATE() AS library_session;