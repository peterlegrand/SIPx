CREATE TYPE udt_ProcessFieldUpdate AS TABLE (
ProcessFieldId int not null
, ProcessId int not null
, StringValue nvarchar(max) not null
, IntValue int not null
, DateTimeValue int not null
, ModifierId nvarchar(450) not null
, ModifiedDate datetime not null
)
