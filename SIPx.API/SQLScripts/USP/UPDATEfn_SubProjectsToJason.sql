ALTER Function fn_SubProjectsToJason(@ProjectId INT, @IsRoot INT, @UserId nvarchar(450) ) 
RETURNS VARCHAR(MAX)
BEGIN 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

    DECLARE @Json NVARCHAR(MAX) = '{}', @Name NVARCHAR(MAX) , @Children                 NVARCHAR(MAX)

    SET @Json =  
    (SELECT 
	ISNULL(UserProjectLanguage.Name
		,ISNULL(DefaultProjectLanguage.Name
			,'No name')) Name
	,JSON_QUERY(dbo.fn_SubProjectsToJason(Projects.ProjectId, 2, @UserId) ) AS Children 
    FROM Projects  
	LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectID= Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Projects.ProjectID

    WHERE Projects.ParentProjectID = @ProjectId 
    FOR JSON AUTO);

    IF(@IsRoot = 1) 
    BEGIN
       SELECT @Name = 	ISNULL(UserProjectLanguage.Name
		,ISNULL(DefaultProjectLanguage.Name
			,'No name')) 

	   FROM Projects
	   	LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
			ON UserProjectLanguage.ProjectID= Projects.ProjectID
		LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
			ON DefaultProjectLanguage.ProjectId = Projects.ProjectID

WHERE Projects.ProjectId = @ProjectId
       SET @Json =   '{"Name":"' + @Name + '","SubProjects":' + CAST(@Json AS NVARCHAR(MAX)) + '}'
       SET @IsRoot = 2
    END

    RETURN @Json 
END 