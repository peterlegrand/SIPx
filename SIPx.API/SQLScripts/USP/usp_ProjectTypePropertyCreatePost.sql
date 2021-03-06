CREATE PROCEDURE usp_ProjectTypePropertyCreatePost (
	@ObjectTypeId int
	, @PropertyId int
	, @ObjectTypePropertyStatusId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @ProjectTypePropertyIdColumnId int;
DECLARE  @ObjectTypeIdColumnId int
DECLARE  @PropertyIdColumnId int
DECLARE  @ObjectTypePropertyStatusIdColumnId int
DECLARE  @CreatorIdColumnId int
DECLARE  @ModifierIdColumnId int
DECLARE  @CreatedDateColumnId int
DECLARE  @ModifiedDateColumnId int

SELECT @ProjectTypePropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'ProjectTypePropertyId';
SELECT @ObjectTypeIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'ProjectTypeId';
SELECT @PropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'PropertyId';
SELECT @ObjectTypePropertyStatusIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'ObjectTypePropertyStatusId';
SELECT @CreatorIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'CreatorId';
SELECT @ModifierIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'ModifierId';
SELECT @CreatedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'CreatedDate';
SELECT @ModifiedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'ModifiedDate';

SET XACT_ABORT ON;
BEGIN TRANSACTION


INSERT INTO ProjectTypeProperties (
	ProjectTypeId
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


DECLARE @NewProjectTypePropertyId int	= scope_identity();

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@ProjectTypePropertyIdColumnId, 1,@NewProjectTypePropertyId , @UserId, cast(@NewProjectTypePropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@ObjectTypeIdColumnId, 1,@NewProjectTypePropertyId , @UserId, cast(@ObjectTypeId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@PropertyIdColumnId, 1,@NewProjectTypePropertyId , @UserId, cast(@PropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ObjectTypePropertyStatusIdColumnId, 1,@NewProjectTypePropertyId , @UserId, cast(@ObjectTypePropertyStatusId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatorIdColumnId, 1,@NewProjectTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifierIdColumnId, 1,@NewProjectTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatedDateColumnId, 1,@NewProjectTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifiedDateColumnId, 1,@NewProjectTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	COMMIT TRANSACTION


