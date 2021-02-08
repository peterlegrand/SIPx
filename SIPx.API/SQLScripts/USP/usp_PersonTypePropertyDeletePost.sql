CREATE PROCEDURE usp_PersonTypePropertyDeletePost (@UserId nvarchar(450), 
	@PersonTypePropertyId int) 
AS 

DECLARE  @ColumnId int

SELECT @ColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'PersonTypeProperties' AND ColumnName = 'PersonTypePropertyId';

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ChangeLogPersonTypeProperties (ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate) VALUES(@ColumnId,3,@PersonTypePropertyId, @UserId, getdate())
DELETE FROM PersonTypeProperties WHERE @PersonTypePropertyId = PersonTypePropertyId
COMMIT TRANSACTION


