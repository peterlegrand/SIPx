CREATE PROCEDURE [dbo].[usp_TelecomTypeUpdate] (
	@TelecomTypeID int
	, @Active bit
	, @User nvarchar(450)) 
AS 
UPDATE TelecomTypes SET 
	Active = @Active 
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE TelecomTypeID = @TelecomTypeID
