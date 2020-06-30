CREATE PROCEDURE [dbo].[usp_PersonAddressDelete] (
	@PersonAddressId  int
) 
AS 

DELETE FROM  PersonAddresses 
	WHERE PersonAddressId = @PersonAddressId 
	
