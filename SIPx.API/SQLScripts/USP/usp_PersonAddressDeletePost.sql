CREATE PROCEDURE usp_PersonAddressDeletePost ( @PersonAddressId int)
AS
DELETE FROM PersonAddresses 
WHERE PersonAddressID = @PersonAddressId
