CREATE PROCEDURE usp_PropertyValueCreateGetType (@UserID nvarchar(450), @PropertyId int) 
AS 
BEGIN
SELECT 
	PropertyTypeId
FROM Properties
WHERE PropertyId = @PropertyId
END