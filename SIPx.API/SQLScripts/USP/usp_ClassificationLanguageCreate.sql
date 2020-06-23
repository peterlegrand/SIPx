CREATE PROCEDURE [dbo].[usp_ClassificationLanguageCreate] (
	@ClassificationID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
INSERT INTO ClassificationLanguages (ClassificationID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@ClassificationID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @User, getdate(), @User, getdate())
