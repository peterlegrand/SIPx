CREATE PROCEDURE [dbo].[usp_ProjectUpdatePost] (
	@ProjectId int
	, @ProjectTypeId int
	, @StatusId int 
	, @SecurityLevelId int
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

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE Projects SET
	ProjectTypeID = @ProjectTypeId
	, StatusId = @StatusID
	, SecurityLevelId = @SecurityLevelId
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE 
	ProjectId = @ProjectID

UPDATE ProjectLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProjectId = @ProjectID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION
