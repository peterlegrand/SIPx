CREATE PROCEDURE usp_OrganizationAddressDeletePost ( @OrganizationAddressId int)
AS
DELETE FROM OrganizationAddresses 
WHERE OrganizationAddressID = @OrganizationAddressId
