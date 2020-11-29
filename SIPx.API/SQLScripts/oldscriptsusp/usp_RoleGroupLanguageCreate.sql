CREATE PROCEDURE [dbo].[usp_RoleGroupLanguageCreate] (
	@RoleGroupId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
INSERT INTO RoleGroupLanguages (RoleGroupId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, CreatedDate, ModifierId, ModifiedDate)
VALUES (@RoleGroupId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId, getdate(), @UserId, getdate())

