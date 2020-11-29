CREATE PROCEDURE [dbo].[usp_ProcessTemplateUpdate] (
	 @ProcessTemplateId int
	 , @ProcessTemplateLanguageId int
	 , @ProcessTemplateGroupId int
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
DECLARE @OldProcessTemplateGroupId int;
SELECT @OldSequence = Sequence, @OldProcessTemplateGroupId = ProcessTemplateGroupId FROM ProcessTemplates WHERE ProcessTemplateId = @ProcessTemplateID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplates SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @OldProcessTemplateGroupId = ProcessTemplateGroupID
END
ELSE
BEGIN
UPDATE ProcessTemplates SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @OldProcessTemplateGroupId = ProcessTemplateGroupID
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
	, @UserID
	, getdate()
	, @UserID
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
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION
