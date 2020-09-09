CREATE PROCEDURE [dbo].[usp_ProcessTemplateUpdatePost] (
	@ProcessTemplateId int
	, @ProcessTemplateGroupId int
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
	, @Color nchar(9)
	, @IconId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @ModifierId nvarchar(450)
)
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ProcessTemplates  WHERE ProcessTemplateID= @ProcessTemplateID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplates SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE ProcessTemplates SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ProcessTemplates SET 
		ProcessTemplateGroupId  = @ProcessTemplateGroupId 
	, ShowInPersonalCalendar = @ShowInPersonalCalendar 
	, ShowInOrganizationCalendar = @ShowInOrganizationCalendar 
	, ShowInProjectCalendar  = @ShowInProjectCalendar 
	, ShowInEventCalendar = @ShowInEventCalendar 
	, ProcessMultiMax  = @ProcessMultiMax 
	, Sequence  = @Sequence 
	, IsPersonal  = @IsPersonal 
	, ShowInNew = @ShowInNew 
	, ShowInSearch = @ShowInSearch 
	, ShowInReports= @ShowInReports 
	, HideEverywhere=@HideEverywhere 
	, Color=@Color 
	, IconId=@IconId 
	, ModifierId=@ModifierId
	, ModifiedDate = getdate()
WHERE ProcessTemplateId = @ProcessTemplateID

UPDATE  ProcessTemplateLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE ProcessTemplateId = @ProcessTemplateID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


