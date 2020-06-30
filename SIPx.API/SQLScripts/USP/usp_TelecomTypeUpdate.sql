CREATE PROCEDURE [dbo].[usp_TelecomTypeUpdate] (
	@TelecomTypeId int
	, @Active bit
	, @UserId nvarchar(450)) 
AS 
UPDATE TelecomTypes SET 
	Active = @Active 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE TelecomTypeId = @TelecomTypeID
