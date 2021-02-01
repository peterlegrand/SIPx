CREATE PROCEDURE [dbo].[usp_ClassificationUpdatePost] (
	@ClassificationId int
	, @StatusId int
	, @DefaultPageId int
	, @HasDropDown bit
	, @DropDownSequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9) 
	, @IconId int 
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


DECLARE @StatusIdOld int
DECLARE  @DefaultPageIdOld int
DECLARE  @HasDropDownOld bit
DECLARE  @DropDownSequenceOld int
DECLARE  @NameOld nvarchar(50)
DECLARE  @DescriptionOld nvarchar(max)
DECLARE  @MenuNameOld nvarchar(50)
DECLARE  @MouseOverOld nvarchar(50)
DECLARE  @ColorOld char(9) 
DECLARE  @IconIdOld int 

SELECT @NameOld = Name , @DescriptionOld = Description, @MenuNameOld = MenuName, @MouseOverOld = MouseOver
FROM ClassificationLanguages WHERE ClassificationID = @ClassificationId AND LanguageID = @LanguageId
SELECT @StatusIdOld = StatusId , @DefaultPageIdOld = DefaultPageID , @HasDropDownOld = HasDropDown , @DropDownSequenceOld = DropDownSequence, @ColorOld = Color , @IconIdOld = IconID
FROM Classifications WHERE ClassificationID = @ClassificationId

DECLARE @StatusIdColumnId int;
DECLARE  @DefaultPageIdColumnId int
DECLARE  @HasDropDownColumnId int
DECLARE  @DropDownSequenceColumnId int
DECLARE  @NameColumnId int
DECLARE  @DescriptionColumnId int
DECLARE  @MenuNameColumnId int
DECLARE  @MouseOverColumnId int
DECLARE  @ColorColumnId int
DECLARE  @IconIdColumnId int

SELECT @StatusIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'StatusID';
SELECT @DefaultPageIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'DefaultPageId';
SELECT @HasDropDownColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'HasDropDown';
SELECT @DropDownSequenceColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'DropDownSequence';
SELECT @NameColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'Name';
SELECT @DescriptionColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'Description';
SELECT @MenuNameColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'MenuName';
SELECT @MouseOverColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ClassificationLanguages' AND ColumnName = 'MouseOver';
SELECT @ColorColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'Color';
SELECT @IconIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'Classifications' AND ColumnName = 'IconId';

DECLARE @OldSequence int;
SELECT @OldSequence = DropDownSequence FROM Classifications  WHERE ClassificationID= @ClassificationID;
SET XACT_ABORT ON;
BEGIN TRANSACTION

--fill change log
IF @StatusId <> @StatusIdOld
BEGIN
INSERT ChangeLogClassifications (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@StatusIdColumnId,2,@ClassificationId,@UserId,CAST(@StatusIdOld as varchar(10)),CAST(@StatusId as varchar(10)),GETDATE())
END

IF @DefaultPageId <> @DefaultPageIdOld
BEGIN
INSERT ChangeLogClassifications (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@DefaultPageIdColumnId,2,@ClassificationId,@UserId,CAST(@DefaultPageIdOld as varchar(10)),CAST(@DefaultPageId as varchar(10)),GETDATE())
END

IF @HasDropDown <> @HasDropDownOld
BEGIN
INSERT ChangeLogClassifications (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@HasDropDownColumnId,2,@ClassificationId,@UserId,CAST(@HasDropDownOld as varchar(10)),CAST(@HasDropDown as varchar(10)),GETDATE())
END

IF @DropDownSequenceOld <> @DropDownSequence
BEGIN
INSERT ChangeLogClassifications (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@DropDownSequenceColumnId,2,@ClassificationId,@UserId,CAST(@DropDownSequenceOld as varchar(10)),CAST(@DropDownSequence as varchar(10)),GETDATE())
END

IF @NameOld <> @Name
BEGIN
INSERT ChangeLogClassificationLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@NameColumnId,2,@ClassificationId,@UserId,@NameOld,@Name,GETDATE())
END

IF @DescriptionOld <> @Description
BEGIN
INSERT ChangeLogClassificationLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@DescriptionColumnId,2,@ClassificationId,@UserId,@DescriptionOld,@Description,GETDATE())
END

IF @MenuNameOld <> @MenuName
BEGIN
INSERT ChangeLogClassificationLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@MenuNameColumnId,2,@ClassificationId,@UserId,@MenuNameOld,@MenuName,GETDATE())
END

IF @MouseOverOld <> @MouseOver
BEGIN
INSERT ChangeLogClassificationLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@MouseOverColumnId,2,@ClassificationId,@UserId,@MouseOverOld,@MouseOver,GETDATE())
END

IF @ColorOld <> @Color
BEGIN
INSERT ChangeLogClassifications (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@ColorColumnId,2,@ClassificationId,@UserId,@ColorOld,@Color,GETDATE())
END

IF @IconIdOld <> @IconId
BEGIN
INSERT ChangeLogClassifications (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@IconIdColumnId,2,@ClassificationId,@UserId,CAST(@IconIdOld as varchar(10)),CAST(@IconId as varchar(10)),GETDATE())
END

--END Change log


IF @OldSequence > @DropDownSequence
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence + 1 WHERE DropDownSequence < @DropDownSequence AND DropDownSequence >= @OldSequence
END
ELSE
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence <= @DropDownSequence AND DropDownSequence > @OldSequence
END

UPDATE Classifications SET 
	StatusId = @StatusID
	, DefaultPageId = @DefaultPageID
	, HasDropDown = @HasDropDown
	, DropDownSequence = @DropDownSequence
	, Color = @Color
	, IconId = @IconId
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationId = @ClassificationID

UPDATE  ClassificationLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationId = @ClassificationID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


