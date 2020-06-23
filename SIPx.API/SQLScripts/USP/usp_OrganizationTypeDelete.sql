CREATE PROCEDURE [dbo].[usp_OrganizationTypeDelete] (
	@OrganizationTypeID int) 
AS 
BEGIN TRANSACTION
DELETE FROM OrganizationTypeLanguages WHERE @OrganizationTypeID = OrganizationTypeID
DELETE FROM OrganizationTypes WHERE @OrganizationTypeID = OrganizationTypeID
COMMIT TRANSACTION
