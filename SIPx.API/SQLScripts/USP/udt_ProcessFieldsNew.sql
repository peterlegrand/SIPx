CREATE TYPE udt_ProcessFieldsNew AS TABLE (
ProcessTemplateID int not null
, ProcessTemplateFieldID int not null
, StringValue nvarchar(max)
, IntValue int
, DateTimeValue DateTime)