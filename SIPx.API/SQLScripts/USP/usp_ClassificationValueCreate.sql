CREATE PROCEDURE [dbo].[usp_ClassificationValueCreate] (
	@ClassificationID int
	, @ParentID int = NULL
	, @DateFrom datetime = NULL
	, @DateTo datetime = NULL
	, @Location geography = NULL
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownName nvarchar(50)
	, @PageName nvarchar(50)
	, @PageDescription nvarchar(max)
	, @HeaderName nvarchar(50)
	, @HeaderDescription nvarchar(max)
	, @TopicName nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ClassificationValues (
	ClassificationID
	, ParentValueID
	, DateFrom
	, DateTo
	, Location
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ClassificationID
	, @ParentID
	, @DateFrom
	, @DateTo
	, @Location
	, @User
	, getdate()
	, @User
	, getdate())


DECLARE @NewClassificationValueId int	= scope_identity();

INSERT INTO ClassificationValueLanguages (
	ClassificationValueID
	, ClassificationID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, DropDownName
	, PageName
	, PageDescription
	, HeaderName
	, HeaderDescription
	, TopicName
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewClassificationValueId 
	, @ClassificationID 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @DropDownName
	, @PageName
	, @PageDescription
	, @HeaderName
	, @HeaderDescription
	, @TopicName
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION
