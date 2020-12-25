CREATE PROCEDURE usp_OrganizationAddressDeletePost ( @UserId nvarchar(450), @OrganizationAddressId int)
AS
DELETE FROM OrganizationAddresses 
WHERE OrganizationAddressID = @OrganizationAddressId
