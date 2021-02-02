CREATE PROCEDURE usp_MVCUIScreenContentUpdateGet (@UserId nvarchar(450),@MetaContentId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'MetaContent', 'Edit',1,'',@MetaContentId,@UserId

SELECT MetaContents.MetaContentID
	, MetaContents.ContentId 
	, MetaContents.MetaContentTypeId
	, MetaContents.MetaRecordId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, MetaContents.CreatedDate
FROM MetaContents 
JOIN Persons Creator
	ON Creator.UserId = MetaContents.CreatorID
WHERE  MetaContents.MetaContentId = @MetaContentID

COMMIT TRANSACTION


