CREATE PROCEDURE [dbo].[usp_LanguageUpdate] (@LanguageID int, @StatusID int) 
AS 
UPDATE Languages SET StatusID = @StatusID WHERE LanguageID = @LanguageID



