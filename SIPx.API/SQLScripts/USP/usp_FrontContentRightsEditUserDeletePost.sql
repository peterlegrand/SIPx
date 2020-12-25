CREATE PROCEDURE usp_FrontContentRightsEditUserDeletePost (@UserId nvarchar(450), @ContentUserEditId int) 
AS 
DELETE FROM ContentUserEdit WHERE ContentUserEditId = @ContentUserEditId