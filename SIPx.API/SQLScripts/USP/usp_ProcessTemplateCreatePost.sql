CREATE PROCEDURE usp_ProcessTemplateCreatePost (
	 @ProcessTemplateGroupId int
	, @ShowInPersonalCalendar bit
	, @ShowInOrganizationCalendar bit
	, @ShowInProjectCalendar bit
	, @ShowInEventCalendar bit
	, @ProcessMultiMax int
	, @Sequence int
	, @IsPersonal bit
	, @ShowInNew bit
	, @ShowInSearch bit
	, @ShowInReports bit
	, @HideEverywhere bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9)
	, @IconID int
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTemplates SET Sequence = Sequence + 1 
WHERE ProcessTemplateGroupId = @ProcessTemplateGroupID
	AND Sequence >= @Sequence

INSERT INTO ProcessTemplates (
	ProcessTemplateGroupID
	, ShowInPersonalCalendar
	, ShowInOrganizationCalendar
	, ShowInProjectCalendar
	, ShowInEventCalendar
	, ProcessMultiMax
	, Sequence
	, IsPersonal
	, ShowInNew
	, ShowInSearch
	, ShowInReports
	, HideEverywhere
	, Color 
	, IconID 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateGroupID
	, @ShowInPersonalCalendar
	, @ShowInOrganizationCalendar
	, @ShowInProjectCalendar
	, @ShowInEventCalendar
	, @ProcessMultiMax
	, @Sequence
	, @IsPersonal
	, @ShowInNew
	, @ShowInSearch
	, @ShowInReports
	, @HideEverywhere
	, @Color 
	, @IconID 
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewProcessTemplateId int	= scope_identity();

INSERT INTO ProcessTemplateLanguages (
	ProcessTemplateID
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
	@NewProcessTemplateId 
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
