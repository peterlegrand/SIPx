CREATE TYPE udt_ProcessFieldsNew AS TABLE (
ProcessTemplateId int not null
, ProcessTemplateFieldId int not null
, StringValue nvarchar(max)
, IntValue int
, DateTimeValue DateTime)