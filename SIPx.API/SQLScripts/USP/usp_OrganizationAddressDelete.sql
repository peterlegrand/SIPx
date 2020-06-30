CREATE PROCEDURE [dbo].[usp_OrganizationAddressDelete] (
	@OrganizationAddressId  int
) 
AS 

DELETE FROM  OrganizationAddresses 
	WHERE OrganizationAddressId = @OrganizationAddressId 
	
