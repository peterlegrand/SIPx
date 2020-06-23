CREATE PROCEDURE [dbo].[usp_ContentTypeLanguageDelete] (
	@ContentTypeLanguageID int) 
AS 
DELETE FROM ContentTypeLanguages WHERE ContentTypeLanguageID = @ContentTypeLanguageID


