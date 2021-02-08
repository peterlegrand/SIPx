CREATE PROCEDURE usp_OrganizationTypePropertyCreatePost (
	@OrganizationTypeId int
	, @PropertyId int
	, @ObjectTypePropertyStatusId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @OrganizationTypePropertyIdColumnId int;
DECLARE  @OrganizationTypeIdColumnId int
DECLARE  @PropertyIdColumnId int
DECLARE  @ObjectTypePropertyStatusIdColumnId int
DECLARE  @CreatorIdColumnId int
DECLARE  @ModifierIdColumnId int
DECLARE  @CreatedDateColumnId int
DECLARE  @ModifiedDateColumnId int

SELECT @OrganizationTypePropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'OrganizationTypeProperties' AND ColumnName = 'OrganizationTypePropertyId';
SELECT @OrganizationTypeIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'OrganizationTypeId';
SELECT @PropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'PropertyId';
SELECT @ObjectTypePropertyStatusIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'ObjectTypePropertyStatusId';
SELECT @CreatorIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'CreatorId';
SELECT @ModifierIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifierId';
SELECT @CreatedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'CreatedDate';
SELECT @ModifiedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifiedDate';

SET XACT_ABORT ON;
BEGIN TRANSACTION


INSERT INTO OrganizationTypeProperties (
	OrganizationTypeId
	, PropertyId
	, ObjectTypePropertyStatusId 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@OrganizationTypeId
	, @PropertyId
	, @ObjectTypePropertyStatusId 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewOrganizationTypePropertyId int	= scope_identity();

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@OrganizationTypePropertyIdColumnId, 1,@NewOrganizationTypePropertyId , @UserId, cast(@NewOrganizationTypePropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@OrganizationTypeIdColumnId, 1,@NewOrganizationTypePropertyId , @UserId, cast(@OrganizationTypeId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@PropertyIdColumnId, 1,@NewOrganizationTypePropertyId , @UserId, cast(@PropertyId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ObjectTypePropertyStatusIdColumnId, 1,@NewOrganizationTypePropertyId , @UserId, cast(@ObjectTypePropertyStatusId as nvarchar(10)), getdate())

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatorIdColumnId, 1,@NewOrganizationTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifierIdColumnId, 1,@NewOrganizationTypePropertyId , @UserId, @UserId , getdate())

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@CreatedDateColumnId, 1,@NewOrganizationTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId,UserId, NewValue, ChangeLogDate) 
	VALUES(@ModifiedDateColumnId, 1,@NewOrganizationTypePropertyId , @UserId, cast(getdate() as nvarchar(26)), getdate())

	COMMIT TRANSACTION


