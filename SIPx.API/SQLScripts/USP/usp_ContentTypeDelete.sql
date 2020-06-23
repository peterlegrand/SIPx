CREATE PROCEDURE [dbo].[usp_ContentTypeDelete] (
	@ContentTypeID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ContentTypeLanguages WHERE @ContentTypeID = ContentTypeID
DELETE FROM ContentTypeClassifications WHERE @ContentTypeID = ContentTypeID
DELETE FROM ContentTypes WHERE @ContentTypeID = ContentTypeID
COMMIT TRANSACTION