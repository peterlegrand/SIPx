CREATE PROCEDURE [dbo].[usp_ContentTypeLanguageDelete] (
	@ContentTypeLanguageId int) 
AS 
DELETE FROM ContentTypeLanguages WHERE ContentTypeLanguageId = @ContentTypeLanguageID


