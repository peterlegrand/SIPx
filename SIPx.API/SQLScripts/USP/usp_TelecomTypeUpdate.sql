CREATE PROCEDURE [dbo].[usp_TelecomTypeUpdate] (
	@TelecomTypeID int
	, @Active bit
	, @UserID nvarchar(450)) 
AS 
UPDATE TelecomTypes SET 
	Active = @Active 
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE TelecomTypeID = @TelecomTypeID
