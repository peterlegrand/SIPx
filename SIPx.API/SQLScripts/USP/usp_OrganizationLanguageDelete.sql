CREATE PROCEDURE [dbo].[usp_OrganizationLanguageDelete] (
	@OrganizationLanguageId int) 
AS 
DELETE FROM OrganizationLanguages WHERE OrganizationLanguageId = @OrganizationLanguageID


