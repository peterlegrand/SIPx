CREATE PROCEDURE usp_FrontContentRightsUpdatePostCheck (
@ContentId int
	, @IsRelationBasedEdit bit
	, @IsRelationBasedRead bit
	, @IsProjectBasedEdit bit
	, @IsProjectBasedEditSub bit
	, @IsProjectBasedEditParent bit
	, @IsOrganizationBasedEdit bit
	, @IsOrganizationBasedEditSub bit
	, @IsOrganizationBasedEditParent bit
	, @IsProjectBasedRead bit
	, @IsProjectBasedReadSub bit
	, @IsProjectBasedReadParent bit
	, @IsOrganizationBasedRead bit
	, @IsOrganizationBasedReadSub bit
	, @IsOrganizationBasedReadParent bit
	, @OwnerId nvarchar(450)
	, @UserId nvarchar(450)
)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 

DECLARE @ErrorIdsTable TABLE (id int)

SELECT ErrorMessages.ErrorMessageID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM @ErrorIdsTable Errors 
JOIN ErrorMessages 
	ON Errors.id = ErrorMessages.ErrorMessageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ErrorMessages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageID

END
