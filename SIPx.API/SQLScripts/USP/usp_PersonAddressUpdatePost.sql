CREATE PROCEDURE [dbo].[usp_PersonAddressUpdatePost] (
	@PersonAddressId  int
	, @AddressTypeId int
	, @AttnName nvarchar(50)
	, @Address1 nvarchar(100)
	, @Address2 nvarchar(100)
	, @HouseNumber nvarchar(20)
	, @HouseNumberExt nvarchar(20)
	, @Location Geography
	, @City nvarchar(50)
	, @PostalCode nvarchar(50)
	, @PostalCodeExt nvarchar(50)
	, @CountryId int
	, @ProvinceState nvarchar(50)
	, @County nvarchar(50)
	, @ModifierId nvarchar(450)) 
AS 

UPDATE PersonAddresses SET
	 AddressTypeId  = @AddressTypeId 
	, AttnName = @AttnName 
	, Address1 = @Address1 
	, Address2 = @Address2
	, HouseNumber = @HouseNumber 
	, HouseNumberExt = @HouseNumberExt 
	, Location = @Location 
	, City = @City 
	, PostalCode = @PostalCode 
	, PostalCodeExt = @PostalCodeExt 
	, CountryId = @CountryID
	, ProvinceState = @ProvinceState 
	, County = @County 
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
	WHERE PersonAddressId = @PersonAddressId 
	
