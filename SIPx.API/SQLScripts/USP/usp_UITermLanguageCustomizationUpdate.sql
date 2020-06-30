CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationUpdate] (@UITermLanguageId int, @Customization nvarchar(max)) 
AS 
UPDATE UITermLanguageCustomizations SET Customization = @Customization
WHERE UITermLanguageId = @UITermLanguageID
