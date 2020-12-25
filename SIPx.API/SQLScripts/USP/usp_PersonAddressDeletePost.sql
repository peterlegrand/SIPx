CREATE PROCEDURE usp_PersonAddressDeletePost ( @UserId nvarchar(450), @PersonAddressId int)
AS
DELETE FROM PersonAddresses 
WHERE PersonAddressID = @PersonAddressId
