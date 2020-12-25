CREATE PROCEDURE [dbo].[usp_ClassificationLevelDeletePost] (@UserId nvarchar(450), 
	@ClassificationLevelId int) 
AS 
DECLARE @OldSequence int;
DECLARE @ClassificationId int;
SELECT @OldSequence = Sequence, @ClassificationId = ClassificationId FROM ClassificationLevels WHERE ClassificationLevelId = @ClassificationLevelID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ClassificationLevels SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence AND @ClassificationId = ClassificationId
DELETE FROM ClassificationLevelLanguages WHERE @ClassificationLevelId = ClassificationLevelID
DELETE FROM ClassificationLevels WHERE @ClassificationLevelId = ClassificationLevelID
COMMIT TRANSACTION