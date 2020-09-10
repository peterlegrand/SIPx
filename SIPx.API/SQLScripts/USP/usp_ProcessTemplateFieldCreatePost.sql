CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldCreatePost] (
	@ProcessTemplateId int
	, @ProcessTemplateFieldTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorId
	AND UserPreferences.PreferenceTypeId = 1 ;
BEGIN TRANSACTION

INSERT INTO ProcessTemplateFields (
	ProcessTemplateID
	, ProcessTemplateFieldTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateID
	, @ProcessTemplateFieldTypeID
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewProcessTemplateFieldId int	= scope_identity();

INSERT INTO ProcessTemplateFieldLanguages (
	ProcessTemplateFieldID
	,ProcessTemplateID
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
	@NewProcessTemplateFieldId 
	,@ProcessTemplateID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

	COMMIT TRANSACTION


