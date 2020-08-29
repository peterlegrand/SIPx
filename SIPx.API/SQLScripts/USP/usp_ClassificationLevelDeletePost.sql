CREATE PROCEDURE [dbo].[usp_ClassificationLevelDeletePost] (
	@ClassificationLevelId int) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ClassificationLevels WHERE ClassificationLevelId = @ClassificationLevelID;
BEGIN TRANSACTION
UPDATE ClassificationLevels SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 
DELETE FROM ClassificationLevelLanguages WHERE @ClassificationLevelId = ClassificationLevelID
DELETE FROM ClassificationLevels WHERE @ClassificationLevelId = ClassificationLevelID
COMMIT TRANSACTION