CREATE PROCEDURE usp_MetaContentCreatePost (
	@ContentId int
	, @MetaContentTypeId int
	, @MetaTypeId int
	, @MetaRecordId int
	, @UserId nvarchar(450)) 
AS 

INSERT INTO MetaContents (
	ContentId 
	, MetaContentTypeId 
	, MetaTypeId 
	, MetaRecordId 
	, CreatorID
	, CreatedDate)
VALUES (
	@ContentId 
	, @MetaContentTypeId 
	, @MetaTypeId 
	, @MetaRecordId 
	, @UserID
	, getdate()
)
