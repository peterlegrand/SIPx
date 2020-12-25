CREATE PROCEDURE usp_ProjectDeletePost (@UserId nvarchar(450),  @ProjectID int)
AS
IF (SELECT COUNT(*) FROM Projects  WHERE ParentProjectID = @ProjectID) =0
BEGIN
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProjectLanguages WHERE ProjectId = @ProjectId
DELETE FROM Projects WHERE ProjectId = @ProjectId

COMMIT TRANSACTION
END