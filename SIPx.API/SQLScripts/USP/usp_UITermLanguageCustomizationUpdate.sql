CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationUpdate] (@UITermLanguageID int, @Customization nvarchar(max)) 
AS 
UPDATE UITermLanguageCustomizations SET Customization = @Customization
WHERE UITermLanguageID = @UITermLanguageID