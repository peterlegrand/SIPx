CREATE TYPE udt_ProcessFieldUpdate AS TABLE (
ProcessFieldId int not null
, ProcessId int not null
, StringValue nvarchar(max) null
, IntValue int null
, DateTimeValue DateTime null
, ModifierId nvarchar(450) not null
, ModifiedDate datetime not null
)
