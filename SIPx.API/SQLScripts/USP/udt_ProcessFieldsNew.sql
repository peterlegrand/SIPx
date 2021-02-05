CREATE TYPE udt_ProcessFieldsNew AS TABLE (
ProcessTypeId int not null
, ProcessTypeFieldId int not null
, StringValue nvarchar(max)
, IntValue int
, DateTimeValue DateTime)