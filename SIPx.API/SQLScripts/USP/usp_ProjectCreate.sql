CREATE PROCEDURE [dbo].[usp_ProjectCreate] (
	@ParentProjectID int
	, @StatusID int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
