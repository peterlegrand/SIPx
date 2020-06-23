CREATE PROCEDURE [dbo].[usp_GenderUpdate] (@GenderID int, @Active bit) 
AS 
UPDATE Genders SET Active = @Active WHERE GenderID = @GenderID
