CREATE PROCEDURE usp_FrontContentRightsEditUserDeletePost (@ContentUserEditId int) 
AS 
DELETE FROM ContentUserEdit WHERE ContentUserEditId = @ContentUserEditId