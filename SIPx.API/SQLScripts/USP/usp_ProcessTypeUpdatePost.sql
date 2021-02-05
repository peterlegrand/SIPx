CREATE PROCEDURE [dbo].[usp_ProcessTypeUpdatePost] (
	@ProcessTypeId int
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @ObjectTypeStatusId int
	, @ProcessTypeGroupId int
	, @ShowInPersonalCalendar bit
	, @ShowInOrganizationCalendar bit
	, @ShowInProjectCalendar bit
	, @ShowInEventCalendar bit
	, @ProcessMultiMax int
	, @Sequence int
	, @IsPersonal bit
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
SELECT @OldSequence = Sequence FROM ProcessTypes  WHERE ProcessTypeID= @ProcessTypeID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTypes SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE ProcessTypes SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ProcessTypes SET 
		ProcessTypeGroupId  = @ProcessTypeGroupId 
	, CodePrefix =@CodePrefix 
	, CodeSuffix =@CodeSuffix 
	, CodeTypeId =@CodeTypeId 
	, ObjectTypeStatusId = @ObjectTypeStatusId
	, ShowInPersonalCalendar = @ShowInPersonalCalendar 
	, ShowInOrganizationCalendar = @ShowInOrganizationCalendar 
	, ShowInProjectCalendar  = @ShowInProjectCalendar 
	, ShowInEventCalendar = @ShowInEventCalendar 
	, ProcessMultiMax  = @ProcessMultiMax 
	, Sequence  = @Sequence 
	, IsPersonal  = @IsPersonal 
	, Color=@Color 
	, IconId=@IconId 
	, ModifierId=@ModifierId
	, ModifiedDate = getdate()
WHERE ProcessTypeId = @ProcessTypeID

UPDATE  ProcessTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE ProcessTypeId = @ProcessTypeID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


