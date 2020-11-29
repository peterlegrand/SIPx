CREATE PROCEDURE [dbo].[usp_LanguageUpdate] (@LanguageId int, @StatusId int) 
AS 
UPDATE Languages SET StatusId = @StatusId WHERE LanguageId = @LanguageID



