CREATE PROCEDURE [dbo].[usp_OrganizationTypeDelete] (
	@OrganizationTypeId int) 
AS 
BEGIN TRANSACTION
DELETE FROM OrganizationTypeLanguages WHERE @OrganizationTypeId = OrganizationTypeID
DELETE FROM OrganizationTypes WHERE @OrganizationTypeId = OrganizationTypeID
COMMIT TRANSACTION
