CREATE PROCEDURE [dbo].[usp_ProcessTemplateCreate] (
	 @ProcessTemplateGroupID int
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

UPDATE ProcessTemplates SET Sequence = Sequence + 1 
WHERE ProcessTemplateGroupID = @ProcessTemplateGroupID
	AND Sequence >= @Sequence

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
