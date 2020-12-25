CREATE PROCEDURE usp_ProjectTypeDeletePost ( @UserId nvarchar(450), @ProjectTypeId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProjectTypeLanguages WHERE ProjectTypeId = @ProjectTypeId
DELETE FROM ProjectTypes WHERE ProjectTypeId = @ProjectTypeId

COMMIT TRANSACTION
