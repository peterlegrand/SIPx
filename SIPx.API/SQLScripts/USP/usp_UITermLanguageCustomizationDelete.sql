CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationDelete] (@UITermLanguageId int) 
AS 
DELETE FROM UITermLanguageCustomizations WHERE UITermLanguageId = @UITermLanguageID
