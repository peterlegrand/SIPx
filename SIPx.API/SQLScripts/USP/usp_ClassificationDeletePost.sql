CREATE PROCEDURE [dbo].[usp_ClassificationDeletePost] (
	@ClassificationId int) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = DropDownSequence FROM Classifications WHERE ClassificationId = @ClassificationID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence > @OldSequence 
DELETE FROM Classifications WHERE @ClassificationId = ClassificationID
DELETE FROM ClassificationLanguages WHERE @ClassificationId = ClassificationID
COMMIT TRANSACTION