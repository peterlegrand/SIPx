CREATE PROCEDURE usp_MVCUIScreenContentCreatePost (
	@ContentId int
	, @MetaContentTypeId int
	, @MVCUIScreenId int
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO MetaContents (
	ContentId
	, MetaContentTypeId
	, MetaTypeId
	, MetaRecordId
	, CreatorID
	, CreatedDate
)
VALUES (
	@ContentId
	, @MetaContentTypeId
	, 1
	, @MVCUIScreenId 
	, @UserID
	, getdate()
)

DECLARE @NewMetaContentId int	= scope_identity();

INSERT INTO ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3813, 1, cast(@NewMetaContentId as varchar(10)), @UserId, cast(@ContentId as varchar(10)), getdate())

INSERT INTO ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3814, 1, cast(@NewMetaContentId as varchar(10)), @UserId, cast(getdate() as varchar(26)), getdate())

INSERT INTO ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3815, 1, cast(@NewMetaContentId as varchar(10)), @UserId, @UserId, getdate())

INSERT INTO ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3816, 1, cast(@NewMetaContentId as varchar(10)), @UserId, cast(@NewMetaContentId as varchar(10)), getdate())

INSERT INTO ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3817, 1, cast(@NewMetaContentId as varchar(10)), @UserId, cast(@MetaContentTypeId as varchar(10)), getdate())

INSERT INTO ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3818, 1, cast(@NewMetaContentId as varchar(10)), @UserId, cast(@MVCUIScreenId as varchar(10)), getdate())

INSERT INTO ChangeLogMetaContents (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3813, 1, cast(@NewMetaContentId as varchar(10)), @UserId, 1, getdate())


COMMIT TRANSACTION

