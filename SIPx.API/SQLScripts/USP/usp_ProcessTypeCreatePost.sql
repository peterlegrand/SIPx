CREATE PROCEDURE usp_ProcessTypeCreatePost (
	 @ProcessTypeGroupId int
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @ObjectTypeStatusId int
	, @ShowInPersonalCalendar bit
	, @ShowInOrganizationCalendar bit
	, @ShowInProjectCalendar bit
	, @ShowInEventCalendar bit
	, @ProcessMultiMax int
	, @Sequence int
	, @IsPersonal bit
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
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTypes SET Sequence = Sequence + 1 
WHERE ProcessTypeGroupId = @ProcessTypeGroupID
	AND Sequence >= @Sequence

INSERT INTO ProcessTypes (
	ProcessTypeGroupID
	, CodePrefix 
	, CodeSuffix 
	, CodeTypeId 
	, ObjectTypeStatusId
	, ShowInPersonalCalendar
	, ShowInOrganizationCalendar
	, ShowInProjectCalendar
	, ShowInEventCalendar
	, ProcessMultiMax
	, Sequence
	, IsPersonal
	, Color 
	, IconID 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeGroupID
	, @CodePrefix 
	, @CodeSuffix 
	, @CodeTypeId 
	, @ObjectTypeStatusId
	, @ShowInPersonalCalendar
	, @ShowInOrganizationCalendar
	, @ShowInProjectCalendar
	, @ShowInEventCalendar
	, @ProcessMultiMax
	, @Sequence
	, @IsPersonal
	, @Color 
	, @IconID 
	, @UserId
	, getdate()
	, @UserId
	, getdate())


DECLARE @NewProcessTypeId int	= scope_identity();

INSERT INTO ProcessTypeLanguages (
	ProcessTypeID
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
	@NewProcessTypeId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	COMMIT TRANSACTION
