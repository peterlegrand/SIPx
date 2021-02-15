CREATE PROCEDURE usp_ContentTypePropertyUpdatePost (
	@ObjectTypePropertyId int
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
FROM ContentTypeProperties WHERE ContentTypePropertyId = @ObjectTypePropertyId 

SELECT @PropertyIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'PropertyId';
SELECT @ObjectTypePropertyStatusIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'ObjectTypePropertyStatusId';
SELECT @ModifierIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifierId';
SELECT @ModifiedDateColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'ModifiedDate';

SET XACT_ABORT ON;
BEGIN TRANSACTION

IF @OldPropertyId <> @PropertyId OR @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId
BEGIN
UPDATE ContentTypeProperties SET 
	 PropertyId = @PropertyId
	, ObjectTypePropertyStatusId = @ObjectTypePropertyStatusId 
	, ModifierID = @UserId
	, ModifiedDate = getdate()
WHERE ContentTypePropertyId = @ObjectTypePropertyId
END

IF @OldPropertyId <> @PropertyId
BEGIN
INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@PropertyIdColumnId, 1,@ObjectTypePropertyId , @UserId, cast(@OldPropertyId as nvarchar(10)), cast(@PropertyId as nvarchar(10)), getdate())
END
IF @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId
BEGIN
INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
	VALUES(@ObjectTypePropertyStatusIdColumnId, 1,@ObjectTypePropertyId , @UserId, cast(@OldObjectTypePropertyStatusId as nvarchar(10)),cast(@ObjectTypePropertyStatusId as nvarchar(10)), getdate())
END
IF (@OldPropertyId <> @PropertyId OR @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId) AND @OldModifierId <> @UserId
BEGIN
INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
	VALUES(@ModifierIdColumnId, 1,@ObjectTypePropertyId , @OldModifierId, @UserId, @UserId , getdate())
END

IF @OldPropertyId <> @PropertyId OR @OldObjectTypePropertyStatusId <> @ObjectTypePropertyStatusId
BEGIN
INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId,RecordId ,UserId, OldValue, NewValue, ChangeLogDate) 
	VALUES(@ModifiedDateColumnId, 1,@ObjectTypePropertyId , @UserId, cast(@OldModifiedDate as nvarchar(26)), cast(getdate() as nvarchar(26)), getdate())
END
	COMMIT TRANSACTION


