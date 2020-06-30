CREATE PROCEDURE [dbo].[usp_ProjectCreate] (
	@ParentProjectId int
	, @StatusId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
BEGIN TRANSACTION
INSERT INTO Projects (
	ParentProjectID
	, StatusID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ParentProjectID
	, @StatusID
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	DECLARE @NewProjectId int	= scope_identity();

INSERT INTO ProjectLanguages (
	ProjectID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewProjectId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION
