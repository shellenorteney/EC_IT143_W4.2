DROP TABLE IF EXISTS dbo.t_libraryview;
GO

CREATE TABLE dbo.t_libraryview
(my_message			VARCHAR(25) NOT NULL,
	library_session DATETIME NOT NULL
								DEFAULT GETDATE(),
	CONSTRAINT PK_t_library PRIMARY KEY CLUSTERED (my_message ASC)
);
GO