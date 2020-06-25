CREATE PROCEDURE [dbo].[usp_ClassificationLevelDelete] (
	@ClassificationLevelID int) 
AS 
DECLARE @OldSequence int;
DECLARE @ClassificationID int;
SELECT @OldSequence = Sequence, @ClassificationID = ClassificationID  FROM ClassificationLevels WHERE ClassificationLevelID = @ClassificationLevelID;
BEGIN TRANSACTION
UPDATE ClassificationLevels SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence AND @ClassificationID = ClassificationID
DELETE FROM ClassificationLevelLanguages WHERE ClassificationLevelID = @ClassificationLevelID
DELETE FROM ClassificationLevels WHERE ClassificationLevelID = @ClassificationLevelID
COMMIT TRANSACTION
