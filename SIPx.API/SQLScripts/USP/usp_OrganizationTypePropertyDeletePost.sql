CREATE PROCEDURE usp_OrganizationTypePropertyDeletePost (@UserId nvarchar(450), 
	@ObjectTypePropertyId int) 
AS 

DECLARE  @ColumnId int

SELECT @ColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'OrganizationTypeProperties' AND ColumnName = 'OrganizationTypePropertyId';

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ChangeLogOrganizationTypeProperties (ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate) VALUES(@ColumnId,3,@ObjectTypePropertyId, @UserId, getdate())
DELETE FROM OrganizationTypeProperties WHERE @ObjectTypePropertyId = OrganizationTypePropertyId
COMMIT TRANSACTION


