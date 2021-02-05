CREATE PROCEDURE [dbo].[usp_ProjectTypeUpdatePost] (
	@ProjectTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @ObjectTypeStatusId int
	, @HasAnyChildProject bit
	, @HasAnyMatrixProject bit
	, @Color char(9) 
	, @IconId int 
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ProjectTypes SET 
	 Color = @Color
	, IconId = @IconId
	, CodePrefix = @CodePrefix
	, CodeSuffix = @CodeSuffix
	, CodeTypeId = @CodeTypeId
	, ObjectTypeStatusId = @ObjectTypeStatusId
	, HasAnyChildProject = @HasAnyChildProject 
	, HasAnyMatrixProject =@HasAnyMatrixProject 
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE ProjectTypeId = @ProjectTypeID

UPDATE  ProjectTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE ProjectTypeId = @ProjectTypeID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


