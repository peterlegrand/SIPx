CREATE PROCEDURE [dbo].[usp_ContentTypeGroupLanguageDelete] (
	@ContentTypeGroupLanguageID int) 
AS 
DELETE FROM ContentTypeGroupLanguages WHERE ContentTypeGroupLanguageID = @ContentTypeGroupLanguageID


