CREATE PROCEDURE usp_ProjectMatrixTypeUpdatePost (
	@ProjectMatrixTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


DECLARE  @NameOld nvarchar(50)
DECLARE  @DescriptionOld nvarchar(max)
DECLARE  @MenuNameOld nvarchar(50)
DECLARE  @MouseOverOld nvarchar(50)

SELECT @NameOld = Name , @DescriptionOld = Description, @MenuNameOld = MenuName, @MouseOverOld = MouseOver
FROM ProjectMatrixTypeLanguages WHERE ProjectMatrixTypeID = @ProjectMatrixTypeId AND LanguageID = @LanguageId



DECLARE  @NameColumnId int
DECLARE  @DescriptionColumnId int
DECLARE  @MenuNameColumnId int
DECLARE  @MouseOverColumnId int

SELECT @NameColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId 
WHERE TableName = 'ProjectMatrixTypeLanguages' AND ColumnName = 'Name';
SELECT @DescriptionColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId 
WHERE TableName = 'ProjectMatrixTypeLanguages' AND ColumnName = 'Description';
SELECT @MenuNameColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectMatrixTypeLanguages' AND ColumnName = 'MenuName';
SELECT @MouseOverColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'ProjectMatrixTypeLanguages' AND ColumnName = 'MouseOver';

SET XACT_ABORT ON;
BEGIN TRANSACTION

--fill change log

IF @NameOld <> @Name
BEGIN
INSERT ChangeLogProjectMatrixTypeLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@NameColumnId,2,@ProjectMatrixTypeId,@UserId,@NameOld,@Name,GETDATE())
END

IF @DescriptionOld <> @Description
BEGIN
INSERT ChangeLogProjectMatrixTypeLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@DescriptionColumnId,2,@ProjectMatrixTypeId,@UserId,@DescriptionOld,@Description,GETDATE())
END

IF @MenuNameOld <> @MenuName
BEGIN
INSERT ChangeLogProjectMatrixTypeLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@MenuNameColumnId,2,@ProjectMatrixTypeId,@UserId,@MenuNameOld,@MenuName,GETDATE())
END

IF @MouseOverOld <> @MouseOver
BEGIN
INSERT ChangeLogProjectMatrixTypeLanguages (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@MouseOverColumnId,2,@ProjectMatrixTypeId,@UserId,@MouseOverOld,@MouseOver,GETDATE())
END


--END Change log


UPDATE  ProjectMatrixTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProjectMatrixTypeId = @ProjectMatrixTypeID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


