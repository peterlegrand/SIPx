CREATE PROCEDURE [dbo].[usp_ClassificationValueViewGet] (@LanguageId Int, @ClassificationID Int )
	AS 
	--https://www.sqlservertutorial.net/sql-server-basics/sql-server-recursive-cte/
		WITH StructureClassificationValues (
			ClassificationID
			, ParentValueID
			, ClassificationValueID
			, Level
			, Path)
		AS (
			SELECT 
				ClassificationValues.ClassificationID
				, ClassificationValues.ParentValueID
                , ClassificationValues.ClassificationValueID
                , 0 AS level
                , CAST(ClassificationValues.ClassificationValueID AS VARCHAR(255)) AS Path
			FROM ClassificationValues 
            JOIN ClassificationValueLanguages 
				ON ClassificationValues.ClassificationValueID = ClassificationValueLanguages.ClassificationValueID
			WHERE (
				ClassificationValues.ParentValueID IS NULL 
				OR ClassificationValues.ParentValueID = 0
				)
                AND ClassificationValueLanguages.LanguageId = @LanguageId
                AND ClassificationValues.ClassificationId = @ClassificationID
           
			UNION ALL
           
			SELECT 
				ClassificationValues.ClassificationID
				, ClassificationValues.ParentValueID
                , ClassificationValues.ClassificationValueID
                , level + 1 level
                , CAST(StructureClassificationValues.Path + '.' + CAST(ClassificationValues.ClassificationValueID AS VARCHAR(255)) AS VARCHAR(255)) path
			FROM ClassificationValues
            JOIN ClassificationValueLanguages
				ON ClassificationValues.ClassificationValueID = ClassificationValueLanguages.ClassificationValueID
			JOIN StructureClassificationValues
				ON StructureClassificationValues.ClassificationValueID = ClassificationValues.ParentValueID
			WHERE ClassificationValueLanguages.LanguageId = @LanguageId
				AND ClassificationValues.ClassificationId = @ClassificationID
		)

		SELECT 
			StructureClassificationValues.ClassificationID
			, ISNULL(StructureClassificationValues.ParentValueID,0) ParentId
            , StructureClassificationValues.ClassificationValueID
			, Level
			, Path
			, ISNULL(UserClassificationValueLanguages.Name, ISNULL(DefaultClassificationValueLanguages.Name, '')) Name 
			, ISNULL(UserClassificationValueLanguages.Description, ISNULL(DefaultClassificationValueLanguages.Description, '')) Description 
			, ISNULL(UserClassificationValueLanguages.MenuName, ISNULL(DefaultClassificationValueLanguages.MenuName, '')) MenuName 
			, ISNULL(UserClassificationValueLanguages.MouseOver, ISNULL(DefaultClassificationValueLanguages.MouseOver, '')) MouseOver 
			, ISNULL(UserClassificationValueLanguages.DropDownName, ISNULL(DefaultClassificationValueLanguages.DropDownName, '')) DropDownName 
			, ISNULL(UserClassificationValueLanguages.PageName, ISNULL(DefaultClassificationValueLanguages.PageName, '')) PageName 
			, ISNULL(UserClassificationValueLanguages.PageDescription, ISNULL(DefaultClassificationValueLanguages.PageDescription, '')) PageDescription
			, ISNULL(UserClassificationValueLanguages.HeaderName, ISNULL(DefaultClassificationValueLanguages.HeaderName, '')) HeaderName
			, ISNULL(UserClassificationValueLanguages.HeaderDescription, ISNULL(DefaultClassificationValueLanguages.HeaderDescription, '')) HeaderDescription
			, ISNULL(UserClassificationValueLanguages.TopicName, ISNULL(DefaultClassificationValueLanguages.TopicName, '')) TopicName
			, CAST(CASE WHEN UserClassificationValueLanguages.Name IS NULL AND DefaultClassificationValueLanguages.Name IS NOT NULL THEN 1 ELSE 0 END AS bit) DefaultClassificationValueLanguage
			, ClassificationValues.DateFrom
			, ClassificationValues.DateTo
			, ClassificationValues.CreatedDate
			, ClassificationValues.ModifiedDate
			, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
			, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
		FROM StructureClassificationValues 
		LEFT JOIN (
			SELECT * 
			FROM ClassificationValueLanguages 
			WHERE ClassificationValueLanguages.LanguageID = @LanguageId
		) UserClassificationValueLanguages
			ON StructureClassificationValues.ClassificationValueID = UserClassificationValueLanguages.ClassificationValueID
		LEFT JOIN (
			SELECT ClassificationValueLanguages.* 
			FROM ClassificationValueLanguages 
			JOIN Settings 
				ON ClassificationValueLanguages.LanguageID = Settings.IntValue 
			WHERE Settings.SettingID = 1
		) DefaultClassificationValueLanguages
			ON StructureClassificationValues.ClassificationValueID = DefaultClassificationValueLanguages.ClassificationValueID
		JOIN ClassificationValues
			ON ClassificationValues.ClassificationValueID = StructureClassificationValues.ClassificationValueID
		JOIN AspNetUsers Creator
			ON Creator.Id = ClassificationValues.CreatorID
		JOIN AspNetUsers Modifier
			ON Modifier.Id = ClassificationValues.ModifierID
		ORDER BY Path
