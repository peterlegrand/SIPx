CREATE PROCEDURE [dbo].[usp_OrganizationTypeLanguageDelete] (@OrganizationTypeLanguageID int) 
AS 
DELETE FROM OrganizationTypeLanguages WHERE OrganizationTypeLanguageID= @OrganizationTypeLanguageID



