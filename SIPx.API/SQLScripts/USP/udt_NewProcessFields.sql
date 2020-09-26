CREATE TYPE udt_NewProcessFields AS TABLE (
	ProcessTemplateFieldId int not null
	, StringValue nvarchar(max)
	, IntValue int
	, DateTimeValue datetime
)
