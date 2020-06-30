CREATE PROCEDURE [dbo].[usp_GenderUpdate] (@GenderId int, @Active bit) 
AS 
UPDATE Genders SET Active = @Active WHERE GenderId = @GenderID
