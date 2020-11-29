CREATE PROCEDURE usp_PropertyDeletePost (
	@PropertyId int) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM Properties WHERE @PropertyId = PropertyID
DELETE FROM PropertyLanguages WHERE @PropertyId = PropertyID
COMMIT TRANSACTION