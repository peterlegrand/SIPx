CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeLanguageCreate] (
	@ClassificationRelationTypeId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
INSERT INTO ClassificationRelationTypeLanguages (ClassificationRelationTypeId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, CreatedDate, ModifierId, ModifiedDate)
VALUES (@ClassificationRelationTypeId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId, getdate(), @UserId, getdate())
