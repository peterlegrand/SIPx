CREATE PROCEDURE usp_PersonTypePropertyDeletePost (@UserId nvarchar(450), 
	@ObjectTypePropertyId int) 
AS 

DECLARE  @ColumnId int

SELECT @ColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'PersonTypeProperties' AND ColumnName = 'PersonTypePropertyId';

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate) VALUES(@ColumnId,3,@ObjectTypePropertyId, @UserId, getdate())
DELETE FROM PersonTypeProperties WHERE @ObjectTypePropertyId = PersonTypePropertyId
COMMIT TRANSACTION


