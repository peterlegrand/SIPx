CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationCreate] (
	@UITermID int, 
	@LanguageID int, 
	@Customization nvarchar(max)) 
AS 
INSERT INTO UITermLanguageCustomizations (
	UITermID
	, LanguageID
	, Customization
	) VALUES (
	@UITermID
	, @languageID
	, @Customization
	)