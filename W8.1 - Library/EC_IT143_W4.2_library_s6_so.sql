-- Q:How many books are there about a given session?

--A: We can select and search by writing the category in the search. Let's ask SQL Server and find out...

 -- 1) Reload data

 TRUNCATE TABLE dbo.t_libraryview;

 INSERT INTO dbo.t_libraryview
		SELECT v.my_message
			, v.library_session
		FROM dbo.v_library AS v;

-- 2) Review results

	SELECT t. *
		FROM dbo.t_library AS t;