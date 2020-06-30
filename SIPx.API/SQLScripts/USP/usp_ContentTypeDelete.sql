CREATE PROCEDURE [dbo].[usp_ContentTypeDelete] (
	@ContentTypeId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ContentTypeLanguages WHERE @ContentTypeId = ContentTypeID
DELETE FROM ContentTypeClassifications WHERE @ContentTypeId = ContentTypeID
DELETE FROM ContentTypes WHERE @ContentTypeId = ContentTypeID
COMMIT TRANSACTION