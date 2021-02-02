CREATE PROCEDURE usp_MVCUIScreenContentDeletePost (@UserId nvarchar(450), 
	@MetaContentId int) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate) 
VALUES(3816,3,@MetaContentId,@UserId,GETDATE())

DELETE FROM MetaContents WHERE @MetaContentId = MetaContentID
COMMIT TRANSACTION