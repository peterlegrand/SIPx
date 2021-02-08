CREATE PROCEDURE usp_OrganizationTypePropertyUpdatePost (
	@OrganizationTypePropertyId int
	, @PropertyId int
	, @ObjectTypePropertyStatusId int
	, @UserId nvarchar(450)) 
AS 

DECLARE  @PropertyIdColumnId int
DECLARE  @ObjectTypePropertyStatusIdColumnId int
DECLARE  @ModifierIdColumnId int
DECLARE  @ModifiedDateColumnId int

DECLARE  @OldPropertyId int
DECLARE  @OldObjectTypePropertyStatusId int
DECLARE  @OldModifierId nvarchar(450)
DECLARE  @OldModifiedDate datetime

SELECT @OldPropertyId = PropertyId, @OldObjectTypePropertyStatusId = ObjectTypePropertyStatusId, @OldModifierId = ModifierId, @OldModifiedDate = ModifiedDate 
FROM OrganizationTypeProperties WHERE OrganizationTypePropertyId = @OrganizationTypePropertyId 

SELECT @PropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'PropertyId';
SELECT @ObjectTypePropertyStatusIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'ObjectTypePropertyStatusId';
SELECT @ModifierIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifierId';
SELECT @ModifiedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifiedDate';

SET XACT_ABORT ON;
BEGIN TRANSACTION

IF @OldPropertyId <> @PropertyId OR @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId
BEGIN
UPDATE OrganizationTypeProperties SET 
	 PropertyId = @PropertyId
	, ObjectTypePropertyStatusId = @ObjectTypePropertyStatusId 
	, ModifierID = @UserId
	, ModifiedDate = getdate()
WHERE OrganizationTypePropertyId = @OrganizationTypePropertyId
END

IF @OldPropertyId <> @PropertyId
BEGIN
INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@PropertyIdColumnId, 1,@OrganizationTypePropertyId , @UserId, cast(@OldPropertyId as nvarchar(10)), cast(@PropertyId as nvarchar(10)), getdate())
END
IF @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId
BEGIN
INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
	VALUES(@ObjectTypePropertyStatusIdColumnId, 1,@OrganizationTypePropertyId , @UserId, cast(@OldObjectTypePropertyStatusId as nvarchar(10)),cast(@ObjectTypePropertyStatusId as nvarchar(10)), getdate())
END
IF (@OldPropertyId <> @PropertyId OR @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId) AND @OldModifierId <> @UserId
BEGIN
INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
	VALUES(@ModifierIdColumnId, 1,@OrganizationTypePropertyId , @OldModifierId, @UserId, @UserId , getdate())
END

IF @OldPropertyId <> @PropertyId OR @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId
BEGIN
INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
	VALUES(@ModifiedDateColumnId, 1,@OrganizationTypePropertyId , @UserId, cast(@OldModifiedDate as nvarchar(26)), cast(getdate() as nvarchar(26)), getdate())
END
	COMMIT TRANSACTION


