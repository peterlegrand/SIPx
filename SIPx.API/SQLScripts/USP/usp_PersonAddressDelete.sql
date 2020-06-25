CREATE PROCEDURE [dbo].[usp_PersonAddressDelete] (
	@PersonAddressID  int
) 
AS 

DELETE FROM  PersonAddresses 
	WHERE PersonAddressID = @PersonAddressID 
	
