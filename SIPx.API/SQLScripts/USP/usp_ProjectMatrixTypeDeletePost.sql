CREATE PROCEDURE usp_ProjectMatrixTypeDeletePost (@UserId nvarchar(450), 
	@ProjectMatrixTypeId int) 
AS 
DECLARE @OldSequence int;
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ChangeLogProjectMatrixTypes (ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate)
VALUES(3967, 3,@ProjectMatrixTypeId, @UserId, getdate())
INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, ChangeLogDate)
SELECT 3964, 3, ProjectMatrixTypeLanguageID, @UserId, getdate()  FROM ProjectMatrixTypeLanguages WHERE ProjectMatrixTypeId = @ProjectMatrixTypeId

DELETE FROM ProjectMatrixTypeLanguages WHERE @ProjectMatrixTypeId = ProjectMatrixTypeID
DELETE FROM ProjectMatrixTypes WHERE @ProjectMatrixTypeId = ProjectMatrixTypeID
COMMIT TRANSACTION