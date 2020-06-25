CREATE PROCEDURE [dbo].[usp_ProcessTemplateUpdate] (
	 @ProcessTemplateID int
	 , @ProcessTemplateLanguageID int
	 , @ProcessTemplateGroupID int
	, @ShowInPersonalCalendar bit
	, @ShowInEventCalendar bit
	, @ProcessMultiMax int
	, @Sequence int
	, @IsPersonal bit
	, @ShowInNew bit
	, @ShowInSearch bit
	, @ShowInReports bit
	, @HideEverywhere bit
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

DECLARE @OldSequence int;
DECLARE @OldProcessTemplateGroupID int;
SELECT @OldSequence = Sequence, @OldProcessTemplateGroupID = ProcessTemplateGroupID FROM ProcessTemplates WHERE ProcessTemplateID = @ProcessTemplateID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplates SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @OldProcessTemplateGroupID = ProcessTemplateGroupID
END
ELSE
BEGIN
UPDATE ProcessTemplates SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @OldProcessTemplateGroupID = ProcessTemplateGroupID
END

INSERT INTO ProcessTemplates (
	ProcessTemplateGroupID
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
	@ProcessTemplateGroupID
	, @ShowInPersonalCalendar
	, @ShowInEventCalendar
	, @ProcessMultiMax
	, @Sequence
	, @IsPersonal
	, @ShowInNew
	, @ShowInSearch
	, @ShowInReports
	, @HideEverywhere
	, @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION
