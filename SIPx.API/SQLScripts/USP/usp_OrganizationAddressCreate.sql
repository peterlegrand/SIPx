CREATE PROCEDURE [dbo].[usp_OrganizationAddressCreate] (
	@OrganizationID int
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
	, @User nvarchar(450)) 
AS 

INSERT INTO OrganizationAddresses (
	OrganizationID 
	, AddressTypeID 
	, AttnName 
	, Address1 
	, Address2 
	, HouseNumber 
	, HouseNumberExt 
	, Location 
	, City 
	, PostalCode 
	, PostalCodeExt 
	, CountryID
	, ProvinceState 
	, County 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@OrganizationID 
	, @AddressTypeID 
	, @AttnName 
	, @Address1 
	, @Address2 
	, @HouseNumber 
	, @HouseNumberExt 
	, @Location 
	, @City 
	, @PostalCode 
	, @PostalCodeExt 
	, @CountryID
	, @ProvinceState 
	, @County 
	, @User
	, getdate()
	, @User
	, getdate())




