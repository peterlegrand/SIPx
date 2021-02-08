CREATE PROCEDURE usp_ContentTypePropertyDeletePost (@UserId nvarchar(450), 
	@ContentTypePropertyId int) 
AS 

DECLARE  @ColumnId int

SELECT @ColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ContentTypeProperties' AND ColumnName = 'ContentTypePropertyId';

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ChangeLogContentTypeProperties (ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate) VALUES(@ColumnId,3,@ContentTypePropertyId, @UserId, getdate())
DELETE FROM ContentTypeProperties WHERE @ContentTypePropertyId = ContentTypePropertyId
COMMIT TRANSACTION


