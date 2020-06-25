CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationCreate] (@UITermID int, @languageID int, @Customization nvarchar(max)) 
AS 
INSERT INTO UITermLanguageCustomizations (UITermID, LanguageID, Customization) VALUES (@UITermID, @languageID, @Customization)