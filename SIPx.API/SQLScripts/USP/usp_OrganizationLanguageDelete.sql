CREATE PROCEDURE [dbo].[usp_OrganizationLanguageDelete] (
	@OrganizationLanguageID int) 
AS 
DELETE FROM OrganizationLanguages WHERE OrganizationLanguageID = @OrganizationLanguageID


