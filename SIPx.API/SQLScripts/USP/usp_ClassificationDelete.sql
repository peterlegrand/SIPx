CREATE PROCEDURE [dbo].[usp_ClassificationDelete] (
	@ClassificationID int) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = DropDownSequence FROM Classifications WHERE ClassificationID = @ClassificationID;
BEGIN TRANSACTION
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence > @OldSequence 
DELETE FROM ClassificationLanguages WHERE @ClassificationID = ClassificationID
DELETE FROM Classifications WHERE @ClassificationID = ClassificationID
COMMIT TRANSACTION