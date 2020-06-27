CREATE PROCEDURE [dbo].[usp_OrganizationAddressUpdate] (
	@OrganizationAddressID  int
	, @AddressTypeID int
	, @AttnName nvarchar(50)
	, @Address1 nvarchar(100)
	, @Address2 nvarchar(100)
	, @HouseNumber nvarchar(20)
	, @HouseNumberExt nvarchar(20)
	, @Location Geography
	, @City nvarchar(50)
	, @PostalCode nvarchar(50)
	, @PostalCodeExt nvarchar(50)
	, @CountryID int
	, @ProvinceState nvarchar(50)
	, @County nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

UPDATE OrganizationAddresses SET
	 AddressTypeID  = @AddressTypeID 
	, AttnName = @AttnName 
	, Address1 = @Address1 
	, Address2 = @Address2
	, HouseNumber = @HouseNumber 
	, HouseNumberExt = @HouseNumberExt 
	, Location = @Location 
	, City = @City 
	, PostalCode = @PostalCode 
	, PostalCodeExt = @PostalCodeExt 
	, CountryID = @CountryID
	, ProvinceState = @ProvinceState 
	, County = @County 
	, ModifierID = @UserID
	, ModifiedDate = getdate()
	WHERE OrganizationAddressID = @OrganizationAddressID 
	
