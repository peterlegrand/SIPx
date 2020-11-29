CREATE PROCEDURE [dbo].[usp_ClassificationDelete] (
	@ClassificationId int) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = DropDownSequence FROM Classifications WHERE ClassificationId = @ClassificationID;
BEGIN TRANSACTION
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence > @OldSequence 
DELETE FROM ClassificationLanguages WHERE @ClassificationId = ClassificationID
DELETE FROM Classifications WHERE @ClassificationId = ClassificationID
COMMIT TRANSACTION