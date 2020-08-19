CREATE PROCEDURE usp_ProjectTypeDeletePost ( @ProjectTypeId int)
AS
BEGIN TRANSACTION

DELETE FROM ProjectTypeLanguages WHERE ProjectTypeId = @ProjectTypeId
DELETE FROM ProjectTypes WHERE ProjectTypeId = @ProjectTypeId

COMMIT TRANSACTION
