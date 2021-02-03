CREATE PROCEDURE usp_ContentTypeReturnCodeTypeId ( @ContentTypeId int)
AS 
SELECT CodeTypeId 
FROM ContentTypes 

WHERE ContentTypes.ContentTypeId = @ContentTypeId