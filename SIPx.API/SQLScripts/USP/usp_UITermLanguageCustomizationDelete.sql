CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationDelete] (@UITermLanguageID int) 
AS 
DELETE FROM UITermLanguageCustomizations WHERE UITermLanguageID = @UITermLanguageID