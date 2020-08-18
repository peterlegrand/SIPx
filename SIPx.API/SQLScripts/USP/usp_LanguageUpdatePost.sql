CREATE PROCEDURE [dbo].[usp_LanguageUpdatePost] (@LanguageId int, @StatusId int, @ModifierID nvarchar(450)) 
AS 
UPDATE Languages SET StatusId = @StatusId, ModifierID  = @ModifierID WHERE LanguageId = @LanguageID



