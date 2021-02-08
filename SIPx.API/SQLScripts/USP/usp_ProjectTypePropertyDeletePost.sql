CREATE PROCEDURE usp_ProjectTypePropertyDeletePost (@UserId nvarchar(450), 
	@ProjectTypePropertyId int) 
AS 

DECLARE  @ColumnId int

SELECT @ColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectTypeProperties' AND ColumnName = 'ProjectTypePropertyId';

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ChangeLogProjectTypeProperties (ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate) VALUES(@ColumnId,3,@ProjectTypePropertyId, @UserId, getdate())
DELETE FROM ProjectTypeProperties WHERE @ProjectTypePropertyId = ProjectTypePropertyId
COMMIT TRANSACTION


