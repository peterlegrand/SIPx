CREATE TYPE udt_ReadLogTables AS TABLE(
	ParentTableId [int] NOT NULL
	, ParentTableName varchar(100)
	, IsLanguage bit not null
	, ReadLogTableId [int] NOT NULL
	, ReadLogTableName varchar(100)
	, IdentityColumnName varchar(100)

)


