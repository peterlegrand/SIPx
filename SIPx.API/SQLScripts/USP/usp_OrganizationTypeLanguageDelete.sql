CREATE PROCEDURE [dbo].[usp_OrganizationTypeLanguageDelete] (@OrganizationTypeLanguageId int) 
AS 
DELETE FROM OrganizationTypeLanguages WHERE OrganizationTypeLanguageID= @OrganizationTypeLanguageID



