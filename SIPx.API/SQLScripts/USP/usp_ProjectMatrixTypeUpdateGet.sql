CREATE PROCEDURE usp_ProjectMatrixTypeUpdateGet (@UserId nvarchar(450),@ProjectMatrixTypeId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'ProjectMatrixType', 'Edit',1,'',@ProjectMatrixTypeId,@UserId

SELECT ProjectMatrixTypes.ProjectMatrixTypeID
	, ProjectMatrixTypeLanguages.ProjectMatrixTypeLanguageID
	, ProjectMatrixTypeLanguages.Name
	, ProjectMatrixTypeLanguages.Description
	, ProjectMatrixTypeLanguages.MenuName
	, ProjectMatrixTypeLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectMatrixTypes.CreatedDate
FROM ProjectMatrixTypes 
JOIN ProjectMatrixTypeLanguages 
	ON ProjectMatrixTypes.ProjectMatrixTypeId = ProjectMatrixTypeLanguages.ProjectMatrixTypeID
JOIN Persons Creator
	ON Creator.UserId = ProjectMatrixTypes.CreatorID
WHERE ProjectMatrixTypeLanguages.LanguageId = @LanguageID
	AND ProjectMatrixTypes.ProjectMatrixTypeId = @ProjectMatrixTypeID

COMMIT TRANSACTION


