CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationCreate] (
	@UITermId int, 
	@LanguageId int, 
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