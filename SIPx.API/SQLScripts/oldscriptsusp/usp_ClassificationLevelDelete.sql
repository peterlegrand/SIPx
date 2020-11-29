CREATE PROCEDURE [dbo].[usp_ClassificationLevelDelete] (
	@ClassificationLevelId int) 
AS 
DECLARE @OldSequence int;
DECLARE @ClassificationId int;
SELECT @OldSequence = Sequence, @ClassificationId = ClassificationId  FROM ClassificationLevels WHERE ClassificationLevelId = @ClassificationLevelID;
BEGIN TRANSACTION
UPDATE ClassificationLevels SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence AND @ClassificationId = ClassificationID
DELETE FROM ClassificationLevelLanguages WHERE ClassificationLevelId = @ClassificationLevelID
DELETE FROM ClassificationLevels WHERE ClassificationLevelId = @ClassificationLevelID
COMMIT TRANSACTION
