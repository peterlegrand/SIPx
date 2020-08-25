CREATE TYPE udt_ContentClassificationValueInsert AS TABLE (
ClassificationId int not null
, ClassificationValueId int not null
, CreatorId nvarchar(450) not null
, CreatedDate datetime not null
)
