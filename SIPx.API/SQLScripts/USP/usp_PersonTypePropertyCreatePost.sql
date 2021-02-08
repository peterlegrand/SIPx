CREATE PROCEDURE usp_PersonTypePropertyCreatePost (
	@PersonTypeId int
	, @PropertyId int
	, @ObjectTypePropertyStatusId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @PersonTypePropertyIdColumnId int;
DECLARE  @PersonTypeIdColumnId int
DECLARE  @PropertyIdColumnId int
DECLARE  @ObjectTypePropertyStatusIdColumnId int
DECLARE  @CreatorIdColumnId int
DECLARE  @ModifierIdColumnId int
DECLARE  @CreatedDateColumnId int
DECLARE  @ModifiedDateColumnId int

SELECT @PersonTypePropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'PersonTypeProperties' AND ColumnName = 'PersonTypePropertyId';
SELECT @PersonTypeIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'PersonTypeId';
SELECT @PropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'PropertyId';
SELECT @ObjectTypePropertyStatusIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'ObjectTypePropertyStatusId';
SELECT @CreatorIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'CreatorId';
SELECT @ModifierIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifierId';
SELECT @CreatedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'CreatedDate';
SELECT @ModifiedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifiedDate';

SET XACT_ABORT ON;
BEGIN TRANSACTION


INSERT INTO PersonTypeProperties (
	PersonTypeId
	, PropertyId
	, ObjectTypePropertyStatusId 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@PersonTypeId
	, @PropertyId
	, @ObjectTypePropertyStatusId 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPersonTypePropertyId int	= scope_identity();

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@PersonTypePropertyIdColumnId, 1,@NewPersonTypePropertyId , @UserId, cast(@NewPersonTypePropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@PersonTypeIdColumnId, 1,@NewPersonTypePropertyId , @UserId, cast(@PersonTypeId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@PropertyIdColumnId, 1,@NewPersonTypePropertyId , @UserId, cast(@PropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ObjectTypePropertyStatusIdColumnId, 1,@NewPersonTypePropertyId , @UserId, cast(@ObjectTypePropertyStatusId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatorIdColumnId, 1,@NewPersonTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifierIdColumnId, 1,@NewPersonTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatedDateColumnId, 1,@NewPersonTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifiedDateColumnId, 1,@NewPersonTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	COMMIT TRANSACTION


