CREATE PROCEDURE usp_ProjectTypeMatrixDeletePost ( @UserId nvarchar(450), @ProjectTypeMatrixId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProjectTypeMatrixLanguages WHERE ProjectTypeMatrixId = @ProjectTypeMatrixId
DELETE FROM ProjectTypeMatrixes WHERE ProjectTypeMatrixId = @ProjectTypeMatrixId

COMMIT TRANSACTION
