-- Q:How many books are there about a given session?

--A: We can select and search by writing the category in the search. Let's ask SQL Server and find out...


SELECT * from LibraryStore.dbo.StoreInformation
WHERE Category = 'Romantic'
