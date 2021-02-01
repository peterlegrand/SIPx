CREATE PROCEDURE usp_ProjectMatrixTypeCreatePost (
	 @Name nvarchar(50)
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

SET XACT_ABORT ON;
BEGIN TRANSACTION



INSERT INTO ProjectMatrixTypes (
	 CreatorID
	, CreatedDate
)
VALUES (
	 @UserID
	, getdate()
)


DECLARE @NewProjectMatrixTypeId int	= scope_identity();

INSERT INTO ChangeLogProjectMatrixTypes (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3965, 1,@NewProjectMatrixTypeId, @UserId,  cast(getdate() as varchar(26)), getdate())

INSERT INTO ChangeLogProjectMatrixTypes (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3966, 1,@NewProjectMatrixTypeId, @UserId,@UserId, getdate())
INSERT INTO ChangeLogProjectMatrixTypes (ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3966, 1,@NewProjectMatrixTypeId, @UserId, cast(@NewProjectMatrixTypeId as varchar(10)), getdate())

select getdate()

INSERT INTO ProjectMatrixTypeLanguages (
	ProjectMatrixTypeID
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
	@NewProjectMatrixTypeId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	DECLARE @NewProjectMatrixTypeLanguageId int	= scope_identity();


INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3954, 1,@NewProjectMatrixTypeId, @UserId, cast(getdate() as varchar(26)), getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3955, 1,@NewProjectMatrixTypeId, @UserId, @UserId, getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3956, 1,@NewProjectMatrixTypeId, @UserId, @Description, getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3957, 1,@NewProjectMatrixTypeId, @UserId, cast(@LanguageId as varchar(3)), getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3958, 1,@NewProjectMatrixTypeId, @UserId, @MenuName, getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3959, 1,@NewProjectMatrixTypeId, @UserId, cast(getdate() as varchar(26)), getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3960, 1,@NewProjectMatrixTypeId, @UserId, @UserId, getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3961, 1,@NewProjectMatrixTypeId, @UserId, @MouseOver, getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3962, 1,@NewProjectMatrixTypeId, @UserId, @Name, getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3963, 1,@NewProjectMatrixTypeId, @UserId, cast(@NewProjectMatrixTypeId as varchar(10)), getdate())

INSERT INTO ChangeLogProjectMatrixTypeLanguages(ColumnId, ChangeTypeId, RecordId, UserId, NewValue, ChangeLogDate)
VALUES(3964, 1,@NewProjectMatrixTypeId, @UserId, cast(@NewProjectMatrixTypeLanguageId as varchar(10)), getdate())

COMMIT TRANSACTION


