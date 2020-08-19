CREATE PROCEDURE usp_ProjectDeletePost ( @ProjectID int)
AS
IF (SELECT COUNT(*) FROM Projects  WHERE ParentProjectID = @ProjectID) =0
BEGIN
BEGIN TRANSACTION

DELETE FROM ProjectLanguages WHERE ProjectId = @ProjectId
DELETE FROM Projects WHERE ProjectId = @ProjectId

COMMIT TRANSACTION
END