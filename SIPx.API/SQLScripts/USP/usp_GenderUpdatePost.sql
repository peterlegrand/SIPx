CREATE PROCEDURE [dbo].[usp_GenderUpdatePost] (@GenderId int, @Active bit, @ModifierId nvarchar(450)) 
AS 
UPDATE Genders SET Active = @Active, ModifierID = @ModifierId, ModifiedDate = getdate() WHERE GenderId = @GenderID
