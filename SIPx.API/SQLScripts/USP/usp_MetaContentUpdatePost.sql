CREATE PROCEDURE usp_MetaContentUpdatePost (
	@MetaContentId int
	, @ContentId int
	, @MetaContentTypeId int
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

--PETER TODO we will not use this sp as we don't modify. Only create
DECLARE @ContentIdOld int
DECLARE  @MetaContentTypeIdOld int

SELECT @ContentIdOld = ContentId , @MetaContentTypeIdOld = MetaContentTypeId
FROM MetaContents WHERE MetaContentID = @MetaContentId 

DECLARE @ContentIdColumnId int;
DECLARE  @MetaContentTypeIdColumnId int

SELECT @ContentIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'MetaContents' AND ColumnName = 'ContentID';
SELECT @MetaContentTypeIdColumnId = ColumnId FROM DataDictionaryColumns JOIN DataDictionaryTables ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId WHERE TableName = 'MetaContents' AND ColumnName = 'MetaContentTypeId';

SET XACT_ABORT ON;
BEGIN TRANSACTION

--fill change log
IF @ContentId <> @ContentIdOld
BEGIN
INSERT ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@ContentIdColumnId,2,@MetaContentId,@UserId,CAST(@ContentIdOld as varchar(10)),CAST(@ContentId as varchar(10)),GETDATE())
END

IF @MetaContentTypeIdOld <> @MetaContentTypeId
BEGIN
INSERT ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, OldValue, NewValue, ChangeLogDate) 
VALUES(@MetaContentTypeIdColumnId,2,@MetaContentId,@UserId,CAST(@MetaContentTypeIdOld as varchar(10)),CAST(@MetaContentTypeId as varchar(10)),GETDATE())
END

--END Change log

UPDATE MetaContents SET 
	ContentId = @ContentId
	, MetaContentTypeId = @MetaContentTypeId
WHERE MetaContentId = @MetaContentID

COMMIT TRANSACTION


