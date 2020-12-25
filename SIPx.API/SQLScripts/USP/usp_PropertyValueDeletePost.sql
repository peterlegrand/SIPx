CREATE PROCEDURE [dbo].[usp_PropertyValueDeletePost] (@UserId nvarchar(450), 
	@PropertyValueId int) 
AS 
DECLARE @OldSequence int;
DECLARE @PropertyId int;
SELECT @OldSequence = Sequence, @PropertyId = PropertyId FROM PropertyValues WHERE PropertyValueId = @PropertyValueID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE PropertyValues SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence AND @PropertyId = PropertyId AND Sequence IS NOT NULL
DELETE FROM PropertyValueLanguages WHERE @PropertyValueId = PropertyValueID
DELETE FROM PropertyValues WHERE @PropertyValueId = PropertyValueID
COMMIT TRANSACTION