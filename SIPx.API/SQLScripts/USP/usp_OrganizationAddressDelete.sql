CREATE PROCEDURE [dbo].[usp_OrganizationAddressDelete] (
	@OrganizationAddressID  int
) 
AS 

DELETE FROM  OrganizationAddresses 
	WHERE OrganizationAddressID = @OrganizationAddressID 
	
