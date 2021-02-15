CREATE PROCEDURE usp_ContentTypePropertyCreatePost (
	@ObjectTypeId int
	, @PropertyId int
	, @ObjectTypePropertyStatusId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @ContentTypePropertyIdColumnId int;
DECLARE  @ContentTypeIdColumnId int
DECLARE  @PropertyIdColumnId int
DECLARE  @ObjectTypePropertyStatusIdColumnId int
DECLARE  @CreatorIdColumnId int
DECLARE  @ModifierIdColumnId int
DECLARE  @CreatedDateColumnId int
DECLARE  @ModifiedDateColumnId int

SELECT @ContentTypePropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ContentTypeProperties' AND ColumnName = 'ContentTypePropertyId';
SELECT @ContentTypeIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'ContentTypeId';
SELECT @PropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'PropertyId';
SELECT @ObjectTypePropertyStatusIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'ObjectTypePropertyStatusId';
SELECT @CreatorIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'CreatorId';
SELECT @ModifierIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifierId';
SELECT @CreatedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'CreatedDate';
SELECT @ModifiedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifiedDate';

SET XACT_ABORT ON;
BEGIN TRANSACTION


INSERT INTO ContentTypeProperties (
	ContentTypeId
	, PropertyId
	, ObjectTypePropertyStatusId 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ObjectTypeId
	, @PropertyId
	, @ObjectTypePropertyStatusId 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewContentTypePropertyId int	= scope_identity();

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@ContentTypePropertyIdColumnId, 1,@NewContentTypePropertyId , @UserId, cast(@NewContentTypePropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@ContentTypeIdColumnId, 1,@NewContentTypePropertyId , @UserId, cast(@ObjectTypeId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@PropertyIdColumnId, 1,@NewContentTypePropertyId , @UserId, cast(@PropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ObjectTypePropertyStatusIdColumnId, 1,@NewContentTypePropertyId , @UserId, cast(@ObjectTypePropertyStatusId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatorIdColumnId, 1,@NewContentTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifierIdColumnId, 1,@NewContentTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatedDateColumnId, 1,@NewContentTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifiedDateColumnId, 1,@NewContentTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	COMMIT TRANSACTION


