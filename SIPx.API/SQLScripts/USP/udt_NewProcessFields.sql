CREATE TYPE udt_NewProcessFields AS TABLE (
	ProcessTypeFieldId int not null
	, StringValue nvarchar(max)
	, IntValue int
	, DateTimeValue datetime
)
