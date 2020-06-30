CREATE PROCEDURE [dbo].[usp_ContentTypeGroupLanguageDelete] (
	@ContentTypeGroupLanguageId int) 
AS 
DELETE FROM ContentTypeGroupLanguages WHERE ContentTypeGroupLanguageId = @ContentTypeGroupLanguageID


