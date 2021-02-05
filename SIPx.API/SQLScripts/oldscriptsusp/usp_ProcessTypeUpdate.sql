CREATE PROCEDURE [dbo].[usp_ProcessTypeUpdate] (
	 @ProcessTypeId int
	 , @ProcessTypeLanguageId int
	 , @ProcessTypeGroupId int
	, @ShowInPersonalCalendar bit
	, @ShowInEventCalendar bit
	, @ProcessMultiMax int
	, @Sequence int
	, @IsPersonal bit
	, @ShowInNew bit
	, @ShowInSearch bit
	, @ShowInReports bit
	, @HideEverywhere bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

DECLARE @OldSequence int;
DECLARE @OldProcessTypeGroupId int;
SELECT @OldSequence = Sequence, @OldProcessTypeGroupId = ProcessTypeGroupId FROM ProcessTypes WHERE ProcessTypeId = @ProcessTypeID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTypes SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @OldProcessTypeGroupId = ProcessTypeGroupID
END
ELSE
BEGIN
UPDATE ProcessTypes SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @OldProcessTypeGroupId = ProcessTypeGroupID
END

INSERT INTO ProcessTypes (
	ProcessTypeGroupID
	, ShowInPersonalCalendar
	, ShowInEventCalendar
	, ProcessMultiMax
	, Sequence
	, IsPersonal
	, ShowInNew
	, ShowInSearch
	, ShowInReports
	, HideEverywhere
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeGroupID
	, @ShowInPersonalCalendar
	, @ShowInEventCalendar
	, @ProcessMultiMax
	, @Sequence
	, @IsPersonal
	, @ShowInNew
	, @ShowInSearch
	, @ShowInReports
	, @HideEverywhere
	, @UserID
	, getdate()
	, @UserID
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
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION
